# CrayOn: A Distributed Memory Architecture for Processing Deep Convolutional Network

## What is this?

[Paper Here](https://benhal.com/crayon)

CrayOn is an FPGA based processor dedicated to _Convolutional Neural Networks_, a well known image understanding algorithm.

It relies both on a massively parallel/pipelined arrangement of its arithmetic, and on a distributed organization of its internal memory, to speed up the processing of images with such models. 

I started this project in the BREIL, an AI lab located in the Korean Advanced Institue of Science and Technology (KAIST).

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

I eventually decided to release this project under MIT license. So here we go:


```
MIT License

Copyright (c) 2016-2021, Benjamin D. Halimi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```



