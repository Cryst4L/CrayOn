////////////////////////////////////////////////////////////
// This tool can be used to mix the different heat maps, 
// using a winner's take all policy and to superpose the 
// resulting parsing to the input image.
// ---------------------------------------------------------
// The rendering of the resulting frame is based upon 
// the Standard and Fast Multimedia Library (SFML 2.3)
////////////////////////////////////////////////////////////

#pragma once

#include <SFML/Graphics.hpp>
#include "Frame.h"
#include "Canva.h"
#include "Target.h"

static const sf::Color palette[5] = {
	sf::Color::Blue, 
	sf::Color::Red, 
	sf::Color::Yellow,
	sf::Color::Green,
	sf::Color::Magenta,
};

class Monitor {
 private :
 	static const int WASHING  = 4;		
 	static const double THRES = 0.75;	
  	static const double RATIO = 0.25;
 	
 	int m_zoom;
	int m_stride;
	
	Frame m_input;
	std::vector <Frame> m_heat_maps;
	Frame m_parsing;

	sf::Image m_screen_image;
	sf::Texture m_screen_texture;
	sf::Sprite m_screen_sprite;
	sf::RenderWindow m_window;

	Canva m_canva;
	sf::Color blend(sf::Color a, sf::Color b, double ratio);

	void refine();
	void process();

 public :
	Monitor(int width, int height);
	void update();
	
	void setStride(int stride);
	void setInput(Frame& input);
	void pushHeatMap(Frame& heat_map);
	void setZoom(int zoom);
};