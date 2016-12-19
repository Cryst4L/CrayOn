////////////////////////////////////////////////////////////
// Simple image manipulation tool                           
// ---------------------------------------------------------
// Can be used to load, resize, and crop input frames before
// sending them to the FPGA accelerator, as well as for the 
// post-processing of the output heat maps.                  
////////////////////////////////////////////////////////////

#pragma once

#include <string>
#include <iostream>
#include <cmath>

#include <SFML/Graphics.hpp>
#include "Frame.h"

class Canva {
 public : 
	Canva();
	Frame load(const std::string& filename);
	void blur(Frame& input, int radius, double sigma=0.25);
	void normalize(Frame& input, int radius);
	void resize(Frame& input, double scale);
	void autoCrop(Frame& input, int width, int height);
	void save(Frame& input, const std::string& filename);
};