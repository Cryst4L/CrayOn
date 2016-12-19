#include "../include/Interface.h"

void Interface::loadInputTile(int i, int j) {
	int anchor_x = i * (m_tile_in.width() - m_overlap);
	int anchor_y = j * (m_tile_in.height() - m_overlap);

	for (int x = 0; x < m_tile_in.width(); x++)
		for (int y = 0; y < m_tile_in.height(); y++)
			m_tile_in(x, y) = m_input(anchor_x + x, anchor_y + y);
}

void Interface::updateGrid() {
	m_rows = (m_input.width() - m_overlap) / (m_tile_in.width() - m_overlap);
	m_cols = (m_input.height() - m_overlap) / (m_tile_in.height() - m_overlap);

	int width = (m_tile_out.width() - m_spare) * m_rows;
	int height = (m_tile_out.height() - m_spare) * m_cols;

	for (int label = 0; label < m_outputs.size(); label++)
		m_outputs[label].realloc(width, height);
}

void Interface::fillOutputTile(int i, int j, int label) {
	if (i > m_rows || j > m_cols) return;

	int anchor_x = i * (m_tile_out.width() - m_spare);
	int anchor_y = j * (m_tile_out.height() - m_spare);

	// Last line correction (should be fixed in the FPGA design)
	for (int x = 0; x < m_tile_out.width(); x++) {
		int value = m_tile_out(x, m_tile_out.height() - 2);
		m_tile_out(x, m_tile_out.height() - 1) = value;
	}
	
	for (int x = 0; x < m_tile_out.width() - m_spare; x++)
		for (int y = 0; y < m_tile_out.height() - m_spare; y++) {
			int value = m_tile_out(m_spare + x, m_spare + y);
			m_outputs[label](anchor_x + x, anchor_y + y) = value;
		}
}

////////////////////////////////////////////////////////////////////////////////

Interface::Interface(const char * descriptor)
	: m_rows(0), m_cols(0),
	  m_delay(0),	m_overlap(0), m_spare(0),
	  m_transceiver("transceiver") {
	  
	m_tile_in.realloc(MEM_WIDTH, MEM_HEIGHT);
	
	m_transceiver.setTxPayload(TX_PAYLOAD);
	m_transceiver.setRxPayload(RX_PAYLOAD);

	Frame output_init;
	m_outputs.push_back(output_init);
	
	setArch(descriptor);
}

void Interface::push(const Frame & frame) {
	m_input = frame;
	updateGrid();
}

void Interface::process() {
	double device_time = 0;	
	for (int i = 0; i < m_rows; i++) {
		for (int j = 0; j < m_cols; j++) {
			loadInputTile(i, j);
			m_tile_in.complement();
			m_transceiver.setData((char *) m_tile_in.data());

			m_transceiver.tx();
			m_transceiver.irq(0);
			m_timer.sleep(m_delay);
			m_transceiver.rx();

			int data_size = m_tile_out.width() * m_tile_out.height();
			for (int label = 0; label < m_outputs.size(); label++) {
				m_tile_out.load((BYTE *) m_transceiver.getData() + label * data_size);
				m_tile_out.complement();
				fillOutputTile(i, j, label);
			}			
		}
	}
//	std::cout << "# device time  : " << device_time / (m_rows * m_cols)  << " (ms)" << std::endl;
}

Frame & Interface::pull(int label) { return m_outputs[label]; }

///////////////////////////////////////////////////////////////////////////////
void Interface::load(const char* filename, char mode)
{
    std::ifstream file(filename);    
    if (!file) {
		std::cout << "# [load_error] failed to open '" << filename << "' !\n";
		exit(1);  
    }

	// Parse the input file
	std::vector <int> table;
    std::string line, number;
	std::string::iterator it;
	
    while (std::getline(file, line)) {
		if (line[0] != ';' && line[0] != 'm') {
			number = "";
			it = line.begin();
			while (*it != '\0') {
				if (*it == ',' || *it == ';') {
					int value;
					sscanf(number.c_str(), "%x", &value);
					table.push_back(value);
					number = "";
				} else {
					number += *it;
				}
				++it;
			}		
		}
	}	
//	std::cout << "n_words : " << table.size() << "\n----\n";
		
	// Format it in a byte array
	char data[2 * table.size()];
	for(int i = 0; i < table.size(); i++) {
		data[2 * i] = table[i] >> 8;
		data[2 * i + 1] = table[i] & 0x00FF;
	}
		
	// Push the into CrayOn
	char buffer[TX_PAYLOAD] = {};
	
	if (mode == 'p') {
	
		std::cout << "# Loading the µ-program memory ... \n";
		std::copy(data, data + sizeof(data), buffer);
		m_transceiver.setData(buffer);
		m_transceiver.tx();
		
		m_transceiver.irq(2);
		m_timer.sleep(10);
		
	} else if (mode == 'k') {
	
		int chunk_size = 65536;
		int n_chunks = (sizeof(data) + chunk_size - 1) / chunk_size;
//		std::cout << "n_chunks : " << n_chunks << "\n----\n";
		std::cout << "# Loading the network's parameters ... \n";		

		int index = 0;
		for (int i = 0; i < n_chunks; i++) {
			if (i == (n_chunks - 1)) {
				chunk_size = sizeof(data) % chunk_size;
				std::fill(buffer, buffer + TX_PAYLOAD, 0);
			}
//			std::cout << index << " -> " << (index + chunk_size - 1) << std::endl;
			for (int j = 0; j < chunk_size; j++, index++){
				buffer[j] = data[index];
			}
			m_transceiver.setData(buffer);
			m_transceiver.tx();
			m_transceiver.irq(1 + (i << 2));
			m_timer.sleep(5);
		}
		
	} else {
		std::cout << "# [load_error] Unsupported loading mode !\n";
		exit(1);
	}
}

////////////////////////////////////////////////////////////////////////////////

void Interface::setDelay(double delay) { m_delay = delay; }

void Interface::setLabelNb(int number) { 
	if (number > 0) {
		Frame clean = m_outputs[0];
		clean.fill(0);

		m_outputs.clear();

		for (int label = 0; label < number; label++)
			m_outputs.push_back(clean);
	}
}

void Interface::setArch(const char * descriptor) {
	m_spare	= 0;
	m_overlap = 1;
	
	std::vector <char> types;
	std::vector <int> params;

	int stride = 1;
	std::string stage;
	std::string strn(descriptor);
	std::stringstream strm(strn);

    while (std::getline(strm, stage, '-')) {
	    char * end;
    	int param = std::strtol(stage.substr(1).c_str(), &end, 10);

		if ((stage[0] != 'c' && stage[0] != 'p') || end == 0) {
			std::cout << "# [init_error] Invalid layer description : " << stage << std::endl;
			exit(1);
		} else {
 			types.push_back(stage[0]);
 			params.push_back(param);
 //			std::cout << stage[0] << " - " << param << std::endl;
 		}
	}
 		
 	for (int i = 0; i < types.size(); i++) {
 		if (types[i] == 'c') {
 			m_spare += params[i] - 1;
 		} else {
 			m_spare	/= params[i];
 			stride  *= params[i];
 		}
 	}
	
 	for (int i = types.size()-1; i >= 0; i--) {
 		if (types[i] == 'c') {
 			m_overlap += params[i] - 1;
 		} else {
 			m_overlap *= params[i];
 		}
	}	
	
	m_overlap -= stride;
	
	int width = MEM_WIDTH / stride;
	int height = MEM_HEIGHT / stride;
	
	m_tile_out.realloc(width, height); 
	updateGrid();
//	std::cout << stride << ' ' << m_spare << ' ' << m_overlap << std::endl;
}
