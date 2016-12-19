////////////////////////////////////////////////////////////
// Simple class implementing a target asset that can be 
// used to display the detected objects.
////////////////////////////////////////////////////////////
#pragma once

#include <SFML/Graphics.hpp>

class Target {
  private :
	int m_radius;
	sf::Vector2f m_position;
	sf::CircleShape m_shape;
  public :	
	Target(sf::Color color, int size);
	void setPosition(int x, int y);
	void draw(sf::RenderWindow& window);
};