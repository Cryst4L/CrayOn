##################################################################
# Host: Example host software for the CrayOn convolutional neural
# network processor instanciated on the ZTEX 2.16 FPGA board.
# Author: B.Halimi - 2015 - bhalimi@outlook.fr
project (host)
cmake_minimum_required (VERSION 2.8)
##################################################################
# OPTIONS
set(CMAKE_CXX_FLAGS "-O2")
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/..)
##################################################################
# FIND
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake/)
find_package(SFML COMPONENTS system window graphics REQUIRED)
find_package(USB REQUIRED)
find_package(PNG REQUIRED)
##################################################################
# INCLUDE
include_directories(
	${SFML_INCLUDE_DIR}
	${USB_INCLUDE_DIRS}
	${PNG_INCLUDE_DIR}
)
##################################################################
# DECLARE
set(PROJECT
  main.cpp
)
set(SRC
	src/Monitor.cpp
	src/Canva.cpp
	src/Interface.cpp
	src/Transceiver.cpp
	src/Frame.cpp
	src/Target.cpp
	src/Timer.cpp
)
##################################################################
# TARGET
add_executable(host
	${PROJECT}
	${SRC}
)
##################################################################
# LINK
target_link_libraries(host
	${SFML_LIBRARIES}
	${USB_LIBRARIES}	
	${PNG_LIBRARY}
)
##################################################################