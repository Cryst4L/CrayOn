#include "../include/Frame.h"

Frame::Frame()
:	m_width(0), m_height(0), m_data(NULL)
{}

Frame::Frame(int width, int height)
	: m_width(width), m_height(height) {
	m_data = new BYTE[m_width * m_height];
}

Frame::Frame(const Frame &frame)
	: m_data(NULL), m_width(0), m_height(0) {
	*this = frame; // overloaded '=' is used
}

Frame& Frame::operator=(const Frame &frame) {
	if (this != &frame) {
		m_width = frame.m_width;
		m_height = frame.m_height;

		delete [] m_data;
		m_data = new BYTE[frame.m_width * frame.m_height];
		std::copy(frame.m_data, frame.m_data + m_width * m_height, m_data);
	}
	return *this;
}

Frame::~Frame() {
	delete [] m_data;
	m_data = NULL;
}

BYTE& Frame::operator()(int x, int y) {
	return m_data[m_width * y + x];
}

/////////////////////////////////////////////////////////////////////////////////////

int Frame::width() { return m_width; }

int Frame::height() { return m_height; }

/////////////////////////////////////////////////////////////////////////////////////

void Frame::load(BYTE* data) {
	std::copy(data, data + m_width * m_height, m_data);
}

BYTE* Frame::data() { 
	return m_data; 
}

/////////////////////////////////////////////////////////////////////////////////////

Frame& Frame::realloc(int width, int height) {
	m_width = width;
	m_height = height;
	delete [] m_data;
	m_data =  new BYTE[width * height];
	return *this;  
}

Frame& Frame::fill(int value) {
	std::fill(m_data, m_data + m_width * m_height, value);
	return *this;  
}

Frame& Frame::crop(int anchor_x, int anchor_y, int width, int height) {

	if (anchor_x >= 0 && (anchor_x +  width) <= m_width && 
		anchor_y >= 0 && (anchor_y + height) <= m_height) {
		Frame output(width, height);

		for (int x = 0; x < width; x++)	
			for (int y = 0; y < height; y++)
				output(x, y) = operator()(anchor_x + x, anchor_y + y);

		*this = output;		
	} else {
		std::cout << "# [error] Cropping out of the input boundaries !\n";
		std::exit(1);
	}
	return *this;  
}

Frame& Frame::complement() {
	for (int i = 0; i < m_width * m_height; i++) {
		m_data[i] += 128;
	}	
	return *this;
}

