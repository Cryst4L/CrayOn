#include "../include/Monitor.h"

Monitor::Monitor(int width, int height)
	: m_stride(1), m_zoom(1) {
	m_window.create(sf::VideoMode(width, height), "Monitor", sf::Style::Close);
}

void Monitor::update() {

	if (m_heat_maps.size() < 2) {
		std::cout << "# [error] At least two labels are required !\n";
		exit(1);
	}

	sf::Event event;
	while (m_window.pollEvent(event)) {
	    if (event.type == sf::Event::Closed)
			exit(0);
	}
			
	refine();	
	process();

	m_heat_maps.clear();
	m_window.display();
}

//////////////////////////////////////////////////////////////////////

sf::Color Monitor::blend(sf::Color a, sf::Color b, double ratio) {

	sf::Color m;
	m.r = (1 - ratio) * a.r + ratio * b.r;
	m.g = (1 - ratio) * a.g + ratio * b.g;
	m.b = (1 - ratio) * a.b + ratio * b.b;
	return m;
}

void Monitor::refine() {

	// rectification
	for (int i = 0; i < m_heat_maps.size(); i++)
		for (int x = 0; x < m_heat_maps[i].width(); x++)
			for (int y = 0; y < m_heat_maps[i].height(); y++) {
				int heat = m_heat_maps[i](x, y);
				heat = std::min(255, std::max(0, (heat - 127) * 4)); // (heat - 127) * 4;
				m_heat_maps[i](x, y) = heat;
			}
			
	// washing
	for (int i = 0; i < m_heat_maps.size(); i++)
		m_canva.blur(m_heat_maps[i], WASHING); 
}

void Monitor::process() {

	int width = m_input.width();
	int height = m_input.height();

	int map_width = m_heat_maps[0].width();
	int map_height = m_heat_maps[0].height();

	int anchor_x = (width  - m_stride *  map_width) * 0.5;
	int anchor_y = (height - m_stride * map_height) * 0.5;
	
	// parsing	
	m_parsing.realloc(width, height).fill(0);

	for (int x = 0; x < map_width; x++)
		for (int y = 0; y < map_height; y++) {

			int label = 0;
			int heat = 0;

			for (int i = 0; i < m_heat_maps.size(); i++)
				if (m_heat_maps[i](x, y) > heat) {
					heat = m_heat_maps[i](x, y);	
					label = i+1;
				}
			
			if (heat < THRES * 256) label = 0;

			for (int dx = 0; dx < m_stride; dx++)	
				for (int dy = 0; dy < m_stride; dy++) {
					int pos_x = anchor_x + m_stride * x + dx;
					int pos_y = anchor_y + m_stride * y + dy;
					m_parsing(pos_x, pos_y) = label;
				}
		}
		
	// blending
	m_screen_image.create(width, height);

	for (int x = 0; x < width; x++)
		for (int y = 0; y < height; y++) {
			int value = m_input(x, y);
			sf::Color input_color = sf::Color(value, value, value);
			sf::Color label_color = palette[m_parsing(x, y)];

			sf::Color blended = blend(input_color, label_color, RATIO);
			m_screen_image.setPixel(x, y, blended);
		}

	// rendering
	m_screen_texture.loadFromImage(m_screen_image);
	m_screen_sprite.setTexture(m_screen_texture, true);

	m_window.setSize(sf::Vector2u(m_zoom * width, m_zoom * height));
	m_window.draw(m_screen_sprite);
	
	// detection
	for (size_t label = 0; label < m_heat_maps.size(); label++) {

		int nms_rad = 3;
		std::vector <sf::Vector2i> peaks;
		for (int x = 0; x < map_width - 2 * nms_rad; x++)
			for (int y = 0; y < map_height - 2 * nms_rad; y++) {
		
				bool is_peak = true;
				int value = m_heat_maps[label](x + nms_rad, y + nms_rad);
			
				for(int dx = 0; dx < (2 * nms_rad + 1); dx++)
					for(int dy = 0; dy < (2 * nms_rad + 1); dy++)
						if (value < m_heat_maps[label](x + dx, y + dy))
							is_peak = false;

				if (is_peak && value > (THRES * 255))
					peaks.push_back(sf::Vector2i(x + nms_rad, y + nms_rad));
			}
		
		std::vector <int> counts;
		std::vector <sf::Vector2f> clusters;
		for (int i = 0; i< peaks.size(); i++)
		{
			int j = 0;
			bool merged = false;
			while (j < clusters.size() && !merged) {
				int dx = std::abs(clusters[j].x - peaks[i].x);
				int dy = std::abs(clusters[j].y - peaks[i].y);
				if (dx < nms_rad && dy < nms_rad) {
					int n = counts[j];
					clusters[j].x = (clusters[j].x * n + peaks[i].x) / (n + 1);
					clusters[j].y = (clusters[j].y * n + peaks[i].y) / (n + 1);
					counts[j]++;
					merged = true;
				}
				j++;
			}	
			if (!merged) { 
				clusters.push_back((sf::Vector2f) peaks[i]);
				counts.push_back(0);
			}
		}
		
		Target target(palette[label+1], 16);

		for (size_t i = 0; i < clusters.size(); i++) {
			int x = (clusters[i].x + 0.5) * m_stride + anchor_x;
			int y = (clusters[i].y + 0.5) * m_stride + anchor_y;
			target.setPosition(x, y);
			target.draw(m_window);
		}
	}
}

//////////////////////////////////////////////////////////////////////

void Monitor::setStride(int stride) { m_stride = stride; }

void Monitor::setInput(Frame& input) { m_input = input; }

void Monitor::pushHeatMap(Frame& heat_map) { m_heat_maps.push_back(heat_map); }

void Monitor::setZoom(int zoom) { m_zoom = zoom; }
