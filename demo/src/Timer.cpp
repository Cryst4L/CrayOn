/*
 * Timer definitions
 */

#include "../include/Timer.h"

Timer::Timer() {}

void Timer::reset() { gettimeofday(&t0, NULL); }

float Timer::getMillisec() {
	gettimeofday(&t1, NULL);
	float time = 
		(t1.tv_sec - t0.tv_sec) * 1e3 +
		(t1.tv_usec - t0.tv_usec) / 1e3;
	return time;
}

void Timer::sleep(double time) {
	unsigned int usec = time * 1e3;
	usleep(usec);
}

Timer::~Timer() {}

