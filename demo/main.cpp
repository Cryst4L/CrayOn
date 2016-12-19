#include <iostream>
#include <sstream>
#include <iomanip>

#include "include/Frame.h"
#include "include/Canva.h"
#include "include/Interface.h"
#include "include/Monitor.h"
#include "include/Timer.h"

int main(int argc, char *argv[])
{
	// Constants declaration ////////////////////////////////////////////////////////
	const int N_OUT		= 3;
	const double DELAY	= 8.0; //5.7; // (ms)
	const char * ARCH	= "c9-p2-c9-p2-c9-p2-c9";

	const int H_SIZE	= 720;
	const int V_SIZE	= 240;
	const char * FOLDER	= "../data/kitti-51/";
	
	// Init /////////////////////////////////////////////////////////////////////////
	Interface CrayOn(ARCH);
	CrayOn.setDelay(DELAY);
	CrayOn.setLabelNb(N_OUT);

	Monitor monitor(H_SIZE, V_SIZE);
	monitor.setStride(8);
	monitor.setZoom(2);
	
	Timer timer;
	Canva canva;
	
	// Load the program and parameters //////////////////////////////////////////////
	CrayOn.load("../coe/p_xz11.coe", 'p');
	CrayOn.load("../coe/k_xz11.coe", 'k');

	for (int k = 0; k < 1000; k++) 
	{
		// Load the input ///////////////////////////////////////////////////////////
		std::stringstream path;
		path << FOLDER << std::setfill('0') << std::setw(10) << k << ".png";

		Frame input = canva.load(path.str());
		canva.resize(input, 0.64);
		canva.autoCrop(input, H_SIZE, V_SIZE);
		
		CrayOn.push(input);

		// FPGA based processing ////////////////////////////////////////////////////
		timer.reset();
		CrayOn.process();
		std::cout << "# Input N-" << k << " processed  ";
		std::cout << "[t = " << timer.getMillisec() << " ms]    \r" << std::flush;
		
		// Visualization ////////////////////////////////////////////////////////////
		monitor.setInput(input);
		for (int i = 1; i < N_OUT; i++)
			monitor.pushHeatMap(CrayOn.pull(i));
		monitor.update();
		timer.sleep(50);
	}
	
	std::cout << "Work is done !" << std::endl;
    return EXIT_SUCCESS;
}