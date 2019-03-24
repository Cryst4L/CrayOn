# CrayOn: A Distributed Memory Architecture for Processing Deep Convolutional Network

## What is this?

CrayOn is an FPGA based processor dedicated to _Convolutional Neural Networks_, a well know image understanding algorithm.

It relies both on a massively parallel/pipelined arrangement of its arithmetic, and on a distributed organization of its internal memory, to speed up the processing of images with such models. 

I started this project in the BREIL, an AI lab located in the Korean Advanced Institue of Sience and Technology (KAIST).

<p align="center">
  <img src="https://github.com/Cryst4L/CrayOn/blob/master/assets/set-App.png"/>
</p>


The design itself is described in VHDL-98, and targets Xilinx Series 7 FPGAs, thus making an extensive use of their specific discrete components, such as the cascaded DSP blocks and RAM based FIFO's.

Once instanciated on a (low-end) Artix 200T chip, the design delivers up to 261 GOp/s, with an internal bandwith peaking at 4.8 GT/s. 

In the end, the whole system is roughly 8 times faster than an I5 (Skylake) CPU on some benchmark applications, while consuming 10 times less power.

The following diagram shows the occupation of the Artix 200T chip:

<p align="center">
  <img src="https://github.com/Cryst4L/CrayOn/blob/master/assets/plan-III-BR.png"/>
</p>


## Project Architecture

The project is organized into 4 distinct folders:

* "**fpga**" gathers the sources of the design, splited in two directories: "src" which contains the plain HDL files and "coregen" where are stored the generated Xilinx cores, such as block RAMs or DPS lines.


* "**firmware**" contains everything which is related to the ZTEX board we used to benchmark the design: the configurations of the USB controller (which enables to communicate with the design), as well as scripts to load theses configurations and the FPGA bitstream inside the board.


* "**training**" contains a Torch-7 interface that can be used to train the Convolutional Networks, produce the kernel and memory files, and compile the micro-program of CrayOn. It comes up with a toy example for seting up a face detector.


* "**demo**" is an example C++ host application, which uses CrayOn inside a real time pedestrian and vehicle detection pipeline.

The entire project (i.e. the one on my machine) also goes with a set of tools for testing and analysing the performances of the design, but I thougth theses tools were not relevant enough to be uploaded. 


## Copyright

I pushed this work on GitHub for the curious minds who would be interested to see how it is crafted.

But as I'm not sure what kind of second life I want to give to this project, I deciced [not to provide a license](http://choosealicense.com/no-license/) for now.

So technically, everything excepted the firmware sources, is "All Right Reserved" to me B.H. 

That being said, I might switch to a GPL at some points.  
