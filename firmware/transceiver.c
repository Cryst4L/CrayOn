/*!
	This program is based on example codes from the ZTEX SDK 2.0.
	For more information about ZTEX GmbH visit: http://www.ztex.de

	The modifications were made to interface the FX2-LP device
	in high-speed with our transceiver core, 'usbrxtx' on a 2.16 module.

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License version 3 as
	published by the Free Software Foundation.

	This program is distributed in the hope that it will be useful, but
	WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
	General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, see http://www.gnu.org/licenses/.
!*/

#include[ztex-conf.h]	// Loads the configuration macros, see ztex-conf.h for the available macros
#include[ztex-utils.h]	// include basic functions

// configure endpoint 2, in, quad buffered, 512 bytes, interface 0
EP_CONFIG(2,0,BULK,IN,512,4);

// configure endpoint 6, out, double buffered, 512 bytes, interface 0
EP_CONFIG(6,0,BULK,OUT,512,4);

// select ZTEX USB FPGA Module 2.16 as target (required for FPGA configuration)
IDENTITY_UFM_2_16(10.16.0.0,0);	 

// this product string is also used for identification by the host software
#define[PRODUCT_STRING]["transceiver"]

// enable Flash support
ENABLE_FLASH;

// enables high speed FPGA configuration via EP6
ENABLE_HS_FPGA_CONF(6);

#define[MT_RUN][IOA3]
#define[MT_MODE][IOA7]
#define[MT_RESET][IOA0]
#define[MT_START][IOA1]


// this is called automatically after FPGA configuration
#define[POST_FPGA_CONFIG][POST_FPGA_CONFIG
    reset ();
]

// Send data to the device
ADD_EP0_VENDOR_COMMAND((0x80,,send();,,NOP;));;

void send ()
{
	MT_MODE = 0;			// set mode to RX (device)
	SYNCDELAY;	
	MT_START = 1;			// assert the start
	SYNCDELAY;
	MT_START = 0; 			// clear the start bit	
}

// Recall data to the host
ADD_EP0_VENDOR_COMMAND((0x81,,receive();,,NOP;));;

void receive ()
{
	MT_MODE = 1;			// set mode to TX (device)
	SYNCDELAY;
	MT_START = 1;			// assert the start
	SYNCDELAY;
	MT_START = 0; 			// clear the start bit	
}

// Configure and start a processing task
ADD_EP0_VENDOR_COMMAND((0x82,,request();,,NOP;));;

void request ()
{
	IOC = SETUPDAT[2];		// specify the request
	SYNCDELAY;
	MT_RUN = 1;				// assert the interrupt flag
	SYNCDELAY;
	MT_RUN = 0;				// clear the interrupt flag
}

// Reset
ADD_EP0_VENDOR_COMMAND((0x83,,reset();,,NOP;));;

void reset () {
	OEA = bmBIT0 | bmBIT1 | bmBIT7 | bmBIT3;	// reset, start, run and mode
	OEB = 0;
	OEC = bmBIT0 | bmBIT1 | bmBIT2 | bmBIT3;	// request word
	OED = 0;
	
	IOC = 0;	
	
	MT_RESET = 1;
	MT_START = 0;
	
	EP2CS &= ~bmBIT0;			// clear stall bit
	EP6CS &= ~bmBIT0;			// clear stall bit

	IFCONFIG = bmBIT7 | bmBIT6 | bmBIT5 | 3;  // internal 48MHz clock, drive IFCLK output, slave FIFO interface
	SYNCDELAY; 
                     
	REVCTL = 0x1;
	SYNCDELAY; 

	FIFORESET = 0x80;			// reset FIFO ...
	SYNCDELAY;
	FIFORESET = 2;				// ... for EP 2
	SYNCDELAY;
	FIFORESET = 0x00;
	SYNCDELAY;
	FIFORESET = 6;				// ... for EP 6
	SYNCDELAY;
	FIFORESET = 0x00;
	SYNCDELAY;

	EP2FIFOCFG = bmBIT0; 
	SYNCDELAY;
	EP2FIFOCFG = bmBIT3 | bmBIT0;  		// EP2: AUTOIN, WORDWIDE
	SYNCDELAY;
	EP2AUTOINLENH = 2;     			// 512 bytes 
	SYNCDELAY;
	EP2AUTOINLENL = 0;
	SYNCDELAY;

	EP6FIFOCFG = bmBIT0;         		
	SYNCDELAY;
	EP6FIFOCFG = bmBIT4 | bmBIT0;		// EP6: AUTOOUT bit arms the FIFO, WORDWIDE
	SYNCDELAY;

	FIFOPINPOLAR = 0;
	SYNCDELAY; 
	PINFLAGSAB = 0xca;			// FLAGA: EP6: EF; FLAGB: EP2 FF
	SYNCDELAY; 

	wait(2);
	MT_RESET = 0;
}


// include the ZTEX libraries
#include[ztex.h]

void main(void)	
{
    init_USB();
    while (1) {}
}
