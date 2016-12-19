////////////////////////////////////////////////////////////
// Simple class for hosting FX2-LP usb devices              
////////////////////////////////////////////////////////////

#pragma once

#include <cstdio> 
#include <cstdlib> 
#include <cstring>

#include <usb.h>

#include <string.h>
#include <iostream>

class Transceiver {
 private :

	int m_rx_payload;
	int m_tx_payload;
	
	char* m_rx_buffer;
	char* m_tx_buffer;

	const char* m_id;

	struct usb_device* m_fx2lp;
	usb_dev_handle* m_handle;

	struct usb_device* find_device();
	int compute_payload(int size);

 public : 
	Transceiver(const char* id);

	void setData(char* data);

	void rx();
	void tx();
	void irq(int request);

	char* getData();
	
	void setRxPayload(int size);
	void setTxPayload(int size);

	~Transceiver();
};