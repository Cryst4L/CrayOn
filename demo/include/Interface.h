////////////////////////////////////////////////////////////
// Example interface to the CrayOn FPGA accelerator         
// ---------------------------------------------------------
// Pre-process input frames, send them to the FPGA board.   
// Then pull back the result packets to the host, assemble  
// them, and finally fine tune the obtained frame parsing   
////////////////////////////////////////////////////////////

#pragma once

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>

#include "Timer.h"
#include "Frame.h"
#include "Transceiver.h"

class Interface {
 private :
	static const int MEM_WIDTH	= 320;
	static const int MEM_HEIGHT	= 240;

	Transceiver m_transceiver;
	
	static const int TX_PAYLOAD	= 76800;
	static const int RX_PAYLOAD	= 15360;

	int m_rows;
	int m_cols;

	Frame m_input;

	Frame m_tile_in;
	Frame m_tile_out;

	std::vector <Frame> m_outputs;

	int m_spare;
	int m_overlap;

	Timer m_timer;
	double m_delay;

	void loadInputTile(int i, int j);
	void fillOutputTile(int i, int j, int label);
	void updateGrid();

 public :
	Interface(const char * descriptor);

	void load(const char* filename, char mode);
	
	void push(const Frame& frame);
	void process();
	Frame& pull(int label = 0);

	void setLabelNb(int number);
	void setDelay(double delay);
	void setArch(const char * descriptor);
};