#include "../include/Transceiver.h"

Transceiver::Transceiver(const char* id) : m_id(id) {
	usb_init();
	usb_find_busses();
	usb_find_devices();

	m_fx2lp = find_device();

	if (m_fx2lp == NULL) {
		std::cout << "# [usb_error] Cannot find the FX2-LP device !\n";
		std::cout << "# You may try to run the program as root ...\n";
		exit(1);
	}

	if (usb_claim_interface(m_handle, 0) < 0) {
		std::cout << "[usb_error] Failed at claiming the interface 0 !\n";
		exit(1);
	}

	// allocate the internal buffer
	m_rx_payload = 4096;
	m_tx_payload = 4096;
	
	m_rx_buffer = new char[m_rx_payload];
	m_tx_buffer = new char[m_tx_payload];

	// reset the FX2-LP device 
	std::cout << "# Configuring the FX2-LP controller ...\n";
	usb_control_msg(m_handle, 0x40, 0x83, 0, 0, NULL, 0, 1000);
}

struct usb_device* Transceiver::find_device() {
	struct usb_bus *bus_search;
	struct usb_device *device_search;

	bus_search = usb_busses;
	while (bus_search != NULL) {
	    device_search = bus_search->devices;
	    
	    while (device_search != NULL) {
	        if (device_search->descriptor.idVendor == 0x221a && 
				device_search->descriptor.idProduct == 0x100 ) {
				
				char product_id[256];
	            m_handle = usb_open(device_search);
	            usb_get_string_simple(m_handle, device_search->descriptor.iProduct, product_id, 256);

	            if (!strncmp(m_id, product_id , 16))
	                return device_search;

	            usb_close(m_handle);
	        }
	        device_search = device_search->next;
	    }
	    bus_search = bus_search->next;
	}
	return NULL;
}

void Transceiver::tx() {
	usb_control_msg(m_handle, 0x40, 0x80, 0, 0, NULL, 0, 1000);
	usb_bulk_write(m_handle, 0x06, m_tx_buffer, m_tx_payload, 250);
}

void Transceiver::rx() {
	usb_control_msg(m_handle, 0x40, 0x81, 0, 0, NULL, 0, 1000);
	usb_bulk_read(m_handle, 0x82, m_rx_buffer, m_rx_payload, 250);
}

void Transceiver::irq(int request)
{
	usb_control_msg(m_handle, 0x40, 0x82, request, 0, NULL, 0, 1000);
}

void Transceiver::setData(char* data) { 
	std::memcpy(m_tx_buffer, data, m_tx_payload); 
}

char* Transceiver::getData() { return m_rx_buffer; } 

void Transceiver::setRxPayload(int size) {
	m_rx_payload = size;
	delete [] m_rx_buffer;
	m_rx_buffer = new char[m_rx_payload];
}

void Transceiver::setTxPayload(int size) {
	m_tx_payload = size;
	delete [] m_tx_buffer;
	m_tx_buffer = new char[m_tx_payload];
}

Transceiver::~Transceiver() {}
