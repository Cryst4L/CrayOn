////////////////////////////////////////////////////////////
// Simple class implementing a 2-dimensional short array.  
// We used it for manipulating data frame buffers.
////////////////////////////////////////////////////////////

#pragma once

#include <iostream>
#include <stdint.h>
#include <cstdlib>

typedef unsigned char BYTE;

class Frame {
 private :
	int m_width;
	int m_height;
	BYTE* m_data;

 public :
	// Construction ////////////////////////////////////////
	Frame();
	Frame(int width, int height);
	Frame(const Frame &frame);

	// Base functions //////////////////////////////////////
	int width();
	int height();

	BYTE& operator()(int x, int y);
	Frame& operator=(const Frame &frame);

	// Raw data manipulation ///////////////////////////////
	void load(BYTE* data);
	BYTE* data();
	
	// Advanced functions //////////////////////////////////
	Frame& realloc(int width, int height);
	Frame& crop(int anchor_x, int anchor_y, int width, int height);
	Frame& fill(int value);
	Frame& complement() ;

	// Destruction /////////////////////////////////////////
	~Frame();
};