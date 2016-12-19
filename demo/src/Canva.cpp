#include "../include/Canva.h"

Canva::Canva() {}

Frame Canva::load(const std::string& filename) {
	sf::Image input;
	input.loadFromFile(filename);

	int width  = input.getSize().x;
	int height = input.getSize().y;

	Frame frame(width, height);

	u_char* raw_data = (u_char*) input.getPixelsPtr();

	for (int k = 0; k < width * height; k++)
		frame.data()[k] = raw_data[4 * k];

	return frame;
}

void Canva::resize(Frame& input, double scale) {
    Frame output(
    	std::floor(scale * input.width()), 
    	std::floor(scale * input.height())
    );

	int x, y;
    int p0, p1, p2, p3;
    double x_diff, y_diff;
    double unscale = 1. / scale;

    for (int i = 0; i < output.width(); i++) {
        for (int j = 0; j < output.height(); j++) {
            x = (int) (unscale * i);
            y = (int) (unscale * j);

            x_diff = (unscale * i) - x;
            y_diff = (unscale * j) - y;

            p0 = input(    x,     y);
            p1 = input(x + 1,     y);
            p2 = input(    x, y + 1);
            p3 = input(x + 1, y + 1);

            // Y = p0(1-w)(1-h) + p1(w)(1-h) + p2(h)(1-w) + p3wh
            BYTE value = p0 * (1 - x_diff) * (1 - y_diff)
			              + p1 * (x_diff) * (1 - y_diff)
			              + p2 * (y_diff) * (1 - x_diff)
			              + p3 * (x_diff * y_diff);

			output(i, j) = value;
        }
    }
    input = output;
}


void Canva::autoCrop(Frame& input, int width, int height) {
	int offset_x = 0.5 * (input.width() - width);
	int offset_y = 0.5 * (input.height() - height);
	
	input.crop(offset_x, offset_y, width, height);
}

void Canva::blur(Frame& input, int radius, double sigma) {
	double sum = 0;
	int k_size = 2 * radius + 1;
	
	// build the 1D filter
	double kernel[k_size];
	for (int x = 0; x < k_size; x++) {
		double dx = (x - radius) / (sigma * k_size);
		kernel[x] = std::exp(-0.5 * (dx * dx));
		sum += kernel[x];
	}
	
	for (int x = 0; x < k_size; x++)
		kernel[x] /= sum;
		
	// extend the input
	int x_w = input.width()  + k_size - 1;
	int x_h = input.height() + k_size - 1;
	
	Frame x_buffer(x_w, x_h);	
	for (int x = 0; x < x_w; x++) {
		for (int y = 0; y < x_h; y++) {
			bool v_margin = x < radius || x > (x_w - radius - 1);
			bool h_margin = y < radius || y > (x_h - radius - 1);
						
			if (v_margin || h_margin) {
				x_buffer(x, y) = 0; // 127
			} else {
				int value = input(x - radius, y - radius);
				x_buffer(x, y) = value;
			}
		}
	}
			
	// convolve it with the separated kernel
	Frame h_buffer(input.width(), x_h);
	for (int x = 0; x < h_buffer.width(); x++) {
		for (int y = 0; y < h_buffer.height(); y++) {
			double slice[k_size];
			for (int dx = 0; dx < k_size; dx++)
				slice[dx] = x_buffer(x + dx, y);
					
			double sum = 0;
			for (int dx = 0; dx < k_size; dx++)
				sum += slice[dx] * kernel[dx];
				
			h_buffer(x, y) = sum;
		}
	}
	
	Frame output(input.width(), input.height());
	for (int x = 0; x < output.width(); x++) {
		for (int y = 0; y < output.height(); y++) {
			double slice[k_size];
			for (int dy = 0; dy < k_size; dy++)
				slice[dy] = h_buffer(x, y + dy);
					
			double sum = 0;
			for (int dy = 0; dy < k_size; dy++)
				sum += slice[dy] * kernel[dy];
				
			output(x, y) = sum;
		}
	}

	input = output;
}

void Canva::normalize(Frame& input, int radius) {
	Frame buffer = input;
	blur(buffer, radius);
	
	for (int i = 0; i < input.width() * input.height(); i++) {	
		int value = 127;
		value += input.data()[i] - buffer.data()[i];
		input.data()[i] = std::max(0, std::min(value, 255));
	}
}

void Canva::save(Frame& input, const std::string& filename) {
	int width  = input.width();
	int height = input.height();
	
	sf::Image output;
	output.create(width, height);
	
	u_char* data_p = (u_char*) output.getPixelsPtr();

	for (int k = 0; k < width * height; k++)
		for (int c = 0; c < 3; c++)
			data_p[4 * k + c] = input.data()[k];
			
	output.saveToFile(filename);
}