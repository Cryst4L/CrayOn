////////////////////////////////////////////////////////////
// Timing related stuff
////////////////////////////////////////////////////////////

#pragma once

#include <unistd.h>
#include <sys/time.h>

class Timer {
 private :
	struct timeval t0, t1;
	
 public :
	Timer();
	void reset();
	float getMillisec();
	void sleep(double time_ms);
	~Timer();
};
