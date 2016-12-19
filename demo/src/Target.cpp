#include "../include/Target.h"

Target::Target(sf::Color color, int radius) 
: m_radius(radius), m_shape(sf::CircleShape(radius)) {
	m_shape.setOutlineColor(color);
	m_shape.setOutlineThickness(1.5);
	m_shape.setFillColor(sf::Color::Transparent);
}

void Target::setPosition(int x, int y) {
	m_position = sf::Vector2f(x, y);
}

void Target::draw(sf::RenderWindow& window) {
	sf::Vector2f offset(m_radius, m_radius);

	m_shape.setRadius(m_radius);
	m_shape.setPosition(m_position - offset);
	window.draw(m_shape);
	
	m_shape.setRadius(0.25 * m_radius);
	m_shape.setPosition(m_position - 0.25f * offset);
	window.draw(m_shape);
}