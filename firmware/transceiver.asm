;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (Dec 30 2013) (Linux)
; This file was generated Thu Sep 29 21:48:03 2016
;--------------------------------------------------------
	.module transceiver_tmp
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _spi_write_PARM_2
	.globl _flash_read_PARM_2
	.globl _mac_eeprom_init_hexdigits_1_167
	.globl _EmptyStringDescriptor
	.globl _FullSpeedConfigDescriptor_PadByte
	.globl _FullSpeedConfigDescriptor
	.globl _HighSpeedConfigDescriptor_PadByte
	.globl _HighSpeedConfigDescriptor
	.globl _DeviceQualifierDescriptor
	.globl _DeviceDescriptor
	.globl _configurationString
	.globl _productString
	.globl _manufacturerString
	.globl _main
	.globl _init_USB
	.globl _mac_eeprom_init
	.globl _EP8_ISR
	.globl _EP6_ISR
	.globl _EP4_ISR
	.globl _EP2_ISR
	.globl _EP1OUT_ISR
	.globl _EP1IN_ISR
	.globl _EP0ACK_ISR
	.globl _HSGRANT_ISR
	.globl _URES_ISR
	.globl _SUSP_ISR
	.globl _SUTOK_ISR
	.globl _SOF_ISR
	.globl _abscode_identity
	.globl _init_cpld_fpga_configuration
	.globl _fpga_send_ep0
	.globl _spi_send_ep0
	.globl _spi_read_ep0
	.globl _flash_init
	.globl _flash_write_next
	.globl _flash_write_finish
	.globl _flash_write_finish_sector
	.globl _flash_write_init
	.globl _flash_write
	.globl _flash_write_byte
	.globl _spi_pp
	.globl _flash_read_finish
	.globl _flash_read_next
	.globl _flash_read_init
	.globl _spi_wait
	.globl _spi_deselect
	.globl _spi_select
	.globl _spi_write
	.globl _spi_write_byte
	.globl _flash_read
	.globl _flash_read_byte
	.globl _spi_clocks
	.globl _mac_eeprom_read_ep0
	.globl _mac_eeprom_write
	.globl _mac_eeprom_read
	.globl _eeprom_write_ep0
	.globl _eeprom_read_ep0
	.globl _eeprom_write
	.globl _eeprom_read
	.globl _eeprom_select
	.globl _i2c_waitStop
	.globl _i2c_waitStart
	.globl _i2c_waitRead
	.globl _i2c_waitWrite
	.globl _reset
	.globl _request
	.globl _receive
	.globl _send
	.globl _MEM_COPY1_int
	.globl _uwait
	.globl _wait
	.globl _abscode_intvec
	.globl _EIPX6
	.globl _EIPX5
	.globl _EIPX4
	.globl _PI2C
	.globl _PUSB
	.globl _BREG7
	.globl _BREG6
	.globl _BREG5
	.globl _BREG4
	.globl _BREG3
	.globl _BREG2
	.globl _BREG1
	.globl _BREG0
	.globl _EIEX6
	.globl _EIEX5
	.globl _EIEX4
	.globl _EI2C
	.globl _EUSB
	.globl _ACC7
	.globl _ACC6
	.globl _ACC5
	.globl _ACC4
	.globl _ACC3
	.globl _ACC2
	.globl _ACC1
	.globl _ACC0
	.globl _SMOD1
	.globl _ERESI
	.globl _RESI
	.globl _INT6
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _PF
	.globl _TF2
	.globl _EXF2
	.globl _RCLK
	.globl _TCLK
	.globl _EXEN2
	.globl _TR2
	.globl _CT2
	.globl _CPRL2
	.globl _SM0_1
	.globl _SM1_1
	.globl _SM2_1
	.globl _REN_1
	.globl _TB8_1
	.globl _RB8_1
	.globl _TI_1
	.globl _RI_1
	.globl _PS1
	.globl _PT2
	.globl _PS0
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _IOD7
	.globl _IOD6
	.globl _IOD5
	.globl _IOD4
	.globl _IOD3
	.globl _IOD2
	.globl _IOD1
	.globl _IOD0
	.globl _EA
	.globl _ES1
	.globl _ET2
	.globl _ES0
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _IOC7
	.globl _IOC6
	.globl _IOC5
	.globl _IOC4
	.globl _IOC3
	.globl _IOC2
	.globl _IOC1
	.globl _IOC0
	.globl _SM0_0
	.globl _SM1_0
	.globl _SM2_0
	.globl _REN_0
	.globl _TB8_0
	.globl _RB8_0
	.globl _TI_0
	.globl _RI_0
	.globl _IOB7
	.globl _IOB6
	.globl _IOB5
	.globl _IOB4
	.globl _IOB3
	.globl _IOB2
	.globl _IOB1
	.globl _IOB0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _IOA7
	.globl _IOA6
	.globl _IOA5
	.globl _IOA4
	.globl _IOA3
	.globl _IOA2
	.globl _IOA1
	.globl _IOA0
	.globl _EIP
	.globl _BREG
	.globl _EIE
	.globl _ACC
	.globl _EICON
	.globl _PSW
	.globl _TH2
	.globl _TL2
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _T2CON
	.globl _SBUF1
	.globl _SCON1
	.globl _GPIFSGLDATLNOX
	.globl _GPIFSGLDATLX
	.globl _GPIFSGLDATH
	.globl _GPIFTRIG
	.globl _EP01STAT
	.globl _IP
	.globl _OEE
	.globl _OED
	.globl _OEC
	.globl _OEB
	.globl _OEA
	.globl _IOE
	.globl _IOD
	.globl _AUTOPTRSETUP
	.globl _EP68FIFOFLGS
	.globl _EP24FIFOFLGS
	.globl _EP2468STAT
	.globl _IE
	.globl _INT4CLR
	.globl _INT2CLR
	.globl _IOC
	.globl _AUTOPTRL2
	.globl _AUTOPTRH2
	.globl _AUTOPTRL1
	.globl _AUTOPTRH1
	.globl _SBUF0
	.globl _SCON0
	.globl __XPAGE
	.globl _MPAGE
	.globl _EXIF
	.globl _IOB
	.globl _CKCON
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPS
	.globl _DPH1
	.globl _DPL1
	.globl _DPH0
	.globl _DPL0
	.globl _SP
	.globl _IOA
	.globl _ISOFRAME_COUNTER
	.globl _ep0_vendor_cmd_setup
	.globl _ep0_prev_setup_request
	.globl _GPIF_WAVE_DATA_HSFPGA_12MHZ
	.globl _GPIF_WAVE_DATA_HSFPGA_24MHZ
	.globl _ep0_payload_transfer
	.globl _ep0_payload_remaining
	.globl _SN_STRING
	.globl _MODULE_RESERVED
	.globl _INTERFACE_CAPABILITIES
	.globl _INTERFACE_VERSION
	.globl _FW_VERSION
	.globl _PRODUCT_ID
	.globl _ZTEXID
	.globl _ZTEX_DESCRIPTOR_VERSION
	.globl _ZTEX_DESCRIPTOR
	.globl _OOEC
	.globl _fpga_conf_initialized
	.globl _fpga_flash_result
	.globl _fpga_init_b
	.globl _fpga_bytes
	.globl _fpga_checksum
	.globl _ep0_write_mode
	.globl _ep0_read_mode
	.globl _spi_write_sector
	.globl _spi_need_pp
	.globl _spi_write_addr_lo
	.globl _spi_write_addr_hi
	.globl _spi_buffer
	.globl _spi_last_cmd
	.globl _spi_erase_cmd
	.globl _spi_memtype
	.globl _spi_device
	.globl _spi_vendor
	.globl _flash_ec
	.globl _flash_sectors
	.globl _flash_sector_size
	.globl _flash_enabled
	.globl _config_data_valid
	.globl _mac_eeprom_addr
	.globl _eeprom_write_checksum
	.globl _eeprom_write_bytes
	.globl _eeprom_addr
	.globl _INTVEC_GPIFWF
	.globl _INTVEC_GPIFDONE
	.globl _INTVEC_EP8FF
	.globl _INTVEC_EP6FF
	.globl _INTVEC_EP2FF
	.globl _INTVEC_EP8EF
	.globl _INTVEC_EP6EF
	.globl _INTVEC_EP4EF
	.globl _INTVEC_EP2EF
	.globl _INTVEC_EP8PF
	.globl _INTVEC_EP6PF
	.globl _INTVEC_EP4PF
	.globl _INTVEC_EP2PF
	.globl _INTVEC_EP8ISOERR
	.globl _INTVEC_EP6ISOERR
	.globl _INTVEC_EP4ISOERR
	.globl _INTVEC_EP2ISOERR
	.globl _INTVEC_ERRLIMIT
	.globl _INTVEC_EP8PING
	.globl _INTVEC_EP6PING
	.globl _INTVEC_EP4PING
	.globl _INTVEC_EP2PING
	.globl _INTVEC_EP1PING
	.globl _INTVEC_EP0PING
	.globl _INTVEC_IBN
	.globl _INTVEC_EP8
	.globl _INTVEC_EP6
	.globl _INTVEC_EP4
	.globl _INTVEC_EP2
	.globl _INTVEC_EP1OUT
	.globl _INTVEC_EP1IN
	.globl _INTVEC_EP0OUT
	.globl _INTVEC_EP0IN
	.globl _INTVEC_EP0ACK
	.globl _INTVEC_HISPEED
	.globl _INTVEC_USBRESET
	.globl _INTVEC_SUSPEND
	.globl _INTVEC_SUTOK
	.globl _INTVEC_SOF
	.globl _INTVEC_SUDAV
	.globl _INT12VEC_IE6
	.globl _INT11VEC_IE5
	.globl _INT10VEC_GPIF
	.globl _INT9VEC_I2C
	.globl _INT8VEC_USB
	.globl _INT7VEC_USART1
	.globl _INT6VEC_RESUME
	.globl _INT5VEC_T2
	.globl _INT4VEC_USART0
	.globl _INT3VEC_T1
	.globl _INT2VEC_IE1
	.globl _INT1VEC_T0
	.globl _INT0VEC_IE0
	.globl _EP8FIFOBUF
	.globl _EP6FIFOBUF
	.globl _EP4FIFOBUF
	.globl _EP2FIFOBUF
	.globl _EP1INBUF
	.globl _EP1OUTBUF
	.globl _EP0BUF
	.globl _GPIFABORT
	.globl _GPIFREADYSTAT
	.globl _GPIFREADYCFG
	.globl _XGPIFSGLDATLNOX
	.globl _XGPIFSGLDATLX
	.globl _XGPIFSGLDATH
	.globl _EP8GPIFTRIG
	.globl _EP8GPIFPFSTOP
	.globl _EP8GPIFFLGSEL
	.globl _EP6GPIFTRIG
	.globl _EP6GPIFPFSTOP
	.globl _EP6GPIFFLGSEL
	.globl _EP4GPIFTRIG
	.globl _EP4GPIFPFSTOP
	.globl _EP4GPIFFLGSEL
	.globl _EP2GPIFTRIG
	.globl _EP2GPIFPFSTOP
	.globl _EP2GPIFFLGSEL
	.globl _GPIFTCB0
	.globl _GPIFTCB1
	.globl _GPIFTCB2
	.globl _GPIFTCB3
	.globl _FLOWSTBHPERIOD
	.globl _FLOWSTBEDGE
	.globl _FLOWSTB
	.globl _FLOWHOLDOFF
	.globl _FLOWEQ1CTL
	.globl _FLOWEQ0CTL
	.globl _FLOWLOGIC
	.globl _FLOWSTATE
	.globl _GPIFADRL
	.globl _GPIFADRH
	.globl _GPIFCTLCFG
	.globl _GPIFIDLECTL
	.globl _GPIFIDLECS
	.globl _GPIFWFSELECT
	.globl _wLengthH
	.globl _wLengthL
	.globl _wIndexH
	.globl _wIndexL
	.globl _wValueH
	.globl _wValueL
	.globl _bRequest
	.globl _bmRequestType
	.globl _SETUPDAT
	.globl _SUDPTRCTL
	.globl _SUDPTRL
	.globl _SUDPTRH
	.globl _EP8FIFOBCL
	.globl _EP8FIFOBCH
	.globl _EP6FIFOBCL
	.globl _EP6FIFOBCH
	.globl _EP4FIFOBCL
	.globl _EP4FIFOBCH
	.globl _EP2FIFOBCL
	.globl _EP2FIFOBCH
	.globl _EP8FIFOFLGS
	.globl _EP6FIFOFLGS
	.globl _EP4FIFOFLGS
	.globl _EP2FIFOFLGS
	.globl _EP8CS
	.globl _EP6CS
	.globl _EP4CS
	.globl _EP2CS
	.globl _EPXCS
	.globl _EP1INCS
	.globl _EP1OUTCS
	.globl _EP0CS
	.globl _EP8BCL
	.globl _EP8BCH
	.globl _EP6BCL
	.globl _EP6BCH
	.globl _EP4BCL
	.globl _EP4BCH
	.globl _EP2BCL
	.globl _EP2BCH
	.globl _EP1INBC
	.globl _EP1OUTBC
	.globl _EP0BCL
	.globl _EP0BCH
	.globl _FNADDR
	.globl _MICROFRAME
	.globl _USBFRAMEL
	.globl _USBFRAMEH
	.globl _TOGCTL
	.globl _WAKEUPCS
	.globl _SUSPEND
	.globl _USBCS
	.globl _UDMACRCQUALIFIER
	.globl _UDMACRCL
	.globl _UDMACRCH
	.globl _EXTAUTODAT2
	.globl _XAUTODAT2
	.globl _EXTAUTODAT1
	.globl _XAUTODAT1
	.globl _I2CTL
	.globl _I2DAT
	.globl _I2CS
	.globl _PORTECFG
	.globl _PORTCCFG
	.globl _PORTACFG
	.globl _INTSETUP
	.globl _INT4IVEC
	.globl _INT2IVEC
	.globl _CLRERRCNT
	.globl _ERRCNTLIM
	.globl _USBERRIRQ
	.globl _USBERRIE
	.globl _GPIFIRQ
	.globl _GPIFIE
	.globl _EPIRQ
	.globl _EPIE
	.globl _USBIRQ
	.globl _USBIE
	.globl _NAKIRQ
	.globl _NAKIE
	.globl _IBNIRQ
	.globl _IBNIE
	.globl _EP8FIFOIRQ
	.globl _EP8FIFOIE
	.globl _EP6FIFOIRQ
	.globl _EP6FIFOIE
	.globl _EP4FIFOIRQ
	.globl _EP4FIFOIE
	.globl _EP2FIFOIRQ
	.globl _EP2FIFOIE
	.globl _OUTPKTEND
	.globl _INPKTEND
	.globl _EP8ISOINPKTS
	.globl _EP6ISOINPKTS
	.globl _EP4ISOINPKTS
	.globl _EP2ISOINPKTS
	.globl _EP8FIFOPFL
	.globl _EP8FIFOPFH
	.globl _EP6FIFOPFL
	.globl _EP6FIFOPFH
	.globl _EP4FIFOPFL
	.globl _EP4FIFOPFH
	.globl _EP2FIFOPFL
	.globl _EP2FIFOPFH
	.globl _ECC2B2
	.globl _ECC2B1
	.globl _ECC2B0
	.globl _ECC1B2
	.globl _ECC1B1
	.globl _ECC1B0
	.globl _ECCRESET
	.globl _ECCCFG
	.globl _EP8AUTOINLENL
	.globl _EP8AUTOINLENH
	.globl _EP6AUTOINLENL
	.globl _EP6AUTOINLENH
	.globl _EP4AUTOINLENL
	.globl _EP4AUTOINLENH
	.globl _EP2AUTOINLENL
	.globl _EP2AUTOINLENH
	.globl _EP8FIFOCFG
	.globl _EP6FIFOCFG
	.globl _EP4FIFOCFG
	.globl _EP2FIFOCFG
	.globl _EP8CFG
	.globl _EP6CFG
	.globl _EP4CFG
	.globl _EP2CFG
	.globl _EP1INCFG
	.globl _EP1OUTCFG
	.globl _GPIFHOLDAMOUNT
	.globl _REVCTL
	.globl _REVID
	.globl _FIFOPINPOLAR
	.globl _UART230
	.globl _BPADDRL
	.globl _BPADDRH
	.globl _BREAKPT
	.globl _FIFORESET
	.globl _PINFLAGSCD
	.globl _PINFLAGSAB
	.globl _IFCONFIG
	.globl _CPUCS
	.globl _GPCR2
	.globl _GPIF_WAVE3_DATA
	.globl _GPIF_WAVE2_DATA
	.globl _GPIF_WAVE1_DATA
	.globl _GPIF_WAVE0_DATA
	.globl _GPIF_WAVE_DATA
	.globl _flash_write_PARM_2
	.globl _mac_eeprom_write_PARM_3
	.globl _mac_eeprom_write_PARM_2
	.globl _mac_eeprom_read_PARM_3
	.globl _mac_eeprom_read_PARM_2
	.globl _eeprom_write_PARM_3
	.globl _eeprom_write_PARM_2
	.globl _eeprom_read_PARM_3
	.globl _eeprom_read_PARM_2
	.globl _eeprom_select_PARM_3
	.globl _eeprom_select_PARM_2
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_IOA	=	0x0080
_SP	=	0x0081
_DPL0	=	0x0082
_DPH0	=	0x0083
_DPL1	=	0x0084
_DPH1	=	0x0085
_DPS	=	0x0086
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_CKCON	=	0x008e
_IOB	=	0x0090
_EXIF	=	0x0091
_MPAGE	=	0x0092
__XPAGE	=	0x0092
_SCON0	=	0x0098
_SBUF0	=	0x0099
_AUTOPTRH1	=	0x009a
_AUTOPTRL1	=	0x009b
_AUTOPTRH2	=	0x009d
_AUTOPTRL2	=	0x009e
_IOC	=	0x00a0
_INT2CLR	=	0x00a1
_INT4CLR	=	0x00a2
_IE	=	0x00a8
_EP2468STAT	=	0x00aa
_EP24FIFOFLGS	=	0x00ab
_EP68FIFOFLGS	=	0x00ac
_AUTOPTRSETUP	=	0x00af
_IOD	=	0x00b0
_IOE	=	0x00b1
_OEA	=	0x00b2
_OEB	=	0x00b3
_OEC	=	0x00b4
_OED	=	0x00b5
_OEE	=	0x00b6
_IP	=	0x00b8
_EP01STAT	=	0x00ba
_GPIFTRIG	=	0x00bb
_GPIFSGLDATH	=	0x00bd
_GPIFSGLDATLX	=	0x00be
_GPIFSGLDATLNOX	=	0x00bf
_SCON1	=	0x00c0
_SBUF1	=	0x00c1
_T2CON	=	0x00c8
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_TL2	=	0x00cc
_TH2	=	0x00cd
_PSW	=	0x00d0
_EICON	=	0x00d8
_ACC	=	0x00e0
_EIE	=	0x00e8
_BREG	=	0x00f0
_EIP	=	0x00f8
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_IOA0	=	0x0080
_IOA1	=	0x0081
_IOA2	=	0x0082
_IOA3	=	0x0083
_IOA4	=	0x0084
_IOA5	=	0x0085
_IOA6	=	0x0086
_IOA7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_IOB0	=	0x0090
_IOB1	=	0x0091
_IOB2	=	0x0092
_IOB3	=	0x0093
_IOB4	=	0x0094
_IOB5	=	0x0095
_IOB6	=	0x0096
_IOB7	=	0x0097
_RI_0	=	0x0098
_TI_0	=	0x0099
_RB8_0	=	0x009a
_TB8_0	=	0x009b
_REN_0	=	0x009c
_SM2_0	=	0x009d
_SM1_0	=	0x009e
_SM0_0	=	0x009f
_IOC0	=	0x00a0
_IOC1	=	0x00a1
_IOC2	=	0x00a2
_IOC3	=	0x00a3
_IOC4	=	0x00a4
_IOC5	=	0x00a5
_IOC6	=	0x00a6
_IOC7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES0	=	0x00ac
_ET2	=	0x00ad
_ES1	=	0x00ae
_EA	=	0x00af
_IOD0	=	0x00b0
_IOD1	=	0x00b1
_IOD2	=	0x00b2
_IOD3	=	0x00b3
_IOD4	=	0x00b4
_IOD5	=	0x00b5
_IOD6	=	0x00b6
_IOD7	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS0	=	0x00bc
_PT2	=	0x00bd
_PS1	=	0x00be
_RI_1	=	0x00c0
_TI_1	=	0x00c1
_RB8_1	=	0x00c2
_TB8_1	=	0x00c3
_REN_1	=	0x00c4
_SM2_1	=	0x00c5
_SM1_1	=	0x00c6
_SM0_1	=	0x00c7
_CPRL2	=	0x00c8
_CT2	=	0x00c9
_TR2	=	0x00ca
_EXEN2	=	0x00cb
_TCLK	=	0x00cc
_RCLK	=	0x00cd
_EXF2	=	0x00ce
_TF2	=	0x00cf
_PF	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
_INT6	=	0x00db
_RESI	=	0x00dc
_ERESI	=	0x00dd
_SMOD1	=	0x00df
_ACC0	=	0x00e0
_ACC1	=	0x00e1
_ACC2	=	0x00e2
_ACC3	=	0x00e3
_ACC4	=	0x00e4
_ACC5	=	0x00e5
_ACC6	=	0x00e6
_ACC7	=	0x00e7
_EUSB	=	0x00e8
_EI2C	=	0x00e9
_EIEX4	=	0x00ea
_EIEX5	=	0x00eb
_EIEX6	=	0x00ec
_BREG0	=	0x00f0
_BREG1	=	0x00f1
_BREG2	=	0x00f2
_BREG3	=	0x00f3
_BREG4	=	0x00f4
_BREG5	=	0x00f5
_BREG6	=	0x00f6
_BREG7	=	0x00f7
_PUSB	=	0x00f8
_PI2C	=	0x00f9
_EIPX4	=	0x00fa
_EIPX5	=	0x00fb
_EIPX6	=	0x00fc
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_eeprom_select_PARM_2:
	.ds 1
_eeprom_select_PARM_3:
	.ds 1
_eeprom_read_PARM_2:
	.ds 2
_eeprom_read_PARM_3:
	.ds 1
_eeprom_write_PARM_2:
	.ds 2
_eeprom_write_PARM_3:
	.ds 1
_mac_eeprom_read_PARM_2:
	.ds 1
_mac_eeprom_read_PARM_3:
	.ds 1
_mac_eeprom_write_PARM_2:
	.ds 1
_mac_eeprom_write_PARM_3:
	.ds 1
_flash_write_PARM_2:
	.ds 1
_fpga_send_ep0_oOEB_1_105:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_flash_read_PARM_2:
	.ds 1
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_spi_write_PARM_2:
	.ds 1
	.area	OSEG    (OVR,DATA)
_sendStringDescriptor_PARM_2:
	.ds 1
_sendStringDescriptor_PARM_3:
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG	(DATA)
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_GPIF_WAVE_DATA	=	0xe400
_GPIF_WAVE0_DATA	=	0xe400
_GPIF_WAVE1_DATA	=	0xe420
_GPIF_WAVE2_DATA	=	0xe440
_GPIF_WAVE3_DATA	=	0xe460
_GPCR2	=	0xe50d
_CPUCS	=	0xe600
_IFCONFIG	=	0xe601
_PINFLAGSAB	=	0xe602
_PINFLAGSCD	=	0xe603
_FIFORESET	=	0xe604
_BREAKPT	=	0xe605
_BPADDRH	=	0xe606
_BPADDRL	=	0xe607
_UART230	=	0xe608
_FIFOPINPOLAR	=	0xe609
_REVID	=	0xe60a
_REVCTL	=	0xe60b
_GPIFHOLDAMOUNT	=	0xe60c
_EP1OUTCFG	=	0xe610
_EP1INCFG	=	0xe611
_EP2CFG	=	0xe612
_EP4CFG	=	0xe613
_EP6CFG	=	0xe614
_EP8CFG	=	0xe615
_EP2FIFOCFG	=	0xe618
_EP4FIFOCFG	=	0xe619
_EP6FIFOCFG	=	0xe61a
_EP8FIFOCFG	=	0xe61b
_EP2AUTOINLENH	=	0xe620
_EP2AUTOINLENL	=	0xe621
_EP4AUTOINLENH	=	0xe622
_EP4AUTOINLENL	=	0xe623
_EP6AUTOINLENH	=	0xe624
_EP6AUTOINLENL	=	0xe625
_EP8AUTOINLENH	=	0xe626
_EP8AUTOINLENL	=	0xe627
_ECCCFG	=	0xe628
_ECCRESET	=	0xe629
_ECC1B0	=	0xe62a
_ECC1B1	=	0xe62b
_ECC1B2	=	0xe62c
_ECC2B0	=	0xe62d
_ECC2B1	=	0xe62e
_ECC2B2	=	0xe62f
_EP2FIFOPFH	=	0xe630
_EP2FIFOPFL	=	0xe631
_EP4FIFOPFH	=	0xe632
_EP4FIFOPFL	=	0xe633
_EP6FIFOPFH	=	0xe634
_EP6FIFOPFL	=	0xe635
_EP8FIFOPFH	=	0xe636
_EP8FIFOPFL	=	0xe637
_EP2ISOINPKTS	=	0xe640
_EP4ISOINPKTS	=	0xe641
_EP6ISOINPKTS	=	0xe642
_EP8ISOINPKTS	=	0xe643
_INPKTEND	=	0xe648
_OUTPKTEND	=	0xe649
_EP2FIFOIE	=	0xe650
_EP2FIFOIRQ	=	0xe651
_EP4FIFOIE	=	0xe652
_EP4FIFOIRQ	=	0xe653
_EP6FIFOIE	=	0xe654
_EP6FIFOIRQ	=	0xe655
_EP8FIFOIE	=	0xe656
_EP8FIFOIRQ	=	0xe657
_IBNIE	=	0xe658
_IBNIRQ	=	0xe659
_NAKIE	=	0xe65a
_NAKIRQ	=	0xe65b
_USBIE	=	0xe65c
_USBIRQ	=	0xe65d
_EPIE	=	0xe65e
_EPIRQ	=	0xe65f
_GPIFIE	=	0xe660
_GPIFIRQ	=	0xe661
_USBERRIE	=	0xe662
_USBERRIRQ	=	0xe663
_ERRCNTLIM	=	0xe664
_CLRERRCNT	=	0xe665
_INT2IVEC	=	0xe666
_INT4IVEC	=	0xe667
_INTSETUP	=	0xe668
_PORTACFG	=	0xe670
_PORTCCFG	=	0xe671
_PORTECFG	=	0xe672
_I2CS	=	0xe678
_I2DAT	=	0xe679
_I2CTL	=	0xe67a
_XAUTODAT1	=	0xe67b
_EXTAUTODAT1	=	0xe67b
_XAUTODAT2	=	0xe67c
_EXTAUTODAT2	=	0xe67c
_UDMACRCH	=	0xe67d
_UDMACRCL	=	0xe67e
_UDMACRCQUALIFIER	=	0xe67f
_USBCS	=	0xe680
_SUSPEND	=	0xe681
_WAKEUPCS	=	0xe682
_TOGCTL	=	0xe683
_USBFRAMEH	=	0xe684
_USBFRAMEL	=	0xe685
_MICROFRAME	=	0xe686
_FNADDR	=	0xe687
_EP0BCH	=	0xe68a
_EP0BCL	=	0xe68b
_EP1OUTBC	=	0xe68d
_EP1INBC	=	0xe68f
_EP2BCH	=	0xe690
_EP2BCL	=	0xe691
_EP4BCH	=	0xe694
_EP4BCL	=	0xe695
_EP6BCH	=	0xe698
_EP6BCL	=	0xe699
_EP8BCH	=	0xe69c
_EP8BCL	=	0xe69d
_EP0CS	=	0xe6a0
_EP1OUTCS	=	0xe6a1
_EP1INCS	=	0xe6a2
_EPXCS	=	0xe6a3
_EP2CS	=	0xe6a3
_EP4CS	=	0xe6a4
_EP6CS	=	0xe6a5
_EP8CS	=	0xe6a6
_EP2FIFOFLGS	=	0xe6a7
_EP4FIFOFLGS	=	0xe6a8
_EP6FIFOFLGS	=	0xe6a9
_EP8FIFOFLGS	=	0xe6aa
_EP2FIFOBCH	=	0xe6ab
_EP2FIFOBCL	=	0xe6ac
_EP4FIFOBCH	=	0xe6ad
_EP4FIFOBCL	=	0xe6ae
_EP6FIFOBCH	=	0xe6af
_EP6FIFOBCL	=	0xe6b0
_EP8FIFOBCH	=	0xe6b1
_EP8FIFOBCL	=	0xe6b2
_SUDPTRH	=	0xe6b3
_SUDPTRL	=	0xe6b4
_SUDPTRCTL	=	0xe6b5
_SETUPDAT	=	0xe6b8
_bmRequestType	=	0xe6b8
_bRequest	=	0xe6b9
_wValueL	=	0xe6ba
_wValueH	=	0xe6bb
_wIndexL	=	0xe6bc
_wIndexH	=	0xe6bd
_wLengthL	=	0xe6be
_wLengthH	=	0xe6bf
_GPIFWFSELECT	=	0xe6c0
_GPIFIDLECS	=	0xe6c1
_GPIFIDLECTL	=	0xe6c2
_GPIFCTLCFG	=	0xe6c3
_GPIFADRH	=	0xe6c4
_GPIFADRL	=	0xe6c5
_FLOWSTATE	=	0xe6c6
_FLOWLOGIC	=	0xe6c7
_FLOWEQ0CTL	=	0xe6c8
_FLOWEQ1CTL	=	0xe6c9
_FLOWHOLDOFF	=	0xe6ca
_FLOWSTB	=	0xe6cb
_FLOWSTBEDGE	=	0xe6cc
_FLOWSTBHPERIOD	=	0xe6cd
_GPIFTCB3	=	0xe6ce
_GPIFTCB2	=	0xe6cf
_GPIFTCB1	=	0xe6d0
_GPIFTCB0	=	0xe6d1
_EP2GPIFFLGSEL	=	0xe6d2
_EP2GPIFPFSTOP	=	0xe6d3
_EP2GPIFTRIG	=	0xe6d4
_EP4GPIFFLGSEL	=	0xe6da
_EP4GPIFPFSTOP	=	0xe6db
_EP4GPIFTRIG	=	0xe6dc
_EP6GPIFFLGSEL	=	0xe6e2
_EP6GPIFPFSTOP	=	0xe6e3
_EP6GPIFTRIG	=	0xe6e4
_EP8GPIFFLGSEL	=	0xe6ea
_EP8GPIFPFSTOP	=	0xe6eb
_EP8GPIFTRIG	=	0xe6ec
_XGPIFSGLDATH	=	0xe6f0
_XGPIFSGLDATLX	=	0xe6f1
_XGPIFSGLDATLNOX	=	0xe6f2
_GPIFREADYCFG	=	0xe6f3
_GPIFREADYSTAT	=	0xe6f4
_GPIFABORT	=	0xe6f5
_EP0BUF	=	0xe740
_EP1OUTBUF	=	0xe780
_EP1INBUF	=	0xe7c0
_EP2FIFOBUF	=	0xf000
_EP4FIFOBUF	=	0xf400
_EP6FIFOBUF	=	0xf800
_EP8FIFOBUF	=	0xfc00
_INT0VEC_IE0	=	0x0003
_INT1VEC_T0	=	0x000b
_INT2VEC_IE1	=	0x0013
_INT3VEC_T1	=	0x001b
_INT4VEC_USART0	=	0x0023
_INT5VEC_T2	=	0x002b
_INT6VEC_RESUME	=	0x0033
_INT7VEC_USART1	=	0x003b
_INT8VEC_USB	=	0x0043
_INT9VEC_I2C	=	0x004b
_INT10VEC_GPIF	=	0x0053
_INT11VEC_IE5	=	0x005b
_INT12VEC_IE6	=	0x0063
_INTVEC_SUDAV	=	0x0100
_INTVEC_SOF	=	0x0104
_INTVEC_SUTOK	=	0x0108
_INTVEC_SUSPEND	=	0x010c
_INTVEC_USBRESET	=	0x0110
_INTVEC_HISPEED	=	0x0114
_INTVEC_EP0ACK	=	0x0118
_INTVEC_EP0IN	=	0x0120
_INTVEC_EP0OUT	=	0x0124
_INTVEC_EP1IN	=	0x0128
_INTVEC_EP1OUT	=	0x012c
_INTVEC_EP2	=	0x0130
_INTVEC_EP4	=	0x0134
_INTVEC_EP6	=	0x0138
_INTVEC_EP8	=	0x013c
_INTVEC_IBN	=	0x0140
_INTVEC_EP0PING	=	0x0148
_INTVEC_EP1PING	=	0x014c
_INTVEC_EP2PING	=	0x0150
_INTVEC_EP4PING	=	0x0154
_INTVEC_EP6PING	=	0x0158
_INTVEC_EP8PING	=	0x015c
_INTVEC_ERRLIMIT	=	0x0160
_INTVEC_EP2ISOERR	=	0x0170
_INTVEC_EP4ISOERR	=	0x0174
_INTVEC_EP6ISOERR	=	0x0178
_INTVEC_EP8ISOERR	=	0x017c
_INTVEC_EP2PF	=	0x0180
_INTVEC_EP4PF	=	0x0184
_INTVEC_EP6PF	=	0x0188
_INTVEC_EP8PF	=	0x018c
_INTVEC_EP2EF	=	0x0190
_INTVEC_EP4EF	=	0x0194
_INTVEC_EP6EF	=	0x0198
_INTVEC_EP8EF	=	0x019c
_INTVEC_EP2FF	=	0x01a0
_INTVEC_EP6FF	=	0x01a8
_INTVEC_EP8FF	=	0x01ac
_INTVEC_GPIFDONE	=	0x01b0
_INTVEC_GPIFWF	=	0x01b4
_eeprom_addr::
	.ds 2
_eeprom_write_bytes::
	.ds 2
_eeprom_write_checksum::
	.ds 1
_mac_eeprom_addr::
	.ds 1
_config_data_valid::
	.ds 1
_flash_enabled::
	.ds 1
_flash_sector_size::
	.ds 2
_flash_sectors::
	.ds 4
_flash_ec::
	.ds 1
_spi_vendor::
	.ds 1
_spi_device::
	.ds 1
_spi_memtype::
	.ds 1
_spi_erase_cmd::
	.ds 1
_spi_last_cmd::
	.ds 1
_spi_buffer::
	.ds 4
_spi_write_addr_hi::
	.ds 2
_spi_write_addr_lo::
	.ds 1
_spi_need_pp::
	.ds 1
_spi_write_sector::
	.ds 2
_ep0_read_mode::
	.ds 1
_ep0_write_mode::
	.ds 1
_fpga_checksum::
	.ds 1
_fpga_bytes::
	.ds 4
_fpga_init_b::
	.ds 1
_fpga_flash_result::
	.ds 1
_fpga_conf_initialized::
	.ds 1
_OOEC::
	.ds 1
_ZTEX_DESCRIPTOR	=	0x006c
_ZTEX_DESCRIPTOR_VERSION	=	0x006d
_ZTEXID	=	0x006e
_PRODUCT_ID	=	0x0072
_FW_VERSION	=	0x0076
_INTERFACE_VERSION	=	0x0077
_INTERFACE_CAPABILITIES	=	0x0078
_MODULE_RESERVED	=	0x007e
_SN_STRING	=	0x008a
_mac_eeprom_init_buf_1_167:
	.ds 5
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_ep0_payload_remaining::
	.ds 2
_ep0_payload_transfer::
	.ds 1
_GPIF_WAVE_DATA_HSFPGA_24MHZ::
	.ds 32
_GPIF_WAVE_DATA_HSFPGA_12MHZ::
	.ds 32
_ep0_prev_setup_request::
	.ds 1
_ep0_vendor_cmd_setup::
	.ds 1
_ISOFRAME_COUNTER::
	.ds 8
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'abscode_intvec'
;------------------------------------------------------------
;	include/ezintavecs.h:92: void abscode_intvec()// _naked
;	-----------------------------------------
;	 function abscode_intvec
;	-----------------------------------------
_abscode_intvec:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	include/ezintavecs.h:317: ERROR: no line number 317 in file include/ezintavecs.h
	.area ABSCODE (ABS,CODE)
	.org 0x0000
	ENTRY:
	ljmp #0x0200
;	# 94 "include/ezintavecs.h"
	.org 0x0003
;	# 34 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x000b
;	# 35 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0013
;	# 36 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x001b
;	# 37 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0023
;	# 38 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x002b
;	# 39 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0033
;	# 40 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x003b
;	# 41 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0043
;	# 42 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x004b
;	# 43 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0053
;	# 44 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x005b
;	# 45 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0063
;	# 46 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0100
;	# 47 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0104
;	# 48 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0108
;	# 49 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x010C
;	# 50 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0110
;	# 51 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0114
;	# 52 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0118
;	# 53 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0120
;	# 54 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0124
;	# 55 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0128
;	# 56 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x012C
;	# 57 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0130
;	# 58 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0134
;	# 59 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0138
;	# 60 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x013C
;	# 61 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0140
;	# 62 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0148
;	# 63 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x014C
;	# 64 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0150
;	# 65 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0154
;	# 66 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0158
;	# 67 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x015C
;	# 68 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0160
;	# 69 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0170
;	# 70 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0174
;	# 71 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0178
;	# 72 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x017C
;	# 73 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0180
;	# 74 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0184
;	# 75 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0188
;	# 76 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x018C
;	# 77 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0190
;	# 78 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0194
;	# 79 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x0198
;	# 80 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x019C
;	# 81 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x01A0
;	# 82 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x01A8
;	# 83 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x01AC
;	# 84 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x01B0
;	# 85 "include/ezintavecs.h"
	reti
;	# 94 "include/ezintavecs.h"
	.org 0x01B4
;	# 101 "include/ezintavecs.h"
	reti
	.org 0x01b8
	INTVEC_DUMMY:
	reti
	.area CSEG (CODE)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait'
;------------------------------------------------------------
;ms                        Allocated to registers r6 r7 
;i                         Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	include/ztex-utils.h:78: void wait(WORD short ms) {	  // wait in ms 
;	-----------------------------------------
;	 function wait
;	-----------------------------------------
_wait:
	mov	r6,dpl
	mov	r7,dph
;	include/ztex-utils.h:80: for (j=0; j<ms; j++) 
	mov	r4,#0x00
	mov	r5,#0x00
00107$:
	clr	c
	mov	a,r4
	subb	a,r6
	mov	a,r5
	subb	a,r7
	jnc	00109$
;	include/ztex-utils.h:81: for (i=0; i<1200; i++);
	mov	r2,#0xB0
	mov	r3,#0x04
00105$:
	dec	r2
	cjne	r2,#0xFF,00126$
	dec	r3
00126$:
	mov	a,r2
	orl	a,r3
	jnz	00105$
;	include/ztex-utils.h:80: for (j=0; j<ms; j++) 
	inc	r4
	cjne	r4,#0x00,00107$
	inc	r5
	sjmp	00107$
00109$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uwait'
;------------------------------------------------------------
;us                        Allocated to registers r6 r7 
;i                         Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	include/ztex-utils.h:88: void uwait(WORD short us) {	  // wait in 10µs steps
;	-----------------------------------------
;	 function uwait
;	-----------------------------------------
_uwait:
	mov	r6,dpl
	mov	r7,dph
;	include/ztex-utils.h:90: for (j=0; j<us; j++) 
	mov	r4,#0x00
	mov	r5,#0x00
00107$:
	clr	c
	mov	a,r4
	subb	a,r6
	mov	a,r5
	subb	a,r7
	jnc	00109$
;	include/ztex-utils.h:91: for (i=0; i<10; i++);
	mov	r2,#0x0A
	mov	r3,#0x00
00105$:
	dec	r2
	cjne	r2,#0xFF,00126$
	dec	r3
00126$:
	mov	a,r2
	orl	a,r3
	jnz	00105$
;	include/ztex-utils.h:90: for (j=0; j<us; j++) 
	inc	r4
	cjne	r4,#0x00,00107$
	inc	r5
	sjmp	00107$
00109$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'MEM_COPY1_int'
;------------------------------------------------------------
;	include/ztex-utils.h:99: void MEM_COPY1_int() // __naked 
;	-----------------------------------------
;	 function MEM_COPY1_int
;	-----------------------------------------
_MEM_COPY1_int:
;	include/ztex-utils.h:110: __endasm;
	020001$:
	mov _AUTOPTRSETUP,#0x07
	mov dptr,#_XAUTODAT1
	movx a,@dptr
	mov dptr,#_XAUTODAT2
	movx @dptr,a
	djnz r2, 020001$
	ret
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'send'
;------------------------------------------------------------
;	transceiver.c:56: void send ()
;	-----------------------------------------
;	 function send
;	-----------------------------------------
_send:
;	transceiver.c:58: MT_MODE = 0;			// set mode to RX (device)
	clr	_IOA7
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:60: MT_START = 1;			// assert the start
	setb	_IOA1
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:62: MT_START = 0; 			// clear the start bit	
	clr	_IOA1
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'receive'
;------------------------------------------------------------
;	transceiver.c:68: void receive ()
;	-----------------------------------------
;	 function receive
;	-----------------------------------------
_receive:
;	transceiver.c:70: MT_MODE = 1;			// set mode to TX (device)
	setb	_IOA7
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:72: MT_START = 1;			// assert the start
	setb	_IOA1
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:74: MT_START = 0; 			// clear the start bit	
	clr	_IOA1
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'request'
;------------------------------------------------------------
;	transceiver.c:80: void request ()
;	-----------------------------------------
;	 function request
;	-----------------------------------------
_request:
;	transceiver.c:82: IOC = SETUPDAT[2];		// specify the request
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	_IOC,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:84: MT_RUN = 1;				// assert the interrupt flag
	setb	_IOA3
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:86: MT_RUN = 0;				// clear the interrupt flag
	clr	_IOA3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'reset'
;------------------------------------------------------------
;	transceiver.c:92: void reset () {
;	-----------------------------------------
;	 function reset
;	-----------------------------------------
_reset:
;	transceiver.c:93: OEA = bmBIT0 | bmBIT1 | bmBIT7 | bmBIT3;	// reset, start, run and mode
	mov	_OEA,#0x8B
;	transceiver.c:94: OEB = 0;
	mov	_OEB,#0x00
;	transceiver.c:95: OEC = bmBIT0 | bmBIT1 | bmBIT2 | bmBIT3;	// request word
	mov	_OEC,#0x0F
;	transceiver.c:96: OED = 0;
	mov	_OED,#0x00
;	transceiver.c:98: IOC = 0;	
	mov	_IOC,#0x00
;	transceiver.c:100: MT_RESET = 1;
	setb	_IOA0
;	transceiver.c:101: MT_START = 0;
	clr	_IOA1
;	transceiver.c:103: EP2CS &= ~bmBIT0;			// clear stall bit
	mov	dptr,#_EP2CS
	movx	a,@dptr
	anl	a,#0xFE
	movx	@dptr,a
;	transceiver.c:104: EP6CS &= ~bmBIT0;			// clear stall bit
	mov	dptr,#_EP6CS
	movx	a,@dptr
	mov	r7,a
	anl	a,#0xFE
	movx	@dptr,a
;	transceiver.c:106: IFCONFIG = bmBIT7 | bmBIT6 | bmBIT5 | 3;  // internal 48MHz clock, drive IFCLK output, slave FIFO interface
	mov	dptr,#_IFCONFIG
	mov	a,#0xE3
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:109: REVCTL = 0x1;
	mov	dptr,#_REVCTL
	mov	a,#0x01
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:112: FIFORESET = 0x80;			// reset FIFO ...
	mov	dptr,#_FIFORESET
	mov	a,#0x80
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:114: FIFORESET = 2;				// ... for EP 2
	mov	dptr,#_FIFORESET
	mov	a,#0x02
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:116: FIFORESET = 0x00;
	mov	dptr,#_FIFORESET
	clr	a
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:118: FIFORESET = 6;				// ... for EP 6
	mov	dptr,#_FIFORESET
	mov	a,#0x06
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:120: FIFORESET = 0x00;
	mov	dptr,#_FIFORESET
	clr	a
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:123: EP2FIFOCFG = bmBIT0; 
	mov	dptr,#_EP2FIFOCFG
	mov	a,#0x01
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:125: EP2FIFOCFG = bmBIT3 | bmBIT0;  		// EP2: AUTOIN, WORDWIDE
	mov	dptr,#_EP2FIFOCFG
	mov	a,#0x09
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:127: EP2AUTOINLENH = 2;     			// 512 bytes 
	mov	dptr,#_EP2AUTOINLENH
	mov	a,#0x02
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:129: EP2AUTOINLENL = 0;
	mov	dptr,#_EP2AUTOINLENL
	clr	a
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:132: EP6FIFOCFG = bmBIT0;         		
	mov	dptr,#_EP6FIFOCFG
	mov	a,#0x01
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:134: EP6FIFOCFG = bmBIT4 | bmBIT0;		// EP6: AUTOOUT bit arms the FIFO, WORDWIDE
	mov	dptr,#_EP6FIFOCFG
	mov	a,#0x11
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:137: FIFOPINPOLAR = 0;
	mov	dptr,#_FIFOPINPOLAR
	clr	a
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:139: PINFLAGSAB = 0xca;			// FLAGA: EP6: EF; FLAGB: EP2 FF
	mov	dptr,#_PINFLAGSAB
	mov	a,#0xCA
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	transceiver.c:142: wait(2);
	mov	dptr,#0x0002
	lcall	_wait
;	transceiver.c:143: MT_RESET = 0;
	clr	_IOA0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'i2c_waitWrite'
;------------------------------------------------------------
;i2csbuf                   Allocated to registers r7 
;toc                       Allocated to registers r7 
;------------------------------------------------------------
;	include/ztex-eeprom.h:41: BYTE i2c_waitWrite()
;	-----------------------------------------
;	 function i2c_waitWrite
;	-----------------------------------------
_i2c_waitWrite:
;	include/ztex-eeprom.h:44: for ( toc=0; toc<255 && !(I2CS & bmBIT0); toc++ );
	mov	r7,#0x00
00107$:
	cjne	r7,#0xFF,00124$
00124$:
	jnc	00101$
	mov	dptr,#_I2CS
	movx	a,@dptr
	mov	r6,a
	jb	acc.0,00101$
	inc	r7
	sjmp	00107$
00101$:
;	include/ztex-eeprom.h:45: i2csbuf = I2CS;
	mov	dptr,#_I2CS
	movx	a,@dptr
;	include/ztex-eeprom.h:46: if ( (i2csbuf & bmBIT2) || (!(i2csbuf & bmBIT1)) ) {
	mov	r7,a
	jb	acc.2,00102$
	mov	a,r7
	jb	acc.1,00103$
00102$:
;	include/ztex-eeprom.h:47: I2CS |= bmBIT6;
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	include/ztex-eeprom.h:48: return 1;
	mov	dpl,#0x01
	ret
00103$:
;	include/ztex-eeprom.h:50: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'i2c_waitRead'
;------------------------------------------------------------
;i2csbuf                   Allocated to registers r7 
;toc                       Allocated to registers r7 
;------------------------------------------------------------
;	include/ztex-eeprom.h:57: BYTE i2c_waitRead(void)
;	-----------------------------------------
;	 function i2c_waitRead
;	-----------------------------------------
_i2c_waitRead:
;	include/ztex-eeprom.h:60: for ( toc=0; toc<255 && !(I2CS & bmBIT0); toc++ );
	mov	r7,#0x00
00106$:
	cjne	r7,#0xFF,00123$
00123$:
	jnc	00101$
	mov	dptr,#_I2CS
	movx	a,@dptr
	mov	r6,a
	jb	acc.0,00101$
	inc	r7
	sjmp	00106$
00101$:
;	include/ztex-eeprom.h:61: i2csbuf = I2CS;
	mov	dptr,#_I2CS
	movx	a,@dptr
;	include/ztex-eeprom.h:62: if (i2csbuf & bmBIT2) {
	mov	r7,a
	jnb	acc.2,00103$
;	include/ztex-eeprom.h:63: I2CS |= bmBIT6;
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	include/ztex-eeprom.h:64: return 1;
	mov	dpl,#0x01
	ret
00103$:
;	include/ztex-eeprom.h:66: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'i2c_waitStart'
;------------------------------------------------------------
;toc                       Allocated to registers r7 
;------------------------------------------------------------
;	include/ztex-eeprom.h:73: BYTE i2c_waitStart()
;	-----------------------------------------
;	 function i2c_waitStart
;	-----------------------------------------
_i2c_waitStart:
;	include/ztex-eeprom.h:76: for ( toc=0; toc<255; toc++ ) {
	mov	r7,#0x00
00104$:
;	include/ztex-eeprom.h:77: if ( ! (I2CS & bmBIT2) )
	mov	dptr,#_I2CS
	movx	a,@dptr
	mov	r6,a
	jb	acc.2,00105$
;	include/ztex-eeprom.h:78: return 0;
	mov	dpl,#0x00
	ret
00105$:
;	include/ztex-eeprom.h:76: for ( toc=0; toc<255; toc++ ) {
	inc	r7
	cjne	r7,#0xFF,00118$
00118$:
	jc	00104$
;	include/ztex-eeprom.h:80: return 1;
	mov	dpl,#0x01
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'i2c_waitStop'
;------------------------------------------------------------
;toc                       Allocated to registers r7 
;------------------------------------------------------------
;	include/ztex-eeprom.h:87: BYTE i2c_waitStop()
;	-----------------------------------------
;	 function i2c_waitStop
;	-----------------------------------------
_i2c_waitStop:
;	include/ztex-eeprom.h:90: for ( toc=0; toc<255; toc++ ) {
	mov	r7,#0x00
00104$:
;	include/ztex-eeprom.h:91: if ( ! (I2CS & bmBIT6) )
	mov	dptr,#_I2CS
	movx	a,@dptr
	mov	r6,a
	jb	acc.6,00105$
;	include/ztex-eeprom.h:92: return 0;
	mov	dpl,#0x00
	ret
00105$:
;	include/ztex-eeprom.h:90: for ( toc=0; toc<255; toc++ ) {
	inc	r7
	cjne	r7,#0xFF,00118$
00118$:
	jc	00104$
;	include/ztex-eeprom.h:94: return 1;
	mov	dpl,#0x01
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'eeprom_select'
;------------------------------------------------------------
;to                        Allocated with name '_eeprom_select_PARM_2'
;stop                      Allocated with name '_eeprom_select_PARM_3'
;addr                      Allocated to registers r7 
;toc                       Allocated to registers 
;------------------------------------------------------------
;	include/ztex-eeprom.h:103: BYTE eeprom_select (BYTE addr, BYTE to, BYTE stop ) {
;	-----------------------------------------
;	 function eeprom_select
;	-----------------------------------------
_eeprom_select:
	mov	r7,dpl
;	include/ztex-eeprom.h:105: eeprom_select_start:
	clr	c
	clr	a
	subb	a,_eeprom_select_PARM_2
	clr	a
	rlc	a
	mov	r6,a
00101$:
;	include/ztex-eeprom.h:106: I2CS |= bmBIT7;		// start bit
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x80
	movx	@dptr,a
;	include/ztex-eeprom.h:107: i2c_waitStart();
	push	ar7
	push	ar6
	lcall	_i2c_waitStart
	pop	ar6
	pop	ar7
;	include/ztex-eeprom.h:108: I2DAT = addr;		// select device for writing
	mov	dptr,#_I2DAT
	mov	a,r7
	movx	@dptr,a
;	include/ztex-eeprom.h:109: if ( ! i2c_waitWrite() ) {
	push	ar7
	push	ar6
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar6
	pop	ar7
	jnz	00107$
;	include/ztex-eeprom.h:110: if ( stop ) {
	mov	a,_eeprom_select_PARM_3
	jz	00103$
;	include/ztex-eeprom.h:111: I2CS |= bmBIT6;
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	include/ztex-eeprom.h:112: i2c_waitStop();
	lcall	_i2c_waitStop
00103$:
;	include/ztex-eeprom.h:114: return 0;
	mov	dpl,#0x00
	ret
00107$:
;	include/ztex-eeprom.h:116: else if (toc<to) {
	mov	a,r6
	jz	00108$
;	include/ztex-eeprom.h:117: uwait(10);
	mov	dptr,#0x000A
	push	ar7
	push	ar6
	lcall	_uwait
	pop	ar6
	pop	ar7
;	include/ztex-eeprom.h:118: goto eeprom_select_start;
	sjmp	00101$
00108$:
;	include/ztex-eeprom.h:120: if ( stop ) {
	mov	a,_eeprom_select_PARM_3
	jz	00110$
;	include/ztex-eeprom.h:121: I2CS |= bmBIT6;
	mov	dptr,#_I2CS
	movx	a,@dptr
	mov	r7,a
	orl	a,#0x40
	movx	@dptr,a
00110$:
;	include/ztex-eeprom.h:123: return 1;
	mov	dpl,#0x01
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'eeprom_read'
;------------------------------------------------------------
;addr                      Allocated with name '_eeprom_read_PARM_2'
;length                    Allocated with name '_eeprom_read_PARM_3'
;buf                       Allocated to registers r6 r7 
;bytes                     Allocated to registers r5 
;i                         Allocated to registers 
;------------------------------------------------------------
;	include/ztex-eeprom.h:131: BYTE eeprom_read ( __xdata BYTE *buf, WORD addr, BYTE length ) { 
;	-----------------------------------------
;	 function eeprom_read
;	-----------------------------------------
_eeprom_read:
	mov	r6,dpl
	mov	r7,dph
;	include/ztex-eeprom.h:132: BYTE bytes = 0,i;
	mov	r5,#0x00
;	include/ztex-eeprom.h:134: if ( length == 0 ) 
	mov	a,_eeprom_read_PARM_3
;	include/ztex-eeprom.h:135: return 0;
	jnz	00102$
	mov	dpl,a
	ret
00102$:
;	include/ztex-eeprom.h:137: if ( eeprom_select(EEPROM_ADDR, 100,0) ) 
	mov	_eeprom_select_PARM_2,#0x64
	mov	_eeprom_select_PARM_3,#0x00
	mov	dpl,#0xA2
	push	ar7
	push	ar6
	push	ar5
	lcall	_eeprom_select
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jz	00154$
	ljmp	00118$
00154$:
;	include/ztex-eeprom.h:140: I2DAT = HI(addr);		// write address
	mov	r4,(_eeprom_read_PARM_2 + 1)
	mov	dptr,#_I2DAT
	mov	a,r4
	movx	@dptr,a
;	include/ztex-eeprom.h:141: if ( i2c_waitWrite() ) goto eeprom_read_end;
	push	ar7
	push	ar6
	push	ar5
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jz	00155$
	ljmp	00118$
00155$:
;	include/ztex-eeprom.h:142: I2DAT = LO(addr);		// write address
	mov	dptr,#_I2DAT
	mov	a,_eeprom_read_PARM_2
	movx	@dptr,a
;	include/ztex-eeprom.h:143: if ( i2c_waitWrite() ) goto eeprom_read_end;
	push	ar7
	push	ar6
	push	ar5
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jz	00156$
	ljmp	00118$
00156$:
;	include/ztex-eeprom.h:144: I2CS |= bmBIT6;
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	include/ztex-eeprom.h:145: i2c_waitStop();
	push	ar7
	push	ar6
	push	ar5
	lcall	_i2c_waitStop
;	include/ztex-eeprom.h:147: I2CS |= bmBIT7;		// start bit
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x80
	movx	@dptr,a
;	include/ztex-eeprom.h:148: i2c_waitStart();
	lcall	_i2c_waitStart
;	include/ztex-eeprom.h:149: I2DAT = EEPROM_ADDR | 1;	// select device for reading
	mov	dptr,#_I2DAT
	mov	a,#0xA3
	movx	@dptr,a
;	include/ztex-eeprom.h:150: if ( i2c_waitWrite() ) goto eeprom_read_end;
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jnz	00118$
;	include/ztex-eeprom.h:152: *buf = I2DAT;		// dummy read
	mov	dptr,#_I2DAT
	movx	a,@dptr
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
;	include/ztex-eeprom.h:153: if ( i2c_waitRead()) goto eeprom_read_end; 
	push	ar7
	push	ar6
	push	ar5
	lcall	_i2c_waitRead
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jnz	00118$
	mov	r4,a
00120$:
;	include/ztex-eeprom.h:154: for (; bytes<length; bytes++ ) {
	clr	c
	mov	a,r4
	subb	a,_eeprom_read_PARM_3
	jnc	00115$
;	include/ztex-eeprom.h:155: *buf = I2DAT;		// read data
	mov	dptr,#_I2DAT
	movx	a,@dptr
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
	inc	dptr
	mov	r6,dpl
	mov	r7,dph
;	include/ztex-eeprom.h:156: buf++;
;	include/ztex-eeprom.h:157: if ( i2c_waitRead()) goto eeprom_read_end; 
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_i2c_waitRead
	mov	a,dpl
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	jnz	00118$
;	include/ztex-eeprom.h:154: for (; bytes<length; bytes++ ) {
	inc	r4
	mov	ar5,r4
	sjmp	00120$
00115$:
;	include/ztex-eeprom.h:160: I2CS |= bmBIT5;		// no ACK
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x20
	movx	@dptr,a
;	include/ztex-eeprom.h:161: i = I2DAT;			// dummy read
	mov	dptr,#_I2DAT
	movx	a,@dptr
;	include/ztex-eeprom.h:162: if ( i2c_waitRead()) goto eeprom_read_end; 
	push	ar5
	lcall	_i2c_waitRead
	mov	a,dpl
	pop	ar5
	jnz	00118$
;	include/ztex-eeprom.h:164: I2CS |= bmBIT6;		// stop bit
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	include/ztex-eeprom.h:165: i = I2DAT;			// dummy read
	mov	dptr,#_I2DAT
	movx	a,@dptr
;	include/ztex-eeprom.h:166: i2c_waitStop();
	push	ar5
	lcall	_i2c_waitStop
	pop	ar5
;	include/ztex-eeprom.h:168: eeprom_read_end:
00118$:
;	include/ztex-eeprom.h:169: return bytes;
	mov	dpl,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'eeprom_write'
;------------------------------------------------------------
;addr                      Allocated with name '_eeprom_write_PARM_2'
;length                    Allocated with name '_eeprom_write_PARM_3'
;buf                       Allocated to registers r6 r7 
;bytes                     Allocated to registers r5 
;------------------------------------------------------------
;	include/ztex-eeprom.h:178: BYTE eeprom_write ( __xdata BYTE *buf, WORD addr, BYTE length ) {
;	-----------------------------------------
;	 function eeprom_write
;	-----------------------------------------
_eeprom_write:
	mov	r6,dpl
	mov	r7,dph
;	include/ztex-eeprom.h:179: BYTE bytes = 0;
	mov	r5,#0x00
;	include/ztex-eeprom.h:181: if ( length == 0 ) 
	mov	a,_eeprom_write_PARM_3
;	include/ztex-eeprom.h:182: return 0;
	jnz	00102$
	mov	dpl,a
	ret
00102$:
;	include/ztex-eeprom.h:184: if ( eeprom_select(EEPROM_ADDR, 100,0) ) 
	mov	_eeprom_select_PARM_2,#0x64
	mov	_eeprom_select_PARM_3,#0x00
	mov	dpl,#0xA2
	push	ar7
	push	ar6
	push	ar5
	lcall	_eeprom_select
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jz	00139$
	ljmp	00112$
00139$:
;	include/ztex-eeprom.h:187: I2DAT = HI(addr);          	// write address
	mov	r4,(_eeprom_write_PARM_2 + 1)
	mov	dptr,#_I2DAT
	mov	a,r4
	movx	@dptr,a
;	include/ztex-eeprom.h:188: if ( i2c_waitWrite() ) goto eeprom_write_end;
	push	ar7
	push	ar6
	push	ar5
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jz	00140$
	ljmp	00112$
00140$:
;	include/ztex-eeprom.h:189: I2DAT = LO(addr);          	// write address
	mov	dptr,#_I2DAT
	mov	a,_eeprom_write_PARM_2
	movx	@dptr,a
;	include/ztex-eeprom.h:190: if ( i2c_waitWrite() ) goto eeprom_write_end;
	push	ar7
	push	ar6
	push	ar5
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jnz	00112$
	mov	r4,a
00114$:
;	include/ztex-eeprom.h:192: for (; bytes<length; bytes++ ) {
	clr	c
	mov	a,r4
	subb	a,_eeprom_write_PARM_3
	jnc	00111$
;	include/ztex-eeprom.h:193: I2DAT = *buf;         	// write data 
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	mov	dptr,#_I2DAT
	movx	@dptr,a
;	include/ztex-eeprom.h:194: eeprom_write_checksum += *buf;
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	mov	r6,dpl
	mov	r7,dph
	mov	dptr,#_eeprom_write_checksum
	movx	a,@dptr
	mov	r2,a
	mov	a,r3
	add	a,r2
	movx	@dptr,a
;	include/ztex-eeprom.h:195: buf++;
;	include/ztex-eeprom.h:196: eeprom_write_bytes+=1;
	mov	dptr,#_eeprom_write_bytes
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_eeprom_write_bytes
	mov	a,#0x01
	add	a,r2
	movx	@dptr,a
	clr	a
	addc	a,r3
	inc	dptr
	movx	@dptr,a
;	include/ztex-eeprom.h:197: if ( i2c_waitWrite() ) goto eeprom_write_end;
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	jnz	00112$
;	include/ztex-eeprom.h:192: for (; bytes<length; bytes++ ) {
	inc	r4
	mov	ar5,r4
	sjmp	00114$
00111$:
;	include/ztex-eeprom.h:199: I2CS |= bmBIT6;		// stop bit
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	include/ztex-eeprom.h:200: i2c_waitStop();
	push	ar5
	lcall	_i2c_waitStop
	pop	ar5
;	include/ztex-eeprom.h:202: eeprom_write_end:
00112$:
;	include/ztex-eeprom.h:203: return bytes;
	mov	dpl,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'eeprom_read_ep0'
;------------------------------------------------------------
;i                         Allocated to registers r6 
;b                         Allocated to registers r7 
;------------------------------------------------------------
;	include/ztex-eeprom.h:209: BYTE eeprom_read_ep0 () { 
;	-----------------------------------------
;	 function eeprom_read_ep0
;	-----------------------------------------
_eeprom_read_ep0:
;	include/ztex-eeprom.h:211: b = ep0_payload_transfer;
	mov	dptr,#_ep0_payload_transfer
	movx	a,@dptr
	mov	r7,a
;	include/ztex-eeprom.h:212: i = eeprom_read(EP0BUF, eeprom_addr, b);
	mov	dptr,#_eeprom_addr
	movx	a,@dptr
	mov	_eeprom_read_PARM_2,a
	inc	dptr
	movx	a,@dptr
	mov	(_eeprom_read_PARM_2 + 1),a
	mov	_eeprom_read_PARM_3,r7
	mov	dptr,#_EP0BUF
	push	ar7
	lcall	_eeprom_read
	mov	r6,dpl
	pop	ar7
;	include/ztex-eeprom.h:213: eeprom_addr += b;
	mov	r5,#0x00
	mov	dptr,#_eeprom_addr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_eeprom_addr
	mov	a,r7
	add	a,r3
	movx	@dptr,a
	mov	a,r5
	addc	a,r4
	inc	dptr
	movx	@dptr,a
;	include/ztex-eeprom.h:214: return i;
	mov	dpl,r6
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'eeprom_write_ep0'
;------------------------------------------------------------
;length                    Allocated to registers r7 
;------------------------------------------------------------
;	include/ztex-eeprom.h:230: void eeprom_write_ep0 ( BYTE length ) { 	
;	-----------------------------------------
;	 function eeprom_write_ep0
;	-----------------------------------------
_eeprom_write_ep0:
	mov	r7,dpl
;	include/ztex-eeprom.h:231: eeprom_write(EP0BUF, eeprom_addr, length);
	mov	dptr,#_eeprom_addr
	movx	a,@dptr
	mov	_eeprom_write_PARM_2,a
	inc	dptr
	movx	a,@dptr
	mov	(_eeprom_write_PARM_2 + 1),a
	mov	_eeprom_write_PARM_3,r7
	mov	dptr,#_EP0BUF
	push	ar7
	lcall	_eeprom_write
	pop	ar7
;	include/ztex-eeprom.h:232: eeprom_addr += length;
	mov	r6,#0x00
	mov	dptr,#_eeprom_addr
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	dptr,#_eeprom_addr
	mov	a,r7
	add	a,r4
	movx	@dptr,a
	mov	a,r6
	addc	a,r5
	inc	dptr
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'mac_eeprom_read'
;------------------------------------------------------------
;addr                      Allocated with name '_mac_eeprom_read_PARM_2'
;length                    Allocated with name '_mac_eeprom_read_PARM_3'
;buf                       Allocated to registers r6 r7 
;bytes                     Allocated to registers r5 
;i                         Allocated to registers 
;------------------------------------------------------------
;	include/ztex-eeprom.h:272: BYTE mac_eeprom_read ( __xdata BYTE *buf, BYTE addr, BYTE length ) { 
;	-----------------------------------------
;	 function mac_eeprom_read
;	-----------------------------------------
_mac_eeprom_read:
	mov	r6,dpl
	mov	r7,dph
;	include/ztex-eeprom.h:273: BYTE bytes = 0,i;
	mov	r5,#0x00
;	include/ztex-eeprom.h:275: if ( length == 0 ) 
	mov	a,_mac_eeprom_read_PARM_3
;	include/ztex-eeprom.h:276: return 0;
	jnz	00102$
	mov	dpl,a
	ret
00102$:
;	include/ztex-eeprom.h:278: if ( eeprom_select(EEPROM_MAC_ADDR, 100,0) ) 
	mov	_eeprom_select_PARM_2,#0x64
	mov	_eeprom_select_PARM_3,#0x00
	mov	dpl,#0xA6
	push	ar7
	push	ar6
	push	ar5
	lcall	_eeprom_select
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jz	00149$
	ljmp	00116$
00149$:
;	include/ztex-eeprom.h:281: I2DAT = addr;		// write address
	mov	dptr,#_I2DAT
	mov	a,_mac_eeprom_read_PARM_2
	movx	@dptr,a
;	include/ztex-eeprom.h:282: if ( i2c_waitWrite() ) goto mac_eeprom_read_end;
	push	ar7
	push	ar6
	push	ar5
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jz	00150$
	ljmp	00116$
00150$:
;	include/ztex-eeprom.h:283: I2CS |= bmBIT6;
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	include/ztex-eeprom.h:284: i2c_waitStop();
	push	ar7
	push	ar6
	push	ar5
	lcall	_i2c_waitStop
;	include/ztex-eeprom.h:286: I2CS |= bmBIT7;		// start bit
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x80
	movx	@dptr,a
;	include/ztex-eeprom.h:287: i2c_waitStart();
	lcall	_i2c_waitStart
;	include/ztex-eeprom.h:288: I2DAT = EEPROM_MAC_ADDR | 1;  // select device for reading
	mov	dptr,#_I2DAT
	mov	a,#0xA7
	movx	@dptr,a
;	include/ztex-eeprom.h:289: if ( i2c_waitWrite() ) goto mac_eeprom_read_end;
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jnz	00116$
;	include/ztex-eeprom.h:291: *buf = I2DAT;		// dummy read
	mov	dptr,#_I2DAT
	movx	a,@dptr
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
;	include/ztex-eeprom.h:292: if ( i2c_waitRead()) goto mac_eeprom_read_end; 
	push	ar7
	push	ar6
	push	ar5
	lcall	_i2c_waitRead
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jnz	00116$
	mov	r4,a
00118$:
;	include/ztex-eeprom.h:293: for (; bytes<length; bytes++ ) {
	clr	c
	mov	a,r4
	subb	a,_mac_eeprom_read_PARM_3
	jnc	00113$
;	include/ztex-eeprom.h:294: *buf = I2DAT;		// read data
	mov	dptr,#_I2DAT
	movx	a,@dptr
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
	inc	dptr
	mov	r6,dpl
	mov	r7,dph
;	include/ztex-eeprom.h:295: buf++;
;	include/ztex-eeprom.h:296: if ( i2c_waitRead()) goto mac_eeprom_read_end; 
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_i2c_waitRead
	mov	a,dpl
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	jnz	00116$
;	include/ztex-eeprom.h:293: for (; bytes<length; bytes++ ) {
	inc	r4
	mov	ar5,r4
	sjmp	00118$
00113$:
;	include/ztex-eeprom.h:299: I2CS |= bmBIT5;		// no ACK
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x20
	movx	@dptr,a
;	include/ztex-eeprom.h:300: i = I2DAT;			// dummy read
	mov	dptr,#_I2DAT
	movx	a,@dptr
;	include/ztex-eeprom.h:301: if ( i2c_waitRead()) goto mac_eeprom_read_end; 
	push	ar5
	lcall	_i2c_waitRead
	mov	a,dpl
	pop	ar5
	jnz	00116$
;	include/ztex-eeprom.h:303: I2CS |= bmBIT6;		// stop bit
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	include/ztex-eeprom.h:304: i = I2DAT;			// dummy read
	mov	dptr,#_I2DAT
	movx	a,@dptr
;	include/ztex-eeprom.h:305: i2c_waitStop();
	push	ar5
	lcall	_i2c_waitStop
	pop	ar5
;	include/ztex-eeprom.h:307: mac_eeprom_read_end:
00116$:
;	include/ztex-eeprom.h:308: return bytes;
	mov	dpl,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'mac_eeprom_write'
;------------------------------------------------------------
;addr                      Allocated with name '_mac_eeprom_write_PARM_2'
;length                    Allocated with name '_mac_eeprom_write_PARM_3'
;buf                       Allocated to registers r6 r7 
;bytes                     Allocated to registers r5 
;------------------------------------------------------------
;	include/ztex-eeprom.h:317: BYTE mac_eeprom_write ( __xdata BYTE *buf, BYTE addr, BYTE length ) {
;	-----------------------------------------
;	 function mac_eeprom_write
;	-----------------------------------------
_mac_eeprom_write:
	mov	r6,dpl
	mov	r7,dph
;	include/ztex-eeprom.h:318: BYTE bytes = 0;
	mov	r5,#0x00
;	include/ztex-eeprom.h:320: if ( length == 0 ) 
	mov	a,_mac_eeprom_write_PARM_3
;	include/ztex-eeprom.h:321: return 0;
	jnz	00102$
	mov	dpl,a
	ret
00102$:
;	include/ztex-eeprom.h:323: if ( eeprom_select(EEPROM_MAC_ADDR, 100,0) ) 
	mov	_eeprom_select_PARM_2,#0x64
	mov	_eeprom_select_PARM_3,#0x00
	mov	dpl,#0xA6
	push	ar7
	push	ar6
	push	ar5
	lcall	_eeprom_select
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jz	00152$
	ljmp	00119$
00152$:
;	include/ztex-eeprom.h:326: I2DAT = addr;          	// write address
	mov	dptr,#_I2DAT
	mov	a,_mac_eeprom_write_PARM_2
	movx	@dptr,a
;	include/ztex-eeprom.h:327: if ( i2c_waitWrite() ) goto mac_eeprom_write_end;
	push	ar7
	push	ar6
	push	ar5
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	jz	00153$
	ljmp	00119$
00153$:
;	include/ztex-eeprom.h:329: while ( bytes<length ) {
	mov	r4,_mac_eeprom_write_PARM_2
	mov	r3,#0x00
00116$:
	clr	c
	mov	a,r3
	subb	a,_mac_eeprom_write_PARM_3
	jc	00154$
	ljmp	00118$
00154$:
;	include/ztex-eeprom.h:330: I2DAT = *buf;         	// write data 
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	mov	r6,dpl
	mov	r7,dph
	mov	dptr,#_I2DAT
	mov	a,r2
	movx	@dptr,a
;	include/ztex-eeprom.h:331: buf++;
;	include/ztex-eeprom.h:332: if ( i2c_waitWrite() ) goto mac_eeprom_write_end;
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	jnz	00119$
;	include/ztex-eeprom.h:334: addr++;
	inc	r4
	mov	_mac_eeprom_write_PARM_2,r4
;	include/ztex-eeprom.h:335: bytes++;
	inc	r3
	mov	ar5,r3
;	include/ztex-eeprom.h:336: if ( ( (addr & 8) == 0 ) && ( bytes<length ) ) {
	mov	a,r4
	jb	acc.3,00116$
	clr	c
	mov	a,r3
	subb	a,_mac_eeprom_write_PARM_3
	jnc	00116$
;	include/ztex-eeprom.h:337: I2CS |= bmBIT6;		// stop bit
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	include/ztex-eeprom.h:338: i2c_waitStop();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_i2c_waitStop
;	include/ztex-eeprom.h:340: if ( eeprom_select(EEPROM_MAC_ADDR, 100,0) ) 
	mov	_eeprom_select_PARM_2,#0x64
	mov	_eeprom_select_PARM_3,#0x00
	mov	dpl,#0xA6
	lcall	_eeprom_select
	mov	a,dpl
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	jnz	00119$
;	include/ztex-eeprom.h:343: I2DAT = addr;          	// write address
	mov	dptr,#_I2DAT
	mov	a,r4
	movx	@dptr,a
;	include/ztex-eeprom.h:344: if ( i2c_waitWrite() ) goto mac_eeprom_write_end;
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	jnz	00119$
	ljmp	00116$
00118$:
;	include/ztex-eeprom.h:347: I2CS |= bmBIT6;		// stop bit
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	include/ztex-eeprom.h:348: i2c_waitStop();
	push	ar5
	lcall	_i2c_waitStop
	pop	ar5
;	include/ztex-eeprom.h:350: mac_eeprom_write_end:
00119$:
;	include/ztex-eeprom.h:351: mac_eeprom_addr = addr;
	mov	dptr,#_mac_eeprom_addr
	mov	a,_mac_eeprom_write_PARM_2
	movx	@dptr,a
;	include/ztex-eeprom.h:352: return bytes;
	mov	dpl,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'mac_eeprom_read_ep0'
;------------------------------------------------------------
;i                         Allocated to registers r6 
;b                         Allocated to registers r7 
;------------------------------------------------------------
;	include/ztex-eeprom.h:358: BYTE mac_eeprom_read_ep0 () { 
;	-----------------------------------------
;	 function mac_eeprom_read_ep0
;	-----------------------------------------
_mac_eeprom_read_ep0:
;	include/ztex-eeprom.h:360: b = ep0_payload_transfer;
	mov	dptr,#_ep0_payload_transfer
	movx	a,@dptr
	mov	r7,a
;	include/ztex-eeprom.h:361: i = mac_eeprom_read(EP0BUF, mac_eeprom_addr, b);
	mov	dptr,#_mac_eeprom_addr
	movx	a,@dptr
	mov	_mac_eeprom_read_PARM_2,a
	mov	_mac_eeprom_read_PARM_3,r7
	mov	dptr,#_EP0BUF
	push	ar7
	lcall	_mac_eeprom_read
	mov	r6,dpl
	pop	ar7
;	include/ztex-eeprom.h:362: mac_eeprom_addr += b;
	mov	dptr,#_mac_eeprom_addr
	movx	a,@dptr
	mov	r5,a
	mov	a,r7
	add	a,r5
	movx	@dptr,a
;	include/ztex-eeprom.h:363: return i;
	mov	dpl,r6
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_clocks'
;------------------------------------------------------------
;c                         Allocated to registers 
;------------------------------------------------------------
;	include/ztex-flash2.h:95: void spi_clocks (BYTE c) {
;	-----------------------------------------
;	 function spi_clocks
;	-----------------------------------------
_spi_clocks:
;	include/ztex-flash2.h:107: }
	mov r2,dpl
	010014$:
	setb _IOC6
	nop
	nop
	nop
	clr _IOC6
	djnz r2,010014$
;	# 106 "include/ztex-flash2.h"
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'flash_read_byte'
;------------------------------------------------------------
;	include/ztex-flash2.h:115: __asm  
;	-----------------------------------------
;	 function flash_read_byte
;	-----------------------------------------
_flash_read_byte:
;	include/ztex-flash2.h:166: void flash_read(__xdata BYTE *buf, BYTE len) {
	mov c,_IOC4
;	# 118 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 123 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 128 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 133 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 138 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 143 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 148 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 153 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov dpl,a
	ret
;	include/ztex-flash2.h:167: *buf;					// this avoids stupid warnings
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'flash_read'
;------------------------------------------------------------
;len                       Allocated with name '_flash_read_PARM_2'
;buf                       Allocated to registers 
;------------------------------------------------------------
;	include/ztex-flash2.h:166: void flash_read(__xdata BYTE *buf, BYTE len) {
;	-----------------------------------------
;	 function flash_read
;	-----------------------------------------
_flash_read:
;	include/ztex-flash2.h:225: __asm
;	# 170 "include/ztex-flash2.h"
	mov r2,_flash_read_PARM_2
	010012$:
	mov c,_IOC4
;	# 174 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 179 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 184 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 189 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 194 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 199 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 204 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	mov c,_IOC4
;	# 209 "include/ztex-flash2.h"
	setb _IOC6
	rlc a
	clr _IOC6
	movx @dptr,a
	inc dptr
	djnz r2,010012$
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_write_byte'
;------------------------------------------------------------
;b                         Allocated to registers 
;------------------------------------------------------------
;	include/ztex-flash2.h:232: rlc	a		// 6
;	-----------------------------------------
;	 function spi_write_byte
;	-----------------------------------------
_spi_write_byte:
;	include/ztex-flash2.h:277: *buf;					// this avoids stupid warnings
;	# 227 "include/ztex-flash2.h"
	mov a,dpl
	rlc a
;	# 229 "include/ztex-flash2.h"
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 233 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 238 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 243 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 248 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 253 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 258 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 263 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	nop
	clr _IOC6
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_write'
;------------------------------------------------------------
;len                       Allocated with name '_spi_write_PARM_2'
;buf                       Allocated to registers 
;------------------------------------------------------------
;	include/ztex-flash2.h:276: void spi_write(__xdata BYTE *buf, BYTE len) {
;	-----------------------------------------
;	 function spi_write
;	-----------------------------------------
_spi_write:
;	include/ztex-flash2.h:336: void spi_select() {
;	# 280 "include/ztex-flash2.h"
	mov r2,_flash_read_PARM_2
	010013$:
;	# 283 "include/ztex-flash2.h"
	movx a,@dptr
	rlc a
;	# 285 "include/ztex-flash2.h"
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 289 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 294 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 299 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 304 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 309 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 314 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	rlc a
;	# 319 "include/ztex-flash2.h"
	clr _IOC6
	mov _IOC7,c
	setb _IOC6
	inc dptr
	clr _IOC6
	djnz r2,010013$
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_select'
;------------------------------------------------------------
;	include/ztex-flash2.h:345: // de-select the flash (CS)
;	-----------------------------------------
;	 function spi_select
;	-----------------------------------------
_spi_select:
;	include/ztex-flash2.h:346: void spi_deselect() {
	setb	_IOC5
;	include/ztex-flash2.h:347: SPI_CS = 1;					// CS = 1;
	mov	dpl,#0x08
	lcall	_spi_clocks
;	include/ztex-flash2.h:339: SPI_CS = 0;
	clr	_IOC5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_deselect'
;------------------------------------------------------------
;	include/ztex-flash2.h:346: void spi_deselect() {
;	-----------------------------------------
;	 function spi_deselect
;	-----------------------------------------
_spi_deselect:
;	include/ztex-flash2.h:347: SPI_CS = 1;					// CS = 1;
	setb	_IOC5
;	include/ztex-flash2.h:348: spi_clocks(8);				// 8 dummy clocks to finish a previous command
	mov	dpl,#0x08
	ljmp	_spi_clocks
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_wait'
;------------------------------------------------------------
;i                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	include/ztex-flash2.h:368: BYTE spi_wait() {
;	-----------------------------------------
;	 function spi_wait
;	-----------------------------------------
_spi_wait:
;	include/ztex-flash2.h:356: spi_last_cmd = $0;
	mov	dptr,#_spi_last_cmd
	mov	a,#0x05
	movx	@dptr,a
;	include/ztex-flash2.h:357: spi_select();				// select
	lcall	_spi_select
;	include/ztex-flash2.h:358: spi_write_byte($0);				// CMD 90h
	mov	dpl,#0x05
	lcall	_spi_write_byte
;	include/ztex-flash2.h:372: for (i=0; (flash_read_byte() & bmBIT0) && i<65535; i++ ) { 
	mov	r6,#0x00
	mov	r7,#0x00
00104$:
	push	ar7
	push	ar6
	lcall	_flash_read_byte
	mov	a,dpl
	pop	ar6
	pop	ar7
	jnb	acc.0,00101$
	mov	ar2,r6
	mov	ar3,r7
	mov	r4,#0x00
	mov	r5,#0x00
	clr	c
	mov	a,r2
	subb	a,#0xFF
	mov	a,r3
	subb	a,#0xFF
	mov	a,r4
	subb	a,#0x00
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00101$
;	include/ztex-flash2.h:373: spi_clocks(0);				// 256 dummy clocks
	mov	dpl,#0x00
	push	ar7
	push	ar6
	lcall	_spi_clocks
	pop	ar6
	pop	ar7
;	include/ztex-flash2.h:372: for (i=0; (flash_read_byte() & bmBIT0) && i<65535; i++ ) { 
	inc	r6
	cjne	r6,#0x00,00104$
	inc	r7
	sjmp	00104$
00101$:
;	include/ztex-flash2.h:376: flash_ec = flash_read_byte() & bmBIT0 ? FLASH_EC_TIMEOUT : 0;
	lcall	_flash_read_byte
	mov	a,dpl
	jnb	acc.0,00108$
	mov	r7,#0x02
	sjmp	00109$
00108$:
	mov	r7,#0x00
00109$:
	mov	dptr,#_flash_ec
	mov	a,r7
	movx	@dptr,a
;	include/ztex-flash2.h:377: spi_deselect();
	lcall	_spi_deselect
;	include/ztex-flash2.h:378: return flash_ec;
	mov	dptr,#_flash_ec
	movx	a,@dptr
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'flash_read_init'
;------------------------------------------------------------
;s                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	include/ztex-flash2.h:388: BYTE flash_read_init(WORD s) {
;	-----------------------------------------
;	 function flash_read_init
;	-----------------------------------------
_flash_read_init:
	mov	r6,dpl
	mov	r7,dph
;	include/ztex-flash2.h:389: if ( (SPI_CS) == 0 ) {
	jb	_IOC5,00102$
;	include/ztex-flash2.h:390: flash_ec = FLASH_EC_PENDING;
	mov	dptr,#_flash_ec
	mov	a,#0x04
	movx	@dptr,a
;	include/ztex-flash2.h:391: return FLASH_EC_PENDING;		// we interrupted a pending Flash operation
	mov	dpl,#0x04
	ret
00102$:
;	include/ztex-flash2.h:393: OESPI_OPORT &= ~bmBITSPI_BIT_DO;
	mov	r5,_OEC
	mov	a,#0xEF
	anl	a,r5
	mov	_OEC,a
;	include/ztex-flash2.h:394: OESPI_PORT |= bmBITSPI_BIT_CS | bmBITSPI_BIT_DI | bmBITSPI_BIT_CLK;
	orl	_OEC,#0xE0
;	include/ztex-flash2.h:395: if ( spi_wait() ) {
	push	ar7
	push	ar6
	lcall	_spi_wait
	mov	a,dpl
	pop	ar6
	pop	ar7
	jz	00104$
;	include/ztex-flash2.h:396: return flash_ec;
	mov	dptr,#_flash_ec
	movx	a,@dptr
	mov	dpl,a
	ret
00104$:
;	include/ztex-flash2.h:399: s = s << ((BYTE)flash_sector_size - 8);     
	mov	dptr,#_flash_sector_size
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,#0x00
	mov	a,r4
	add	a,#0xF8
	mov	r4,a
	mov	a,r5
	addc	a,#0xFF
	mov	r5,a
	mov	b,r4
	inc	b
	sjmp	00116$
00115$:
	mov	a,r6
	add	a,r6
	mov	r6,a
	mov	a,r7
	rlc	a
	mov	r7,a
00116$:
	djnz	b,00115$
;	include/ztex-flash2.h:356: spi_last_cmd = $0;
	mov	dptr,#_spi_last_cmd
	mov	a,#0x0B
	movx	@dptr,a
;	include/ztex-flash2.h:357: spi_select();				// select
	push	ar7
	push	ar6
	lcall	_spi_select
;	include/ztex-flash2.h:358: spi_write_byte($0);				// CMD 90h
	mov	dpl,#0x0B
	lcall	_spi_write_byte
	pop	ar6
	pop	ar7
;	include/ztex-flash2.h:360: 
	mov	dpl,r7
	push	ar7
	push	ar6
	lcall	_spi_write_byte
	pop	ar6
	pop	ar7
;	include/ztex-flash2.h:402: spi_write_byte(s & 255);
	mov	dpl,r6
	lcall	_spi_write_byte
;	include/ztex-flash2.h:403: spi_write_byte(0);
	mov	dpl,#0x00
	lcall	_spi_write_byte
;	include/ztex-flash2.h:404: spi_clocks(8);				// 8 dummy clocks
	mov	dpl,#0x08
	lcall	_spi_clocks
;	include/ztex-flash2.h:405: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'flash_read_next'
;------------------------------------------------------------
;	include/ztex-flash2.h:414: BYTE flash_read_next() {
;	-----------------------------------------
;	 function flash_read_next
;	-----------------------------------------
_flash_read_next:
;	include/ztex-flash2.h:415: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'flash_read_finish'
;------------------------------------------------------------
;n                         Allocated to registers 
;------------------------------------------------------------
;	include/ztex-flash2.h:425: void flash_read_finish(WORD n) {
;	-----------------------------------------
;	 function flash_read_finish
;	-----------------------------------------
_flash_read_finish:
;	include/ztex-flash2.h:427: spi_deselect();
	ljmp	_spi_deselect
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_pp'
;------------------------------------------------------------
;	include/ztex-flash2.h:434: BYTE spi_pp () {	
;	-----------------------------------------
;	 function spi_pp
;	-----------------------------------------
_spi_pp:
;	include/ztex-flash2.h:435: spi_deselect();				// finish previous write cmd
	lcall	_spi_deselect
;	include/ztex-flash2.h:437: spi_need_pp = 0;
	mov	dptr,#_spi_need_pp
	clr	a
	movx	@dptr,a
;	include/ztex-flash2.h:439: if ( spi_wait() ) {
	lcall	_spi_wait
	mov	a,dpl
	jz	00102$
;	include/ztex-flash2.h:440: return flash_ec;
	mov	dptr,#_flash_ec
	movx	a,@dptr
	mov	dpl,a
	ret
00102$:
;	include/ztex-flash2.h:356: spi_last_cmd = $0;
	mov	dptr,#_spi_last_cmd
	mov	a,#0x06
	movx	@dptr,a
;	include/ztex-flash2.h:357: spi_select();				// select
	lcall	_spi_select
;	include/ztex-flash2.h:358: spi_write_byte($0);				// CMD 90h
	mov	dpl,#0x06
	lcall	_spi_write_byte
;	include/ztex-flash2.h:443: spi_deselect();
	lcall	_spi_deselect
;	include/ztex-flash2.h:356: spi_last_cmd = $0;
	mov	dptr,#_spi_last_cmd
	mov	a,#0x02
	movx	@dptr,a
;	include/ztex-flash2.h:357: spi_select();				// select
	lcall	_spi_select
;	include/ztex-flash2.h:358: spi_write_byte($0);				// CMD 90h
	mov	dpl,#0x02
	lcall	_spi_write_byte
;	include/ztex-flash2.h:360: 
	mov	dptr,#_spi_write_addr_hi
	movx	a,@dptr
	inc	dptr
	movx	a,@dptr
	mov	dpl,a
	lcall	_spi_write_byte
;	include/ztex-flash2.h:447: spi_write_byte(spi_write_addr_hi & 255);
	mov	dptr,#_spi_write_addr_hi
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	dpl,r6
	lcall	_spi_write_byte
;	include/ztex-flash2.h:448: spi_write_byte(0);
	mov	dpl,#0x00
	lcall	_spi_write_byte
;	include/ztex-flash2.h:449: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'flash_write_byte'
;------------------------------------------------------------
;b                         Allocated to registers r7 
;------------------------------------------------------------
;	include/ztex-flash2.h:456: BYTE flash_write_byte (BYTE b) {
;	-----------------------------------------
;	 function flash_write_byte
;	-----------------------------------------
_flash_write_byte:
	mov	r7,dpl
;	include/ztex-flash2.h:457: if ( spi_need_pp && spi_pp() ) return flash_ec;
	mov	dptr,#_spi_need_pp
	movx	a,@dptr
	mov	r6,a
	jz	00102$
	push	ar7
	lcall	_spi_pp
	mov	a,dpl
	pop	ar7
	jz	00102$
	mov	dptr,#_flash_ec
	movx	a,@dptr
	mov	dpl,a
	ret
00102$:
;	include/ztex-flash2.h:458: spi_write_byte(b);
	mov	dpl,r7
	lcall	_spi_write_byte
;	include/ztex-flash2.h:459: spi_write_addr_lo++;
	mov	dptr,#_spi_write_addr_lo
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
;	include/ztex-flash2.h:460: if ( spi_write_addr_lo == 0 ) {
	mov	dptr,#_spi_write_addr_lo
	movx	a,@dptr
	mov	r7,a
	jnz	00105$
;	include/ztex-flash2.h:461: spi_write_addr_hi++;
	mov	dptr,#_spi_write_addr_hi
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	include/ztex-flash2.h:462: spi_deselect();				// finish write cmd
	lcall	_spi_deselect
;	include/ztex-flash2.h:463: spi_need_pp = 1;
	mov	dptr,#_spi_need_pp
	mov	a,#0x01
	movx	@dptr,a
00105$:
;	include/ztex-flash2.h:465: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'flash_write'
;------------------------------------------------------------
;len                       Allocated with name '_flash_write_PARM_2'
;buf                       Allocated to registers r6 r7 
;b                         Allocated to registers r5 
;------------------------------------------------------------
;	include/ztex-flash2.h:473: BYTE flash_write(__xdata BYTE *buf, BYTE len) {
;	-----------------------------------------
;	 function flash_write
;	-----------------------------------------
_flash_write:
	mov	r6,dpl
	mov	r7,dph
;	include/ztex-flash2.h:475: if ( spi_need_pp && spi_pp() ) return flash_ec;
	mov	dptr,#_spi_need_pp
	movx	a,@dptr
	mov	r5,a
	jz	00102$
	push	ar7
	push	ar6
	lcall	_spi_pp
	mov	a,dpl
	pop	ar6
	pop	ar7
	jz	00102$
	mov	dptr,#_flash_ec
	movx	a,@dptr
	mov	dpl,a
	ret
00102$:
;	include/ztex-flash2.h:477: if ( spi_write_addr_lo == 0 ) {
	mov	dptr,#_spi_write_addr_lo
	movx	a,@dptr
	mov	r5,a
	jnz	00110$
;	include/ztex-flash2.h:478: spi_write(buf,len);
	mov	_spi_write_PARM_2,_flash_write_PARM_2
	mov	dpl,r6
	mov	dph,r7
	lcall	_spi_write
	sjmp	00111$
00110$:
;	include/ztex-flash2.h:481: b = (~spi_write_addr_lo) + 1;
	mov	a,r5
	cpl	a
	mov	r5,a
	inc	r5
;	include/ztex-flash2.h:482: if ( len==0 || len>b ) {
	mov	a,_flash_write_PARM_2
	jz	00106$
	clr	c
	mov	a,r5
	subb	a,_flash_write_PARM_2
	jnc	00107$
00106$:
;	include/ztex-flash2.h:483: spi_write(buf,b);
	mov	_spi_write_PARM_2,r5
	mov	dpl,r6
	mov	dph,r7
	push	ar7
	push	ar6
	push	ar5
	lcall	_spi_write
	pop	ar5
	pop	ar6
	pop	ar7
;	include/ztex-flash2.h:484: len-=b;
	mov	a,_flash_write_PARM_2
	clr	c
	subb	a,r5
	mov	_flash_write_PARM_2,a
;	include/ztex-flash2.h:485: spi_write_addr_hi++;
	mov	dptr,#_spi_write_addr_hi
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	include/ztex-flash2.h:486: spi_write_addr_lo=0;
	mov	dptr,#_spi_write_addr_lo
	clr	a
	movx	@dptr,a
;	include/ztex-flash2.h:487: buf+=b;
	mov	a,r5
	add	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
;	include/ztex-flash2.h:488: if ( spi_pp() ) return flash_ec;
	push	ar7
	push	ar6
	lcall	_spi_pp
	mov	a,dpl
	pop	ar6
	pop	ar7
	jz	00107$
	mov	dptr,#_flash_ec
	movx	a,@dptr
	mov	dpl,a
	ret
00107$:
;	include/ztex-flash2.h:490: spi_write(buf,len);
	mov	_spi_write_PARM_2,_flash_write_PARM_2
	mov	dpl,r6
	mov	dph,r7
	lcall	_spi_write
00111$:
;	include/ztex-flash2.h:493: spi_write_addr_lo+=len;
	mov	dptr,#_spi_write_addr_lo
	movx	a,@dptr
	mov	r7,a
	mov	a,_flash_write_PARM_2
	add	a,r7
	movx	@dptr,a
;	include/ztex-flash2.h:495: if ( spi_write_addr_lo == 0 ) {
	mov	dptr,#_spi_write_addr_lo
	movx	a,@dptr
	mov	r7,a
	jnz	00113$
;	include/ztex-flash2.h:496: spi_write_addr_hi++;
	mov	dptr,#_spi_write_addr_hi
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	include/ztex-flash2.h:497: spi_deselect();				// finish write cmd
	lcall	_spi_deselect
;	include/ztex-flash2.h:498: spi_need_pp = 1;
	mov	dptr,#_spi_need_pp
	mov	a,#0x01
	movx	@dptr,a
00113$:
;	include/ztex-flash2.h:501: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'flash_write_init'
;------------------------------------------------------------
;s                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	include/ztex-flash2.h:513: BYTE flash_write_init(WORD s) {
;	-----------------------------------------
;	 function flash_write_init
;	-----------------------------------------
_flash_write_init:
	mov	r6,dpl
	mov	r7,dph
;	include/ztex-flash2.h:514: if ( !SPI_CS ) {
	jb	_IOC5,00102$
;	include/ztex-flash2.h:515: flash_ec = FLASH_EC_PENDING;
	mov	dptr,#_flash_ec
	mov	a,#0x04
	movx	@dptr,a
;	include/ztex-flash2.h:516: return FLASH_EC_PENDING;		// we interrupted a pending Flash operation
	mov	dpl,#0x04
	ret
00102$:
;	include/ztex-flash2.h:518: OESPI_OPORT &= ~bmBITSPI_BIT_DO;
	mov	r5,_OEC
	mov	a,#0xEF
	anl	a,r5
	mov	_OEC,a
;	include/ztex-flash2.h:519: OESPI_PORT |= bmBITSPI_BIT_CS | bmBITSPI_BIT_DI | bmBITSPI_BIT_CLK;
	orl	_OEC,#0xE0
;	include/ztex-flash2.h:520: if ( spi_wait() ) {
	push	ar7
	push	ar6
	lcall	_spi_wait
	mov	a,dpl
	pop	ar6
	pop	ar7
	jz	00104$
;	include/ztex-flash2.h:521: return flash_ec;
	mov	dptr,#_flash_ec
	movx	a,@dptr
	mov	dpl,a
	ret
00104$:
;	include/ztex-flash2.h:523: spi_write_sector = s;
	mov	dptr,#_spi_write_sector
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	include/ztex-flash2.h:524: s = s << ((BYTE)flash_sector_size - 8);     
	mov	dptr,#_flash_sector_size
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,#0x00
	mov	a,r4
	add	a,#0xF8
	mov	r4,a
	mov	a,r5
	addc	a,#0xFF
	mov	r5,a
	mov	b,r4
	inc	b
	sjmp	00116$
00115$:
	mov	a,r6
	add	a,r6
	mov	r6,a
	mov	a,r7
	rlc	a
	mov	r7,a
00116$:
	djnz	b,00115$
;	include/ztex-flash2.h:525: spi_write_addr_hi = s;
	mov	dptr,#_spi_write_addr_hi
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	include/ztex-flash2.h:526: spi_write_addr_lo = 0;
	mov	dptr,#_spi_write_addr_lo
	clr	a
	movx	@dptr,a
;	include/ztex-flash2.h:356: spi_last_cmd = $0;
	mov	dptr,#_spi_last_cmd
	mov	a,#0x06
	movx	@dptr,a
;	include/ztex-flash2.h:357: spi_select();				// select
	push	ar7
	push	ar6
	lcall	_spi_select
;	include/ztex-flash2.h:358: spi_write_byte($0);				// CMD 90h
	mov	dpl,#0x06
	lcall	_spi_write_byte
;	include/ztex-flash2.h:529: spi_deselect();
	lcall	_spi_deselect
	pop	ar6
	pop	ar7
;	include/ztex-flash2.h:356: spi_last_cmd = $0;
	mov	dptr,#_spi_erase_cmd
	movx	a,@dptr
	mov	dptr,#_spi_last_cmd
	movx	@dptr,a
;	include/ztex-flash2.h:357: spi_select();				// select
	push	ar7
	push	ar6
	lcall	_spi_select
	pop	ar6
	pop	ar7
;	include/ztex-flash2.h:358: spi_write_byte($0);				// CMD 90h
	mov	dptr,#_spi_erase_cmd
	movx	a,@dptr
	mov	dpl,a
	push	ar7
	push	ar6
	lcall	_spi_write_byte
	pop	ar6
	pop	ar7
;	include/ztex-flash2.h:360: 
	mov	dpl,r7
	push	ar7
	push	ar6
	lcall	_spi_write_byte
	pop	ar6
	pop	ar7
;	include/ztex-flash2.h:533: spi_write_byte(s & 255);
	mov	dpl,r6
	lcall	_spi_write_byte
;	include/ztex-flash2.h:534: spi_write_byte(0);
	mov	dpl,#0x00
	lcall	_spi_write_byte
;	include/ztex-flash2.h:535: spi_deselect();
	lcall	_spi_deselect
;	include/ztex-flash2.h:537: spi_need_pp = 1;
	mov	dptr,#_spi_need_pp
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-flash2.h:538: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'flash_write_finish_sector'
;------------------------------------------------------------
;n                         Allocated to registers 
;------------------------------------------------------------
;	include/ztex-flash2.h:548: BYTE flash_write_finish_sector (WORD n) {
;	-----------------------------------------
;	 function flash_write_finish_sector
;	-----------------------------------------
_flash_write_finish_sector:
;	include/ztex-flash2.h:550: spi_deselect();
	lcall	_spi_deselect
;	include/ztex-flash2.h:551: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'flash_write_finish'
;------------------------------------------------------------
;	include/ztex-flash2.h:561: void flash_write_finish () {
;	-----------------------------------------
;	 function flash_write_finish
;	-----------------------------------------
_flash_write_finish:
;	include/ztex-flash2.h:562: spi_deselect();
	ljmp	_spi_deselect
;------------------------------------------------------------
;Allocation info for local variables in function 'flash_write_next'
;------------------------------------------------------------
;	include/ztex-flash2.h:572: BYTE flash_write_next () {
;	-----------------------------------------
;	 function flash_write_next
;	-----------------------------------------
_flash_write_next:
;	include/ztex-flash2.h:573: spi_deselect();
	lcall	_spi_deselect
;	include/ztex-flash2.h:574: return flash_write_init(spi_write_sector+1);
	mov	dptr,#_spi_write_sector
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	ljmp	_flash_write_init
;------------------------------------------------------------
;Allocation info for local variables in function 'flash_init'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;------------------------------------------------------------
;	include/ztex-flash2.h:582: void flash_init() {
;	-----------------------------------------
;	 function flash_init
;	-----------------------------------------
_flash_init:
;	include/ztex-flash2.h:585: PORTCCFG = 0;
	mov	dptr,#_PORTCCFG
	clr	a
	movx	@dptr,a
;	include/ztex-flash2.h:587: flash_enabled = 1;
	mov	dptr,#_flash_enabled
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-flash2.h:588: flash_ec = 0;
	mov	dptr,#_flash_ec
	clr	a
	movx	@dptr,a
;	include/ztex-flash2.h:589: flash_sector_size = 0x8010;  // 64 KByte
	mov	dptr,#_flash_sector_size
	mov	a,#0x10
	movx	@dptr,a
	mov	a,#0x80
	inc	dptr
	movx	@dptr,a
;	include/ztex-flash2.h:590: spi_erase_cmd = 0xd8;
	mov	dptr,#_spi_erase_cmd
	mov	a,#0xD8
	movx	@dptr,a
;	include/ztex-flash2.h:592: OESPI_OPORT &= ~bmBITSPI_BIT_DO;
	mov	r7,_OEC
	mov	a,#0xEF
	anl	a,r7
	mov	_OEC,a
;	include/ztex-flash2.h:593: OESPI_PORT |= bmBITSPI_BIT_CS | bmBITSPI_BIT_DI | bmBITSPI_BIT_CLK;
	orl	_OEC,#0xE0
;	include/ztex-flash2.h:594: SPI_CS = 1;
	setb	_IOC5
;	include/ztex-flash2.h:595: spi_clocks(0);				// 256 clocks
	mov	dpl,#0x00
	lcall	_spi_clocks
;	include/ztex-flash2.h:356: spi_last_cmd = $0;
	mov	dptr,#_spi_last_cmd
	mov	a,#0x90
	movx	@dptr,a
;	include/ztex-flash2.h:357: spi_select();				// select
	lcall	_spi_select
;	include/ztex-flash2.h:358: spi_write_byte($0);				// CMD 90h
	mov	dpl,#0x90
	lcall	_spi_write_byte
;	include/ztex-flash2.h:360: 
	mov	dpl,#0x18
	lcall	_spi_clocks
;	include/ztex-flash2.h:599: spi_device = flash_read_byte();			
	lcall	_flash_read_byte
	mov	a,dpl
	mov	dptr,#_spi_device
	movx	@dptr,a
;	include/ztex-flash2.h:600: spi_deselect();				// deselect
	lcall	_spi_deselect
;	include/ztex-flash2.h:356: spi_last_cmd = $0;
	mov	dptr,#_spi_last_cmd
	mov	a,#0x9F
	movx	@dptr,a
;	include/ztex-flash2.h:357: spi_select();				// select
	lcall	_spi_select
;	include/ztex-flash2.h:358: spi_write_byte($0);				// CMD 90h
	mov	dpl,#0x9F
	lcall	_spi_write_byte
;	include/ztex-flash2.h:360: 
	mov	_flash_read_PARM_2,#0x03
	mov	dptr,#_spi_buffer
	lcall	_flash_read
;	include/ztex-flash2.h:361: /* *********************************************************************
	lcall	_spi_deselect
;	include/ztex-flash2.h:605: if ( spi_buffer[2]<16 || spi_buffer[2]>24 ) {
	mov	dptr,#(_spi_buffer + 0x0002)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x10,00113$
00113$:
	jc	00104$
	mov	a,r7
	add	a,#0xff - 0x18
	jc	00104$
;	include/ztex-flash2.h:608: spi_vendor = spi_buffer[0];
	mov	dptr,#_spi_buffer
	movx	a,@dptr
	mov	dptr,#_spi_vendor
	movx	@dptr,a
;	include/ztex-flash2.h:609: spi_memtype = spi_buffer[1];
	mov	dptr,#(_spi_buffer + 0x0001)
	movx	a,@dptr
	mov	dptr,#_spi_memtype
	movx	@dptr,a
;	include/ztex-flash2.h:625: i=spi_buffer[2]-16;
	mov	dptr,#(_spi_buffer + 0x0002)
	movx	a,@dptr
	add	a,#0xF0
	mov	r7,a
;	include/ztex-flash2.h:627: flash_sectors = 1 << i;
	mov	b,r7
	inc	b
	mov	r7,#0x01
	mov	r6,#0x00
	sjmp	00117$
00116$:
	mov	a,r7
	add	a,r7
	mov	r7,a
	mov	a,r6
	rlc	a
	mov	r6,a
00117$:
	djnz	b,00116$
	mov	dptr,#_flash_sectors
	mov	a,r7
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r6
	rlc	a
	subb	a,acc
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	include/ztex-flash2.h:629: return;
;	include/ztex-flash2.h:631: disable:
	ret
00104$:
;	include/ztex-flash2.h:632: flash_enabled = 0;
	mov	dptr,#_flash_enabled
	clr	a
	movx	@dptr,a
;	include/ztex-flash2.h:633: flash_ec = FLASH_EC_NOTSUPPORTED;
	mov	dptr,#_flash_ec
	mov	a,#0x07
	movx	@dptr,a
;	include/ztex-flash2.h:634: OESPI_PORT &= ~( bmBITSPI_BIT_CS | bmBITSPI_BIT_DI | bmBITSPI_BIT_CLK );
	mov	r7,_OEC
	mov	a,#0x1F
	anl	a,r7
	mov	_OEC,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_read_ep0'
;------------------------------------------------------------
;	include/ztex-flash2.h:660: void spi_read_ep0 () { 
;	-----------------------------------------
;	 function spi_read_ep0
;	-----------------------------------------
_spi_read_ep0:
;	include/ztex-flash2.h:661: flash_read(EP0BUF, ep0_payload_transfer);
	mov	dptr,#_ep0_payload_transfer
	movx	a,@dptr
	mov	_flash_read_PARM_2,a
	mov	dptr,#_EP0BUF
	lcall	_flash_read
;	include/ztex-flash2.h:662: if ( ep0_read_mode==2 && ep0_payload_remaining==0 ) {
	mov	dptr,#_ep0_read_mode
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x02,00104$
	mov	dptr,#_ep0_payload_remaining
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00104$
;	include/ztex-flash2.h:663: spi_deselect();
	ljmp	_spi_deselect
00104$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_send_ep0'
;------------------------------------------------------------
;	include/ztex-flash2.h:687: void spi_send_ep0 () { 
;	-----------------------------------------
;	 function spi_send_ep0
;	-----------------------------------------
_spi_send_ep0:
;	include/ztex-flash2.h:688: flash_write(EP0BUF, ep0_payload_transfer);
	mov	dptr,#_ep0_payload_transfer
	movx	a,@dptr
	mov	_flash_write_PARM_2,a
	mov	dptr,#_EP0BUF
	lcall	_flash_write
;	include/ztex-flash2.h:689: if ( ep0_write_mode==2 && ep0_payload_remaining==0 ) {
	mov	dptr,#_ep0_write_mode
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x02,00104$
	mov	dptr,#_ep0_payload_remaining
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00104$
;	include/ztex-flash2.h:690: spi_deselect();
	ljmp	_spi_deselect
00104$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'reset_fpga'
;------------------------------------------------------------
;	include/ztex-fpga6.h:39: static void reset_fpga () {
;	-----------------------------------------
;	 function reset_fpga
;	-----------------------------------------
_reset_fpga:
;	include/ztex-fpga6.h:40: OEE = bmBIT7;
	mov	_OEE,#0x80
;	include/ztex-fpga6.h:41: IOE = 0;
	mov	_IOE,#0x00
;	include/ztex-fpga6.h:42: wait(1);
	mov	dptr,#0x0001
	lcall	_wait
;	include/ztex-fpga6.h:43: OEE = 0;
	mov	_OEE,#0x00
;	include/ztex-fpga6.h:44: fpga_conf_initialized = 0;
	mov	dptr,#_fpga_conf_initialized
	clr	a
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'init_fpga'
;------------------------------------------------------------
;	include/ztex-fpga6.h:50: static void init_fpga () {
;	-----------------------------------------
;	 function init_fpga
;	-----------------------------------------
_init_fpga:
;	include/ztex-fpga6.h:51: if ( (IOE & bmBIT0) == 0 ) {
	mov	a,_IOE
	jb	acc.0,00102$
;	include/ztex-fpga6.h:53: OEE = bmBIT7;
	mov	_OEE,#0x80
;	include/ztex-fpga6.h:54: IOE = 0;
	mov	_IOE,#0x00
;	include/ztex-fpga6.h:55: wait(1);
	mov	dptr,#0x0001
	lcall	_wait
00102$:
;	include/ztex-fpga6.h:57: OEE = 0;
	mov	_OEE,#0x00
;	include/ztex-fpga6.h:58: fpga_conf_initialized = 0;
	mov	dptr,#_fpga_conf_initialized
	clr	a
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'init_fpga_configuration'
;------------------------------------------------------------
;k                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	include/ztex-fpga6.h:64: static void init_fpga_configuration () {
;	-----------------------------------------
;	 function init_fpga_configuration
;	-----------------------------------------
_init_fpga_configuration:
;	include/ztex-fpga6.h:69: IFCONFIG = bmBIT7;
	mov	dptr,#_IFCONFIG
	mov	a,#0x80
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:71: PORTCCFG = 0;
	mov	dptr,#_PORTCCFG
;	include/ztex-fpga6.h:72: PORTECFG = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_PORTECFG
	movx	@dptr,a
;	include/ztex-fpga6.h:74: OOEC = OEC;
	mov	dptr,#_OOEC
	mov	a,_OEC
	movx	@dptr,a
;	include/ztex-fpga6.h:75: fpga_conf_initialized = 123;
	mov	dptr,#_fpga_conf_initialized
	mov	a,#0x7B
	movx	@dptr,a
;	include/ztex-fpga6.h:77: OEC &= ~( bmBIT7 | bmBIT4);		// in: MOSI, MISO
	mov	r7,_OEC
	mov	a,#0x6F
	anl	a,r7
	mov	_OEC,a
;	include/ztex-fpga6.h:78: OEC |= bmBIT6;               	// out: CCLK
	orl	_OEC,#0x40
;	include/ztex-fpga6.h:79: IOC6 = 1;
	setb	_IOC6
;	include/ztex-fpga6.h:83: OEE = bmBIT3 | bmBIT4 | bmBIT7 | bmBIT2 | bmBIT5;
	mov	_OEE,#0xBC
;	include/ztex-fpga6.h:84: IOE = bmBIT3;
	mov	_IOE,#0x08
;	include/ztex-fpga6.h:86: wait(2);
	mov	dptr,#0x0002
	lcall	_wait
;	include/ztex-fpga6.h:87: IOE = bmBIT3 | bmBIT7;		// ready for configuration
	mov	_IOE,#0x88
;	include/ztex-fpga6.h:88: IOC6 = 0;
	clr	_IOC6
;	include/ztex-fpga6.h:91: while (!(IOE & bmBIT1) && k<65535)
	mov	r6,#0x00
	mov	r7,#0x00
00102$:
	mov	a,_IOE
	jb	acc.1,00104$
	mov	ar2,r6
	mov	ar3,r7
	mov	r4,#0x00
	mov	r5,#0x00
	clr	c
	mov	a,r2
	subb	a,#0xFF
	mov	a,r3
	subb	a,#0xFF
	mov	a,r4
	subb	a,#0x00
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00104$
;	include/ztex-fpga6.h:92: k++;
	inc	r6
	cjne	r6,#0x00,00102$
	inc	r7
	sjmp	00102$
00104$:
;	include/ztex-fpga6.h:94: fpga_init_b = (IOE & bmBIT1) ? 200 : 100;
	mov	a,_IOE
	jnb	acc.1,00107$
	mov	r7,#0xC8
	sjmp	00108$
00107$:
	mov	r7,#0x64
00108$:
	mov	dptr,#_fpga_init_b
	mov	a,r7
	movx	@dptr,a
;	include/ztex-fpga6.h:95: fpga_bytes = 0;
	mov	dptr,#_fpga_bytes
	clr	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	include/ztex-fpga6.h:96: fpga_checksum = 0;
	mov	dptr,#_fpga_checksum
	clr	a
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'post_fpga_config'
;------------------------------------------------------------
;	include/ztex-fpga6.h:102: static void post_fpga_config () {
;	-----------------------------------------
;	 function post_fpga_config
;	-----------------------------------------
_post_fpga_config:
;	transceiver.c:50: reset ();
	ljmp	_reset
;------------------------------------------------------------
;Allocation info for local variables in function 'finish_fpga_configuration'
;------------------------------------------------------------
;w                         Allocated to registers r7 
;------------------------------------------------------------
;	include/ztex-fpga6.h:109: static void finish_fpga_configuration () {
;	-----------------------------------------
;	 function finish_fpga_configuration
;	-----------------------------------------
_finish_fpga_configuration:
;	include/ztex-fpga6.h:111: fpga_init_b += (IOE & bmBIT1) ? 22 : 11;
	mov	a,_IOE
	jnb	acc.1,00108$
	mov	r7,#0x16
	sjmp	00109$
00108$:
	mov	r7,#0x0B
00109$:
	mov	dptr,#_fpga_init_b
	movx	a,@dptr
	mov	r6,a
	mov	a,r7
	add	a,r6
	movx	@dptr,a
;	include/ztex-fpga6.h:113: for ( w=0; w<64; w++ ) {
	mov	r7,#0x00
00104$:
;	include/ztex-fpga6.h:114: IOC6 = 1; IOC6 = 0; 
	setb	_IOC6
	clr	_IOC6
;	include/ztex-fpga6.h:113: for ( w=0; w<64; w++ ) {
	inc	r7
	cjne	r7,#0x40,00124$
00124$:
	jc	00104$
;	include/ztex-fpga6.h:116: IOE |= bmBIT2;		// CSI = 1
	orl	_IOE,#0x04
;	include/ztex-fpga6.h:117: IOC6 = 1; IOC6 = 0;
	setb	_IOC6
	clr	_IOC6
;	include/ztex-fpga6.h:118: IOC6 = 1; IOC6 = 0;
	setb	_IOC6
	clr	_IOC6
;	include/ztex-fpga6.h:119: IOC6 = 1; IOC6 = 0;
	setb	_IOC6
	clr	_IOC6
;	include/ztex-fpga6.h:120: IOC6 = 1; IOC6 = 0;
	setb	_IOC6
	clr	_IOC6
;	include/ztex-fpga6.h:122: OEE = 0;
	mov	_OEE,#0x00
;	include/ztex-fpga6.h:123: OEC = OOEC;
	mov	dptr,#_OOEC
	movx	a,@dptr
	mov	_OEC,a
;	include/ztex-fpga6.h:124: if ( IOE & bmBIT0 )  {
	mov	a,_IOE
	jnb	acc.0,00106$
;	include/ztex-fpga6.h:125: post_fpga_config();
	ljmp	_post_fpga_config
00106$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'fpga_send_ep0'
;------------------------------------------------------------
;oOEB                      Allocated with name '_fpga_send_ep0_oOEB_1_105'
;------------------------------------------------------------
;	include/ztex-fpga6.h:160: void fpga_send_ep0() {			// send FPGA configuration data
;	-----------------------------------------
;	 function fpga_send_ep0
;	-----------------------------------------
_fpga_send_ep0:
;	include/ztex-fpga6.h:162: oOEB = OEB;
	mov	_fpga_send_ep0_oOEB_1_105,_OEB
;	include/ztex-fpga6.h:163: OEB = 255;
	mov	_OEB,#0xFF
;	include/ztex-fpga6.h:164: fpga_bytes += ep0_payload_transfer;
	mov	dptr,#_ep0_payload_transfer
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#_fpga_bytes
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	ar0,r6
	mov	r1,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	mov	dptr,#_fpga_bytes
	mov	a,r0
	add	a,r2
	movx	@dptr,a
	mov	a,r1
	addc	a,r3
	inc	dptr
	movx	@dptr,a
	mov	a,r6
	addc	a,r4
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	addc	a,r5
	inc	dptr
	movx	@dptr,a
;	include/ztex-fpga6.h:192: OEB = oOEB;
	mov dptr,#_EP0BCL
	movx a,@dptr
	jz 010000$
	mov r2,a
	mov _AUTOPTRL1,#(_EP0BUF)
	mov _AUTOPTRH1,#(_EP0BUF >> 8)
	mov _AUTOPTRSETUP,#0x07
	mov dptr,#_fpga_checksum
	movx a,@dptr
	mov r1,a
	mov dptr,#_XAUTODAT1
	010001$:
	movx a,@dptr
	mov _IOB,a
	setb _IOC6
	add a,r1
	mov r1,a
	clr _IOC6
	djnz r2, 010001$
;	# 185 "include/ztex-fpga6.h"
	mov dptr,#_fpga_checksum
	mov a,r1
	movx @dptr,a
	010000$:
;	include/ztex-fpga6.h:193: if ( EP0BCL<64 ) {
	mov	_OEB,_fpga_send_ep0_oOEB_1_105
;	include/ztex-fpga6.h:194: finish_fpga_configuration();
	mov	dptr,#_EP0BCL
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x40,00108$
00108$:
	jnc	00103$
;	include/ztex-fpga6.h:195: } 
	ljmp	_finish_fpga_configuration
00103$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'init_cpld_fpga_configuration'
;------------------------------------------------------------
;	include/ztex-fpga6.h:249: void init_cpld_fpga_configuration() {
;	-----------------------------------------
;	 function init_cpld_fpga_configuration
;	-----------------------------------------
_init_cpld_fpga_configuration:
;	include/ztex-fpga6.h:250: IFCONFIG = bmBIT7 | bmBIT6 | 2;	// Internal source, 48MHz, GPIF
	mov	dptr,#_IFCONFIG
	mov	a,#0xC2
	movx	@dptr,a
;	include/ztex-fpga6.h:252: GPIFREADYCFG = 0;
	mov	dptr,#_GPIFREADYCFG
;	include/ztex-fpga6.h:253: GPIFCTLCFG = 0x0; 
;	include/ztex-fpga6.h:254: GPIFIDLECS = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_GPIFCTLCFG
	movx	@dptr,a
	mov	dptr,#_GPIFIDLECS
	movx	@dptr,a
;	include/ztex-fpga6.h:255: GPIFIDLECTL = 4;
	mov	dptr,#_GPIFIDLECTL
	mov	a,#0x04
	movx	@dptr,a
;	include/ztex-fpga6.h:256: GPIFWFSELECT = 0x4E;
	mov	dptr,#_GPIFWFSELECT
	mov	a,#0x4E
	movx	@dptr,a
;	include/ztex-fpga6.h:257: GPIFREADYSTAT = 0;
	mov	dptr,#_GPIFREADYSTAT
	clr	a
	movx	@dptr,a
;	include/ztex-utils.h:121: AUTOPTRL1=LO(&($0));
	mov	_AUTOPTRL1,#_GPIF_WAVE_DATA_HSFPGA_24MHZ
;	include/ztex-utils.h:122: AUTOPTRH1=HI(&($0));
	mov	r6,#_GPIF_WAVE_DATA_HSFPGA_24MHZ
	mov	r7,#(_GPIF_WAVE_DATA_HSFPGA_24MHZ >> 8)
	mov	ar6,r7
	mov	_AUTOPTRH1,r6
;	include/ztex-utils.h:123: AUTOPTRL2=LO(&($1));
	mov	_AUTOPTRL2,#_GPIF_WAVE3_DATA
;	include/ztex-utils.h:124: AUTOPTRH2=HI(&($1));
	mov	r6,#_GPIF_WAVE3_DATA
	mov	r7,#(_GPIF_WAVE3_DATA >> 8)
	mov	ar6,r7
	mov	_AUTOPTRH2,r6
;	include/ztex-utils.h:130: __endasm; 
	push ar2
	mov r2,#(32);
	lcall _MEM_COPY1_int
	pop ar2
;	include/ztex-fpga6.h:261: FLOWSTATE = 0;
	mov	dptr,#_FLOWSTATE
	clr	a
	movx	@dptr,a
;	include/ztex-fpga6.h:262: FLOWLOGIC = 0x10;
	mov	dptr,#_FLOWLOGIC
	mov	a,#0x10
	movx	@dptr,a
;	include/ztex-fpga6.h:263: FLOWEQ0CTL = 0;
	mov	dptr,#_FLOWEQ0CTL
;	include/ztex-fpga6.h:264: FLOWEQ1CTL = 0;
;	include/ztex-fpga6.h:265: FLOWHOLDOFF = 0;
;	include/ztex-fpga6.h:266: FLOWSTB = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_FLOWEQ1CTL
	movx	@dptr,a
	mov	dptr,#_FLOWHOLDOFF
	movx	@dptr,a
	mov	dptr,#_FLOWSTB
	movx	@dptr,a
;	include/ztex-fpga6.h:267: FLOWSTBEDGE = 0;
	mov	dptr,#_FLOWSTBEDGE
;	include/ztex-fpga6.h:268: FLOWSTBHPERIOD = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_FLOWSTBHPERIOD
	movx	@dptr,a
;	include/ztex-fpga6.h:270: REVCTL = 0x1;				// reset fifo
	mov	dptr,#_REVCTL
	mov	a,#0x01
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:272: FIFORESET = 0x80;
	mov	dptr,#_FIFORESET
	mov	a,#0x80
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:274: FIFORESET = HS_FPGA_CONF_EP;
	mov	dptr,#_FIFORESET
	mov	a,#0x06
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:276: FIFORESET = 0x0;
	mov	dptr,#_FIFORESET
	clr	a
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:279: EPHS_FPGA_CONF_EPFIFOCFG = 0;		// config fifo
	mov	dptr,#_EP6FIFOCFG
	clr	a
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:281: EPHS_FPGA_CONF_EPFIFOCFG = bmBIT4 | 0;
	mov	dptr,#_EP6FIFOCFG
	mov	a,#0x10
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:283: EPHS_FPGA_CONF_EPGPIFFLGSEL = 1;
	mov	dptr,#_EP6GPIFFLGSEL
	mov	a,#0x01
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:286: GPIFTCB3 = 1;				// abort after at least 14*65536 transactions
	mov	dptr,#_GPIFTCB3
	mov	a,#0x01
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:288: GPIFTCB2 = 0;
	mov	dptr,#_GPIFTCB2
	clr	a
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:290: GPIFTCB1 = 0;
	mov	dptr,#_GPIFTCB1
	clr	a
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:292: GPIFTCB0 = 0;
	mov	dptr,#_GPIFTCB0
	clr	a
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:295: EPHS_FPGA_CONF_EPGPIFTRIG = 0xff;		// arm fifos
	mov	dptr,#_EP6GPIFTRIG
	mov	a,#0xFF
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:298: OEC &= ~bmBIT6;				// disable CCLK output
	mov	r7,_OEC
	mov	a,#0xBF
	anl	a,r7
	mov	_OEC,a
;	include/ztex-fpga6.h:299: IOE = bmBIT4 | bmBIT7;		        // HS config mode
	mov	_IOE,#0x90
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'abscode_identity'
;------------------------------------------------------------
;	include/ztex-descriptors.h:131: void abscode_identity()// _naked
;	-----------------------------------------
;	 function abscode_identity
;	-----------------------------------------
_abscode_identity:
;	include/ztex-descriptors.h:186: #endif
	.area ABSCODE (ABS,CODE)
	.org 0x06c
	.db 40
	.org _ZTEX_DESCRIPTOR_VERSION
	.db 1
	.org _ZTEXID
	.ascii "ZTEX"
	.org _PRODUCT_ID
	.db 10
	.db 16
	.db 0
	.db 0
	.org _FW_VERSION
	.db 0
	.org _INTERFACE_VERSION
	.db 1
	.org _INTERFACE_CAPABILITIES
;	# 185 "include/ztex-descriptors.h"
	.db 0 + 1 + 2 + 4 + 32 + 64
;	# 191 "include/ztex-descriptors.h"
	.db 0
;	# 196 "include/ztex-descriptors.h"
	.db 0
	.db 0
	.db 0
	.db 0
	.org _MODULE_RESERVED
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.org _SN_STRING
	.ascii "0000000000"
	.area CSEG (CODE)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'resetToggleData'
;------------------------------------------------------------
;	include/ztex-isr.h:34: static void resetToggleData () {
;	-----------------------------------------
;	 function resetToggleData
;	-----------------------------------------
_resetToggleData:
;	include/ztex-isr.h:45: TOGCTL = 0;				// EP0 out
	mov	dptr,#_TOGCTL
	clr	a
	movx	@dptr,a
;	include/ztex-isr.h:46: TOGCTL = 0 | bmBIT5;
;	include/ztex-isr.h:47: TOGCTL = 0x10;			// EP0 in
;	include/ztex-isr.h:48: TOGCTL = 0x10 | bmBIT5;
;	include/ztex-isr.h:49: #ifeq[EP1OUT_DIR][OUT]
	mov	dptr,#_TOGCTL
	mov	a,#0x20
	movx	@dptr,a
	mov	a,#0x10
	movx	@dptr,a
	mov	a,#0x30
	movx	@dptr,a
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:51: TOGCTL = 1 | bmBIT5;
;	include/ztex-isr.h:52: #endif    
;	include/ztex-isr.h:55: TOGCTL = 0x11 | bmBIT5;
;	include/ztex-isr.h:36: #ifeq[EP$0_DIR][OUT]
	mov	dptr,#_TOGCTL
	mov	a,#0x21
	movx	@dptr,a
	mov	a,#0x11
	movx	@dptr,a
	mov	a,#0x31
	movx	@dptr,a
	mov	a,#0x12
	movx	@dptr,a
;	include/ztex-isr.h:42: TOGCTL = bmBIT4 | $0 | bmBIT5;
;	include/ztex-isr.h:36: #ifeq[EP$0_DIR][OUT]
;	include/ztex-isr.h:38: TOGCTL = $0 | bmBIT5;
	mov	dptr,#_TOGCTL
	mov	a,#0x32
	movx	@dptr,a
	mov	a,#0x06
	movx	@dptr,a
	mov	a,#0x26
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sendStringDescriptor'
;------------------------------------------------------------
;hiAddr                    Allocated with name '_sendStringDescriptor_PARM_2'
;size                      Allocated with name '_sendStringDescriptor_PARM_3'
;loAddr                    Allocated to registers r7 
;i                         Allocated to registers r7 
;------------------------------------------------------------
;	include/ztex-isr.h:68: static void sendStringDescriptor (BYTE loAddr, BYTE hiAddr, BYTE size)
;	-----------------------------------------
;	 function sendStringDescriptor
;	-----------------------------------------
_sendStringDescriptor:
	mov	r7,dpl
;	include/ztex-isr.h:71: if ( size > 31) size = 31;
	mov	a,_sendStringDescriptor_PARM_3
	add	a,#0xff - 0x1F
	jnc	00102$
	mov	_sendStringDescriptor_PARM_3,#0x1F
00102$:
;	include/ztex-isr.h:72: if (SETUPDAT[7] == 0 && SETUPDAT[6]<size ) size = SETUPDAT[6];
	mov	dptr,#(_SETUPDAT + 0x0007)
	movx	a,@dptr
	jnz	00104$
	mov	dptr,#(_SETUPDAT + 0x0006)
	movx	a,@dptr
	mov	r6,a
	clr	c
	subb	a,_sendStringDescriptor_PARM_3
	jnc	00104$
	mov	dptr,#(_SETUPDAT + 0x0006)
	movx	a,@dptr
	mov	_sendStringDescriptor_PARM_3,a
00104$:
;	include/ztex-isr.h:73: AUTOPTRSETUP = 7;
	mov	_AUTOPTRSETUP,#0x07
;	include/ztex-isr.h:74: AUTOPTRL1 = loAddr;
	mov	_AUTOPTRL1,r7
;	include/ztex-isr.h:75: AUTOPTRH1 = hiAddr;
	mov	_AUTOPTRH1,_sendStringDescriptor_PARM_2
;	include/ztex-isr.h:76: AUTOPTRL2 = (BYTE)(((unsigned short)(&EP0BUF))+1);
	mov	r6,#_EP0BUF
	mov	r7,#(_EP0BUF >> 8)
	mov	a,r6
	inc	a
	mov	_AUTOPTRL2,a
;	include/ztex-isr.h:77: AUTOPTRH2 = (BYTE)((((unsigned short)(&EP0BUF))+1) >> 8);
	mov	r6,#_EP0BUF
	mov	r7,#(_EP0BUF >> 8)
	inc	r6
	cjne	r6,#0x00,00131$
	inc	r7
00131$:
	mov	_AUTOPTRH2,r7
;	include/ztex-isr.h:78: XAUTODAT2 = 3;
	mov	dptr,#_XAUTODAT2
	mov	a,#0x03
	movx	@dptr,a
;	include/ztex-isr.h:79: for (i=0; i<size; i++) {
	mov	r7,#0x00
00108$:
	clr	c
	mov	a,r7
	subb	a,_sendStringDescriptor_PARM_3
	jnc	00106$
;	include/ztex-isr.h:80: XAUTODAT2 = XAUTODAT1;
	mov	dptr,#_XAUTODAT1
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#_XAUTODAT2
	movx	@dptr,a
;	include/ztex-isr.h:81: XAUTODAT2 = 0;
	mov	dptr,#_XAUTODAT2
	clr	a
	movx	@dptr,a
;	include/ztex-isr.h:79: for (i=0; i<size; i++) {
	inc	r7
	sjmp	00108$
00106$:
;	include/ztex-isr.h:83: i = (size+1) << 1;
	mov	a,_sendStringDescriptor_PARM_3
	inc	a
;	include/ztex-isr.h:84: EP0BUF[0] = i;
	add	a,acc
	mov	r7,a
	mov	dptr,#_EP0BUF
	movx	@dptr,a
;	include/ztex-isr.h:85: EP0BUF[1] = 3;
	mov	dptr,#(_EP0BUF + 0x0001)
	mov	a,#0x03
	movx	@dptr,a
;	include/ztex-isr.h:86: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-isr.h:87: EP0BCL = i;
	mov	dptr,#_EP0BCL
	mov	a,r7
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ep0_payload_update'
;------------------------------------------------------------
;	include/ztex-isr.h:93: static void ep0_payload_update() {
;	-----------------------------------------
;	 function ep0_payload_update
;	-----------------------------------------
_ep0_payload_update:
;	include/ztex-isr.h:94: ep0_payload_transfer = ( ep0_payload_remaining > 64 ) ? 64 : ep0_payload_remaining;
	mov	dptr,#_ep0_payload_remaining
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	c
	mov	a,#0x40
	subb	a,r6
	clr	a
	subb	a,r7
	jnc	00103$
	mov	r4,#0x40
	mov	r5,#0x00
	sjmp	00104$
00103$:
	mov	ar4,r6
	mov	ar5,r7
00104$:
	mov	dptr,#_ep0_payload_transfer
	mov	a,r4
	movx	@dptr,a
;	include/ztex-isr.h:95: ep0_payload_remaining -= ep0_payload_transfer;
	mov	r5,#0x00
	mov	dptr,#_ep0_payload_remaining
	mov	a,r6
	clr	c
	subb	a,r4
	movx	@dptr,a
	mov	a,r7
	subb	a,r5
	inc	dptr
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ep0_vendor_cmd_su'
;------------------------------------------------------------
;	include/ztex-isr.h:102: static void ep0_vendor_cmd_su() {
;	-----------------------------------------
;	 function ep0_vendor_cmd_su
;	-----------------------------------------
_ep0_vendor_cmd_su:
;	include/ztex-isr.h:103: switch ( ep0_prev_setup_request ) {
	mov	dptr,#_ep0_prev_setup_request
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x31,00163$
	ljmp	00111$
00163$:
	cjne	r7,#0x32,00164$
	ljmp	00112$
00164$:
	cjne	r7,#0x34,00165$
	ljmp	00115$
00165$:
	cjne	r7,#0x35,00166$
	ljmp	00116$
00166$:
	cjne	r7,#0x39,00167$
	sjmp	00105$
00167$:
	cjne	r7,#0x3C,00168$
	sjmp	00106$
00168$:
	cjne	r7,#0x42,00169$
	sjmp	00107$
00169$:
	cjne	r7,#0x80,00170$
	sjmp	00101$
00170$:
	cjne	r7,#0x81,00171$
	sjmp	00102$
00171$:
	cjne	r7,#0x82,00172$
	sjmp	00103$
00172$:
	cjne	r7,#0x83,00173$
	sjmp	00104$
00173$:
	ljmp	00117$
;	include/ztex-conf.h:123: case $0:			
00101$:
;	include/ztex-conf.h:124: $1
;	include/ztex-conf.h:125: break;
	ljmp	_send
;	include/ztex-conf.h:123: case $0:			
00102$:
;	include/ztex-conf.h:124: $1
;	include/ztex-conf.h:125: break;
	ljmp	_receive
;	include/ztex-conf.h:123: case $0:			
00103$:
;	include/ztex-conf.h:124: $1
;	include/ztex-conf.h:125: break;
	ljmp	_request
;	include/ztex-conf.h:123: case $0:			
00104$:
;	include/ztex-conf.h:124: $1
;	include/ztex-conf.h:125: break;
	ljmp	_reset
;	include/ztex-conf.h:123: case $0:			
00105$:
;	include/ztex-eeprom.h:236: eeprom_write_checksum = 0;
	mov	dptr,#_eeprom_write_checksum
;	include/ztex-eeprom.h:237: eeprom_write_bytes = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_eeprom_write_bytes
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	include/ztex-eeprom.h:238: eeprom_addr =  ( SETUPDAT[3] << 8) | SETUPDAT[2];	// Address
	mov	dptr,#(_SETUPDAT + 0x0003)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	mov	dptr,#_eeprom_addr
	mov	a,r5
	orl	a,r7
	movx	@dptr,a
	mov	a,r4
	orl	a,r6
	inc	dptr
	movx	@dptr,a
;	include/ztex-conf.h:125: break;
	ret
;	include/ztex-conf.h:123: case $0:			
00106$:
;	include/ztex-conf.h:125: break;
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	dptr,#_mac_eeprom_addr
	movx	@dptr,a
	ret
;	include/ztex-conf.h:123: case $0:			
00107$:
;	include/ztex-flash2.h:695: ep0_write_mode = SETUPDAT[5];
	mov	dptr,#(_SETUPDAT + 0x0005)
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_ep0_write_mode
	movx	@dptr,a
;	include/ztex-flash2.h:696: if ( (ep0_write_mode == 0) && flash_write_init((SETUPDAT[3] << 8) | SETUPDAT[2]) ) {
	mov	a,r7
	jz	00174$
	ret
00174$:
	mov	dptr,#(_SETUPDAT + 0x0003)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	r4,#0x00
	orl	a,r7
	mov	dpl,a
	mov	a,r4
	orl	a,r6
	mov	dph,a
	lcall	_flash_write_init
	mov	a,dpl
	jz	00119$
;	include/ztex-conf.h:137: EP0CS |= 0x01;	// set stall
	mov	dptr,#_EP0CS
	movx	a,@dptr
	orl	a,#0x01
	movx	@dptr,a
;	include/ztex-conf.h:138: ep0_payload_remaining = 0;
	mov	dptr,#_ep0_payload_remaining
	clr	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	include/ztex-conf.h:139: break;
;	include/ztex-conf.h:123: case $0:			
	ret
00111$:
;	include/ztex-conf.h:124: $1
;	include/ztex-conf.h:125: break;
;	include/ztex-conf.h:123: case $0:			
	ljmp	_reset_fpga
00112$:
;	include/ztex-fpga6.h:199: if ( fpga_conf_initialized != 123 )
	mov	dptr,#_fpga_conf_initialized
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x7B,00176$
	ret
00176$:
;	include/ztex-fpga6.h:200: init_fpga_configuration();
;	include/ztex-conf.h:125: break;
;	include/ztex-conf.h:123: case $0:			
	ljmp	_init_fpga_configuration
00115$:
;	include/ztex-fpga6.h:304: init_fpga_configuration();
	lcall	_init_fpga_configuration
;	include/ztex-fpga6.h:306: EPHS_FPGA_CONF_EPCS &= ~bmBIT0;		// clear stall bit
	mov	dptr,#_EP6CS
	movx	a,@dptr
	anl	a,#0xFE
	movx	@dptr,a
;	include/ztex-fpga6.h:308: GPIFABORT = 0xFF;				// abort pendig 
	mov	dptr,#_GPIFABORT
	mov	a,#0xFF
	movx	@dptr,a
;	include/ztex-fpga6.h:310: init_cpld_fpga_configuration();
;	include/ztex-conf.h:125: break;
;	include/ztex-conf.h:123: case $0:			
	ljmp	_init_cpld_fpga_configuration
00116$:
;	include/ztex-fpga6.h:319: IOE = bmBIT3 | bmBIT7;		
	mov	_IOE,#0x88
;	include/ztex-fpga6.h:320: OEC |= bmBIT6;               	// out: CCLK
	orl	_OEC,#0x40
;	include/ztex-fpga6.h:322: GPIFABORT = 0xFF;
	mov	dptr,#_GPIFABORT
	mov	a,#0xFF
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:324: IFCONFIG &= 0xf0;
	mov	dptr,#_IFCONFIG
	movx	a,@dptr
	mov	r7,a
	anl	a,#0xF0
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex-fpga6.h:327: finish_fpga_configuration();
;	include/ztex-conf.h:125: break;
;	include/ztex-isr.h:105: default:
	ljmp	_finish_fpga_configuration
00117$:
;	include/ztex-isr.h:106: EP0CS |= 0x01;			// set stall, unknown request
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	orl	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:107: }
00119$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SUDAV_ISR'
;------------------------------------------------------------
;a                         Allocated to registers r7 
;------------------------------------------------------------
;	include/ztex-isr.h:113: static void SUDAV_ISR () __interrupt
;	-----------------------------------------
;	 function SUDAV_ISR
;	-----------------------------------------
_SUDAV_ISR:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:116: ep0_prev_setup_request = bRequest;
	mov	dptr,#_bRequest
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_ep0_prev_setup_request
	movx	@dptr,a
;	include/ztex-isr.h:117: SUDPTRCTL = 1;
	mov	dptr,#_SUDPTRCTL
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:120: switch ( bRequest ) {
	mov	dptr,#_bRequest
	movx	a,@dptr
	mov  r7,a
	add	a,#0xff - 0x0C
	jnc	00340$
	ljmp	00160$
00340$:
	mov	a,r7
	mov	b,a
	add	a,#(00341$-3-.)
	movc	a,@a+pc
	mov	dpl,a
	mov	a,b
	add	a,#(00342$-3-.)
	movc	a,@a+pc
	mov	dph,a
	clr	a
	jmp	@a+dptr
00341$:
	.db	00101$
	.db	00112$
	.db	00160$
	.db	00122$
	.db	00160$
	.db	00160$
	.db	00132$
	.db	00152$
	.db	00153$
	.db	00154$
	.db	00155$
	.db	00156$
	.db	00157$
00342$:
	.db	00101$>>8
	.db	00112$>>8
	.db	00160$>>8
	.db	00122$>>8
	.db	00160$>>8
	.db	00160$>>8
	.db	00132$>>8
	.db	00152$>>8
	.db	00153$>>8
	.db	00154$>>8
	.db	00155$>>8
	.db	00156$>>8
	.db	00157$>>8
;	include/ztex-isr.h:121: case 0x00:	// get status 
00101$:
;	include/ztex-isr.h:122: switch(SETUPDAT[0]) {
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x80,00343$
	sjmp	00102$
00343$:
	cjne	r7,#0x81,00344$
	sjmp	00103$
00344$:
	cjne	r7,#0x82,00345$
	sjmp	00104$
00345$:
	ljmp	00160$
;	include/ztex-isr.h:123: case 0x80:  		// self powered and remote 
00102$:
;	include/ztex-isr.h:124: EP0BUF[0] = 0;	// not self-powered, no remote wakeup
	mov	dptr,#_EP0BUF
;	include/ztex-isr.h:125: EP0BUF[1] = 0;
;	include/ztex-isr.h:126: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#(_EP0BUF + 0x0001)
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	include/ztex-isr.h:127: EP0BCL = 2;
	mov	dptr,#_EP0BCL
	mov	a,#0x02
	movx	@dptr,a
;	include/ztex-isr.h:128: break;
	ljmp	00160$
;	include/ztex-isr.h:129: case 0x81:		// interface (reserved)
00103$:
;	include/ztex-isr.h:130: EP0BUF[0] = 0; 	// always return zeros
	mov	dptr,#_EP0BUF
;	include/ztex-isr.h:131: EP0BUF[1] = 0;
;	include/ztex-isr.h:132: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#(_EP0BUF + 0x0001)
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	include/ztex-isr.h:133: EP0BCL = 2;
	mov	dptr,#_EP0BCL
	mov	a,#0x02
	movx	@dptr,a
;	include/ztex-isr.h:134: break;
	ljmp	00160$
;	include/ztex-isr.h:135: case 0x82:	
00104$:
;	include/ztex-isr.h:136: switch ( SETUPDAT[4] ) {
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	mov	r7,a
	jz	00106$
	cjne	r7,#0x01,00347$
	sjmp	00107$
00347$:
	cjne	r7,#0x80,00348$
	sjmp	00106$
00348$:
;	include/ztex-isr.h:138: case 0x80 :
	cjne	r7,#0x81,00109$
	sjmp	00108$
00106$:
;	include/ztex-isr.h:139: EP0BUF[0] = EP0CS & bmBIT0;
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0x01
	mov	dptr,#_EP0BUF
	mov	a,r7
	movx	@dptr,a
;	include/ztex-isr.h:140: break;
;	include/ztex-isr.h:141: case 0x01 :
	sjmp	00110$
00107$:
;	include/ztex-isr.h:142: EP0BUF[0] = EP1OUTCS & bmBIT0;
	mov	dptr,#_EP1OUTCS
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0x01
	mov	dptr,#_EP0BUF
	mov	a,r7
	movx	@dptr,a
;	include/ztex-isr.h:143: break;
;	include/ztex-isr.h:144: case 0x81 :
	sjmp	00110$
00108$:
;	include/ztex-isr.h:145: EP0BUF[0] = EP1INCS & bmBIT0;
	mov	dptr,#_EP1INCS
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0x01
	mov	dptr,#_EP0BUF
	mov	a,r7
	movx	@dptr,a
;	include/ztex-isr.h:146: break;
;	include/ztex-isr.h:147: default:
	sjmp	00110$
00109$:
;	include/ztex-isr.h:148: EP0BUF[0] = EPXCS[ ((SETUPDAT[4] >> 1)-1) & 3 ] & bmBIT0;
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	clr	c
	rrc	a
	dec	a
	anl	a,#0x03
	add	a,#_EPXCS
	mov	dpl,a
	clr	a
	addc	a,#(_EPXCS >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0x01
	mov	dptr,#_EP0BUF
	mov	a,r7
	movx	@dptr,a
;	include/ztex-isr.h:150: }
00110$:
;	include/ztex-isr.h:151: EP0BUF[1] = 0;
	mov	dptr,#(_EP0BUF + 0x0001)
;	include/ztex-isr.h:152: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	include/ztex-isr.h:153: EP0BCL = 2;
	mov	dptr,#_EP0BCL
	mov	a,#0x02
	movx	@dptr,a
;	include/ztex-isr.h:156: break;
	ljmp	00160$
;	include/ztex-isr.h:157: case 0x01:	// disable feature, e.g. remote wake, stall bit
00112$:
;	include/ztex-isr.h:158: if ( SETUPDAT[0] == 2 && SETUPDAT[2] == 0 ) {
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x02,00350$
	sjmp	00351$
00350$:
	ljmp	00160$
00351$:
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	jz	00352$
	ljmp	00160$
00352$:
;	include/ztex-isr.h:159: switch ( SETUPDAT[4] ) {
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	mov	r7,a
	jz	00114$
	cjne	r7,#0x01,00354$
	sjmp	00115$
00354$:
	cjne	r7,#0x80,00355$
	sjmp	00114$
00355$:
;	include/ztex-isr.h:161: case 0x80 :
	cjne	r7,#0x81,00117$
	sjmp	00116$
00114$:
;	include/ztex-isr.h:162: EP0CS &= ~bmBIT0;
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	anl	a,#0xFE
	movx	@dptr,a
;	include/ztex-isr.h:163: break;
	ljmp	00160$
;	include/ztex-isr.h:164: case 0x01 :
00115$:
;	include/ztex-isr.h:165: EP1OUTCS &= ~bmBIT0;
	mov	dptr,#_EP1OUTCS
	movx	a,@dptr
	mov	r7,a
	anl	a,#0xFE
	movx	@dptr,a
;	include/ztex-isr.h:166: break;
	ljmp	00160$
;	include/ztex-isr.h:167: case 0x81 :
00116$:
;	include/ztex-isr.h:168: EP1INCS &= ~bmBIT0;
	mov	dptr,#_EP1INCS
	movx	a,@dptr
	mov	r7,a
	anl	a,#0xFE
	movx	@dptr,a
;	include/ztex-isr.h:169: break;
	ljmp	00160$
;	include/ztex-isr.h:170: default:
00117$:
;	include/ztex-isr.h:171: EPXCS[ ((SETUPDAT[4] >> 1)-1) & 3 ] &= ~bmBIT0;
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	clr	c
	rrc	a
	dec	a
	anl	a,#0x03
	add	a,#_EPXCS
	mov	r6,a
	clr	a
	addc	a,#(_EPXCS >> 8)
	mov	r7,a
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	clr	c
	rrc	a
	dec	a
	anl	a,#0x03
	add	a,#_EPXCS
	mov	dpl,a
	clr	a
	addc	a,#(_EPXCS >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	anl	ar5,#0xFE
	mov	dpl,r6
	mov	dph,r7
	mov	a,r5
	movx	@dptr,a
;	include/ztex-isr.h:175: break;
	ljmp	00160$
;	include/ztex-isr.h:176: case 0x03:      // enable feature, e.g. remote wake, test mode, stall bit
00122$:
;	include/ztex-isr.h:177: if ( SETUPDAT[0] == 2 && SETUPDAT[2] == 0 ) {
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x02,00357$
	sjmp	00358$
00357$:
	ljmp	00160$
00358$:
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	jz	00359$
	ljmp	00160$
00359$:
;	include/ztex-isr.h:178: switch ( SETUPDAT[4] ) {
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	mov	r7,a
	jz	00124$
	cjne	r7,#0x01,00361$
	sjmp	00125$
00361$:
	cjne	r7,#0x80,00362$
	sjmp	00124$
00362$:
;	include/ztex-isr.h:180: case 0x80 :
	cjne	r7,#0x81,00127$
	sjmp	00126$
00124$:
;	include/ztex-isr.h:181: EP0CS |= bmBIT0;
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	orl	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:182: break;
;	include/ztex-isr.h:183: case 0x01 :
	sjmp	00128$
00125$:
;	include/ztex-isr.h:184: EP1OUTCS |= bmBIT0;
	mov	dptr,#_EP1OUTCS
	movx	a,@dptr
	mov	r7,a
	orl	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:185: break;
;	include/ztex-isr.h:186: case 0x81 :
	sjmp	00128$
00126$:
;	include/ztex-isr.h:187: EP1INCS |= bmBIT0;
	mov	dptr,#_EP1INCS
	movx	a,@dptr
	mov	r7,a
	orl	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:188: break;
;	include/ztex-isr.h:189: default:
	sjmp	00128$
00127$:
;	include/ztex-isr.h:190: EPXCS[ ((SETUPDAT[4] >> 1)-1) & 3 ] |= ~bmBIT0;
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	clr	c
	rrc	a
	dec	a
	anl	a,#0x03
	add	a,#_EPXCS
	mov	r6,a
	clr	a
	addc	a,#(_EPXCS >> 8)
	mov	r7,a
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	clr	c
	rrc	a
	dec	a
	anl	a,#0x03
	add	a,#_EPXCS
	mov	dpl,a
	clr	a
	addc	a,#(_EPXCS >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	orl	ar5,#0xFE
	mov	dpl,r6
	mov	dph,r7
	mov	a,r5
	movx	@dptr,a
;	include/ztex-isr.h:192: }
00128$:
;	include/ztex-isr.h:193: a = ( (SETUPDAT[4] & 0x80) >> 3 ) | (SETUPDAT[4] & 0x0f);
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	anl	a,#0x80
	swap	a
	rl	a
	anl	a,#0x1F
	mov	r7,a
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	mov	r6,a
	mov	a,#0x0F
	anl	a,r6
	orl	ar7,a
;	include/ztex-isr.h:194: TOGCTL = a;
;	include/ztex-isr.h:195: TOGCTL = a | bmBIT5;
	mov	dptr,#_TOGCTL
	mov	a,r7
	movx	@dptr,a
	mov	a,#0x20
	orl	a,r7
	movx	@dptr,a
;	include/ztex-isr.h:197: break;
	ljmp	00160$
;	include/ztex-isr.h:198: case 0x06:			// get descriptor
00132$:
;	include/ztex-isr.h:199: switch(SETUPDAT[3]) {
	mov	dptr,#(_SETUPDAT + 0x0003)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x01,00364$
	sjmp	00133$
00364$:
	cjne	r7,#0x02,00365$
	sjmp	00134$
00365$:
	cjne	r7,#0x03,00366$
	sjmp	00138$
00366$:
	cjne	r7,#0x06,00367$
	ljmp	00145$
00367$:
	cjne	r7,#0x07,00368$
	ljmp	00146$
00368$:
	ljmp	00150$
;	include/ztex-isr.h:200: case 0x01:		// device
00133$:
;	include/ztex-isr.h:201: SUDPTRH = MSB(&DeviceDescriptor);
	mov	r6,#_DeviceDescriptor
	mov	r7,#(_DeviceDescriptor >> 8)
	mov	ar6,r7
	mov	dptr,#_SUDPTRH
	mov	a,r6
	movx	@dptr,a
;	include/ztex-isr.h:202: SUDPTRL = LSB(&DeviceDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_DeviceDescriptor
	movx	@dptr,a
;	include/ztex-isr.h:203: break;
	ljmp	00160$
;	include/ztex-isr.h:204: case 0x02: 		// configuration
00134$:
;	include/ztex-isr.h:205: if (USBCS & bmBIT7) {
	mov	dptr,#_USBCS
	movx	a,@dptr
	mov	r7,a
	jnb	acc.7,00136$
;	include/ztex-isr.h:206: SUDPTRH = MSB(&HighSpeedConfigDescriptor);
	mov	r6,#_HighSpeedConfigDescriptor
	mov	r7,#(_HighSpeedConfigDescriptor >> 8)
	mov	ar6,r7
	mov	dptr,#_SUDPTRH
	mov	a,r6
	movx	@dptr,a
;	include/ztex-isr.h:207: SUDPTRL = LSB(&HighSpeedConfigDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_HighSpeedConfigDescriptor
	movx	@dptr,a
	ljmp	00160$
00136$:
;	include/ztex-isr.h:210: SUDPTRH = MSB(&FullSpeedConfigDescriptor);
	mov	r6,#_FullSpeedConfigDescriptor
	mov	r7,#(_FullSpeedConfigDescriptor >> 8)
	mov	ar6,r7
	mov	dptr,#_SUDPTRH
	mov	a,r6
	movx	@dptr,a
;	include/ztex-isr.h:211: SUDPTRL = LSB(&FullSpeedConfigDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_FullSpeedConfigDescriptor
	movx	@dptr,a
;	include/ztex-isr.h:213: break; 
	ljmp	00160$
;	include/ztex-isr.h:214: case 0x03:		// strings
00138$:
;	include/ztex-isr.h:215: switch (SETUPDAT[2]) {
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x01,00370$
	sjmp	00139$
00370$:
	cjne	r7,#0x02,00371$
	sjmp	00140$
00371$:
	cjne	r7,#0x03,00372$
	sjmp	00141$
00372$:
;	include/ztex-isr.h:216: case 1:
	cjne	r7,#0x04,00143$
	sjmp	00142$
00139$:
;	include/ztex-isr.h:217: SEND_STRING_DESCRIPTOR(manufacturerString);
	mov	dpl,#_manufacturerString
	mov	r6,#_manufacturerString
	mov	r7,#(_manufacturerString >> 8)
	mov	ar6,r7
	mov	_sendStringDescriptor_PARM_2,r6
	mov	_sendStringDescriptor_PARM_3,#0x05
	lcall	_sendStringDescriptor
;	include/ztex-isr.h:218: break;
	ljmp	00160$
;	include/ztex-isr.h:219: case 2:
00140$:
;	include/ztex-isr.h:220: SEND_STRING_DESCRIPTOR(productString);
	mov	dpl,#_productString
	mov	r6,#_productString
	mov	r7,#(_productString >> 8)
	mov	ar6,r7
	mov	_sendStringDescriptor_PARM_2,r6
	mov	_sendStringDescriptor_PARM_3,#0x0C
	lcall	_sendStringDescriptor
;	include/ztex-isr.h:221: break;
	ljmp	00160$
;	include/ztex-isr.h:222: case 3:
00141$:
;	include/ztex-isr.h:223: SEND_STRING_DESCRIPTOR(SN_STRING);
	mov	dpl,#_SN_STRING
	mov	r6,#_SN_STRING
	mov	r7,#(_SN_STRING >> 8)
	mov	ar6,r7
	mov	_sendStringDescriptor_PARM_2,r6
	mov	_sendStringDescriptor_PARM_3,#0x0A
	lcall	_sendStringDescriptor
;	include/ztex-isr.h:224: break;
	ljmp	00160$
;	include/ztex-isr.h:225: case 4:
00142$:
;	include/ztex-isr.h:226: SEND_STRING_DESCRIPTOR(configurationString);
	mov	dpl,#_configurationString
	mov	r6,#_configurationString
	mov	r7,#(_configurationString >> 8)
	mov	ar6,r7
	mov	_sendStringDescriptor_PARM_2,r6
	mov	_sendStringDescriptor_PARM_3,#0x08
	lcall	_sendStringDescriptor
;	include/ztex-isr.h:227: break; 
	ljmp	00160$
;	include/ztex-isr.h:228: default:
00143$:
;	include/ztex-isr.h:229: SUDPTRH = MSB(&EmptyStringDescriptor);
	mov	r6,#_EmptyStringDescriptor
	mov	r7,#(_EmptyStringDescriptor >> 8)
	mov	ar6,r7
	mov	dptr,#_SUDPTRH
	mov	a,r6
	movx	@dptr,a
;	include/ztex-isr.h:230: SUDPTRL = LSB(&EmptyStringDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_EmptyStringDescriptor
	movx	@dptr,a
;	include/ztex-isr.h:233: break;
	ljmp	00160$
;	include/ztex-isr.h:234: case 0x06:		// device qualifier
00145$:
;	include/ztex-isr.h:235: SUDPTRH = MSB(&DeviceQualifierDescriptor);
	mov	r6,#_DeviceQualifierDescriptor
	mov	r7,#(_DeviceQualifierDescriptor >> 8)
	mov	ar6,r7
	mov	dptr,#_SUDPTRH
	mov	a,r6
	movx	@dptr,a
;	include/ztex-isr.h:236: SUDPTRL = LSB(&DeviceQualifierDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_DeviceQualifierDescriptor
	movx	@dptr,a
;	include/ztex-isr.h:237: break;
	ljmp	00160$
;	include/ztex-isr.h:238: case 0x07: 		// other speed configuration
00146$:
;	include/ztex-isr.h:239: if (USBCS & bmBIT7) {
	mov	dptr,#_USBCS
	movx	a,@dptr
	mov	r7,a
	jnb	acc.7,00148$
;	include/ztex-isr.h:240: SUDPTRH = MSB(&FullSpeedConfigDescriptor);
	mov	r6,#_FullSpeedConfigDescriptor
	mov	r7,#(_FullSpeedConfigDescriptor >> 8)
	mov	ar6,r7
	mov	dptr,#_SUDPTRH
	mov	a,r6
	movx	@dptr,a
;	include/ztex-isr.h:241: SUDPTRL = LSB(&FullSpeedConfigDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_FullSpeedConfigDescriptor
	movx	@dptr,a
	ljmp	00160$
00148$:
;	include/ztex-isr.h:244: SUDPTRH = MSB(&HighSpeedConfigDescriptor);
	mov	r6,#_HighSpeedConfigDescriptor
	mov	r7,#(_HighSpeedConfigDescriptor >> 8)
	mov	ar6,r7
	mov	dptr,#_SUDPTRH
	mov	a,r6
	movx	@dptr,a
;	include/ztex-isr.h:245: SUDPTRL = LSB(&HighSpeedConfigDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_HighSpeedConfigDescriptor
	movx	@dptr,a
;	include/ztex-isr.h:247: break; 
;	include/ztex-isr.h:248: default:
	sjmp	00160$
00150$:
;	include/ztex-isr.h:249: EP0CS |= 0x01;	// set stall, unknown descriptor
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	orl	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:251: break;
;	include/ztex-isr.h:252: case 0x07:			// set descriptor
	sjmp	00160$
00152$:
;	include/ztex-isr.h:253: break;			
;	include/ztex-isr.h:254: case 0x08:			// get configuration
	sjmp	00160$
00153$:
;	include/ztex-isr.h:255: EP0BUF[0] = 0;		// only one configuration
	mov	dptr,#_EP0BUF
;	include/ztex-isr.h:256: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	include/ztex-isr.h:257: EP0BCL = 1;
	mov	dptr,#_EP0BCL
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:258: break;
;	include/ztex-isr.h:259: case 0x09:			// set configuration
	sjmp	00160$
00154$:
;	include/ztex-isr.h:260: resetToggleData();
	lcall	_resetToggleData
;	include/ztex-isr.h:261: break;			// do nothing since we have only one configuration
;	include/ztex-isr.h:262: case 0x0a:			// get alternate setting for an interface
	sjmp	00160$
00155$:
;	include/ztex-isr.h:263: EP0BUF[0] = 0;		// only one alternate setting
	mov	dptr,#_EP0BUF
;	include/ztex-isr.h:264: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	include/ztex-isr.h:265: EP0BCL = 1;
	mov	dptr,#_EP0BCL
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:266: break;
;	include/ztex-isr.h:267: case 0x0b:			// set alternate setting for an interface
	sjmp	00160$
00156$:
;	include/ztex-isr.h:268: resetToggleData();
	lcall	_resetToggleData
;	include/ztex-isr.h:269: break;			// do nothing since we have only on alternate setting
;	include/ztex-isr.h:270: case 0x0c:			// sync frame
	sjmp	00160$
00157$:
;	include/ztex-isr.h:271: if ( SETUPDAT[0] == 0x82 ) {
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x82,00160$
;	include/ztex-isr.h:272: ISOFRAME_COUNTER[ ((SETUPDAT[4] >> 1)-1) & 3 ] = 0;
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	clr	c
	rrc	a
	dec	a
	anl	a,#0x03
	mov	b,#0x02
	mul	ab
	add	a,#_ISOFRAME_COUNTER
	mov	dpl,a
	mov	a,#(_ISOFRAME_COUNTER >> 8)
	addc	a,b
	mov	dph,a
	clr	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	include/ztex-isr.h:273: EP0BUF[0] = USBFRAMEL;	// use current frame as sync frame, i hope that works
	mov	dptr,#_USBFRAMEL
	movx	a,@dptr
	mov	dptr,#_EP0BUF
	movx	@dptr,a
;	include/ztex-isr.h:274: EP0BUF[1] = USBFRAMEH;	
	mov	dptr,#_USBFRAMEH
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#(_EP0BUF + 0x0001)
	movx	@dptr,a
;	include/ztex-isr.h:275: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-isr.h:276: EP0BCL = 2;
	mov	dptr,#_EP0BCL
	mov	a,#0x02
	movx	@dptr,a
;	include/ztex-isr.h:280: }
00160$:
;	include/ztex-isr.h:283: switch ( bmRequestType ) {
	mov	dptr,#_bmRequestType
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x40,00377$
	ljmp	00183$
00377$:
	cjne	r7,#0xC0,00378$
	sjmp	00379$
00378$:
	ljmp	00187$
00379$:
;	include/ztex-isr.h:285: ep0_payload_remaining = (SETUPDAT[7] << 8) | SETUPDAT[6];
	mov	dptr,#(_SETUPDAT + 0x0007)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_SETUPDAT + 0x0006)
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	mov	dptr,#_ep0_payload_remaining
	mov	a,r5
	orl	a,r7
	movx	@dptr,a
	mov	a,r4
	orl	a,r6
	inc	dptr
	movx	@dptr,a
;	include/ztex-isr.h:286: ep0_payload_update();
	lcall	_ep0_payload_update
;	include/ztex-isr.h:288: switch ( bRequest ) {
	mov	dptr,#_bRequest
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x22,00380$
	sjmp	00162$
00380$:
	cjne	r7,#0x30,00381$
	ljmp	00176$
00381$:
	cjne	r7,#0x33,00382$
	ljmp	00180$
00382$:
	cjne	r7,#0x38,00383$
	sjmp	00163$
00383$:
	cjne	r7,#0x3A,00384$
	sjmp	00164$
00384$:
	cjne	r7,#0x3B,00385$
	ljmp	00165$
00385$:
	cjne	r7,#0x3D,00386$
	ljmp	00166$
00386$:
	cjne	r7,#0x40,00387$
	ljmp	00167$
00387$:
	cjne	r7,#0x41,00388$
	ljmp	00171$
00388$:
	cjne	r7,#0x43,00389$
	ljmp	00175$
00389$:
	ljmp	00181$
;	include/ztex-isr.h:289: case 0x22: 				// get ZTEX descriptor
00162$:
;	include/ztex-isr.h:290: SUDPTRCTL = 0;
	mov	dptr,#_SUDPTRCTL
;	include/ztex-isr.h:291: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	include/ztex-isr.h:292: EP0BCL = ZTEX_DESCRIPTOR_LEN;
	mov	dptr,#_EP0BCL
	mov	a,#0x28
	movx	@dptr,a
;	include/ztex-isr.h:293: SUDPTRH = MSB(ZTEX_DESCRIPTOR_OFFS);
	mov	dptr,#_SUDPTRH
	clr	a
	movx	@dptr,a
;	include/ztex-isr.h:294: SUDPTRL = LSB(ZTEX_DESCRIPTOR_OFFS); 
	mov	dptr,#_SUDPTRL
	mov	a,#0x6C
	movx	@dptr,a
;	include/ztex-isr.h:295: break;
	ljmp	00187$
;	include/ztex-conf.h:100: case $0:
00163$:
;	include/ztex-conf.h:102: break;
	mov	dptr,#(_SETUPDAT + 0x0003)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	mov	dptr,#_eeprom_addr
	mov	a,r5
	orl	a,r7
	movx	@dptr,a
	mov	a,r4
	orl	a,r6
	inc	dptr
	movx	@dptr,a
;	include/ztex-eeprom.h:219: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-eeprom.h:220: EP0BCL = eeprom_read_ep0(); 
	lcall	_eeprom_read_ep0
	mov	a,dpl
	mov	dptr,#_EP0BCL
	movx	@dptr,a
;	include/ztex-conf.h:102: break;
	ljmp	00187$
;	include/ztex-conf.h:100: case $0:
00164$:
;	include/ztex-eeprom.h:247: EP0BUF[0] = LSB(eeprom_write_bytes);
	mov	dptr,#_eeprom_write_bytes
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	dptr,#_EP0BUF
	mov	a,r6
	movx	@dptr,a
;	include/ztex-eeprom.h:248: EP0BUF[1] = MSB(eeprom_write_bytes);
	mov	dptr,#_eeprom_write_bytes
	movx	a,@dptr
	inc	dptr
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x0001)
	movx	@dptr,a
;	include/ztex-eeprom.h:249: EP0BUF[2] = eeprom_write_checksum;
	mov	dptr,#_eeprom_write_checksum
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x0002)
	movx	@dptr,a
;	include/ztex-eeprom.h:250: EP0BUF[3] = eeprom_select(EEPROM_ADDR,0,1);		// 1 means busy or error
	mov	_eeprom_select_PARM_2,#0x00
	mov	_eeprom_select_PARM_3,#0x01
	mov	dpl,#0xA2
	lcall	_eeprom_select
	mov	r7,dpl
	mov	dptr,#(_EP0BUF + 0x0003)
	mov	a,r7
	movx	@dptr,a
;	include/ztex-eeprom.h:251: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-eeprom.h:252: EP0BCL = 4;
	mov	dptr,#_EP0BCL
	mov	a,#0x04
	movx	@dptr,a
;	include/ztex-conf.h:102: break;
	ljmp	00187$
;	include/ztex-conf.h:100: case $0:
00165$:
;	include/ztex-conf.h:102: break;
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	dptr,#_mac_eeprom_addr
	movx	@dptr,a
;	include/ztex-eeprom.h:368: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-eeprom.h:369: EP0BCL = mac_eeprom_read_ep0(); 
	lcall	_mac_eeprom_read_ep0
	mov	a,dpl
	mov	dptr,#_EP0BCL
	movx	@dptr,a
;	include/ztex-conf.h:102: break;
	ljmp	00187$
;	include/ztex-conf.h:100: case $0:
00166$:
;	include/ztex-conf.h:102: break;
	mov	_eeprom_select_PARM_2,#0x00
	mov	_eeprom_select_PARM_3,#0x01
	mov	dpl,#0xA6
	lcall	_eeprom_select
	mov	r7,dpl
	mov	dptr,#_EP0BUF
	mov	a,r7
	movx	@dptr,a
;	include/ztex-eeprom.h:390: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-eeprom.h:391: EP0BCL = 1;
	mov	dptr,#_EP0BCL
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-conf.h:102: break;
	ljmp	00187$
;	include/ztex-conf.h:100: case $0:
00167$:
;	include/ztex-flash2.h:643: if ( flash_ec == 0 && SPI_CS == 0 ) {
	mov	dptr,#_flash_ec
	movx	a,@dptr
	mov	r7,a
	jnz	00169$
	jb	_IOC5,00169$
;	include/ztex-flash2.h:644: flash_ec = FLASH_EC_PENDING;
	mov	dptr,#_flash_ec
	mov	a,#0x04
	movx	@dptr,a
00169$:
;	include/ztex-utils.h:121: AUTOPTRL1=LO(&($0));
	mov	_AUTOPTRL1,#_flash_enabled
;	include/ztex-utils.h:122: AUTOPTRH1=HI(&($0));
	mov	r6,#_flash_enabled
	mov	r7,#(_flash_enabled >> 8)
	mov	ar6,r7
	mov	_AUTOPTRH1,r6
;	include/ztex-utils.h:123: AUTOPTRL2=LO(&($1));
	mov	_AUTOPTRL2,#_EP0BUF
;	include/ztex-utils.h:124: AUTOPTRH2=HI(&($1));
	mov	r6,#_EP0BUF
	mov	r7,#(_EP0BUF >> 8)
	mov	ar6,r7
	mov	_AUTOPTRH2,r6
;	include/ztex-utils.h:130: __endasm; 
	push ar2
	mov r2,#(8);
	lcall _MEM_COPY1_int
	pop ar2
;	include/ztex-flash2.h:647: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-flash2.h:648: EP0BCL = 8;
	mov	dptr,#_EP0BCL
	mov	a,#0x08
	movx	@dptr,a
;	include/ztex-conf.h:102: break;
	ljmp	00187$
;	include/ztex-conf.h:100: case $0:
00171$:
;	include/ztex-flash2.h:668: ep0_read_mode = SETUPDAT[5];
	mov	dptr,#(_SETUPDAT + 0x0005)
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_ep0_read_mode
	movx	@dptr,a
;	include/ztex-flash2.h:669: if ( (ep0_read_mode==0) && flash_read_init((SETUPDAT[3] << 8) | SETUPDAT[2]) ) {
	mov	a,r7
	jnz	00173$
	mov	dptr,#(_SETUPDAT + 0x0003)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	r4,#0x00
	orl	a,r7
	mov	dpl,a
	mov	a,r4
	orl	a,r6
	mov	dph,a
	lcall	_flash_read_init
	mov	a,dpl
	jz	00173$
;	include/ztex-conf.h:137: EP0CS |= 0x01;	// set stall
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	orl	a,#0x01
	movx	@dptr,a
;	include/ztex-conf.h:138: ep0_payload_remaining = 0;
	mov	dptr,#_ep0_payload_remaining
	clr	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	include/ztex-conf.h:139: break;
	ljmp	00187$
00173$:
;	include/ztex-flash2.h:672: spi_read_ep0();  
	lcall	_spi_read_ep0
;	include/ztex-flash2.h:673: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-flash2.h:674: EP0BCL = ep0_payload_transfer; 
	mov	dptr,#_ep0_payload_transfer
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_EP0BCL
	movx	@dptr,a
;	include/ztex-conf.h:102: break;
	ljmp	00187$
;	include/ztex-conf.h:100: case $0:
00175$:
;	include/ztex-utils.h:121: AUTOPTRL1=LO(&($0));
	mov	_AUTOPTRL1,#_flash_ec
;	include/ztex-utils.h:122: AUTOPTRH1=HI(&($0));
	mov	r6,#_flash_ec
	mov	r7,#(_flash_ec >> 8)
	mov	ar6,r7
	mov	_AUTOPTRH1,r6
;	include/ztex-utils.h:123: AUTOPTRL2=LO(&($1));
	mov	_AUTOPTRL2,#_EP0BUF
;	include/ztex-utils.h:124: AUTOPTRH2=HI(&($1));
	mov	r6,#_EP0BUF
	mov	r7,#(_EP0BUF >> 8)
	mov	ar6,r7
	mov	_AUTOPTRH2,r6
;	include/ztex-utils.h:130: __endasm; 
	push ar2
	mov r2,#(10);
	lcall _MEM_COPY1_int
	pop ar2
;	include/ztex-flash2.h:716: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-flash2.h:717: EP0BCL = 10;
	mov	dptr,#_EP0BCL
	mov	a,#0x0A
	movx	@dptr,a
;	include/ztex-conf.h:102: break;
	ljmp	00187$
;	include/ztex-conf.h:100: case $0:
00176$:
;	include/ztex-utils.h:121: AUTOPTRL1=LO(&($0));
	mov	_AUTOPTRL1,#_fpga_checksum
;	include/ztex-utils.h:122: AUTOPTRH1=HI(&($0));
	mov	r6,#_fpga_checksum
	mov	r7,#(_fpga_checksum >> 8)
	mov	ar6,r7
	mov	_AUTOPTRH1,r6
;	include/ztex-utils.h:123: AUTOPTRL2=LO(&($1));
	mov	_AUTOPTRL2,#(_EP0BUF + 0x0001)
;	include/ztex-utils.h:124: AUTOPTRH2=HI(&($1));
	mov	r6,#(_EP0BUF + 0x0001)
	mov	r7,#((_EP0BUF + 0x0001) >> 8)
	mov	ar6,r7
	mov	_AUTOPTRH2,r6
;	include/ztex-utils.h:130: __endasm; 
	push ar2
	mov r2,#(7);
	lcall _MEM_COPY1_int
	pop ar2
;	include/ztex-fpga6.h:135: if ( IOE & bmBIT0 )  {
	mov	a,_IOE
	jnb	acc.0,00178$
;	include/ztex-fpga6.h:136: EP0BUF[0] = 0; 	 		// FPGA configured 
	mov	dptr,#_EP0BUF
	clr	a
	movx	@dptr,a
	sjmp	00179$
00178$:
;	include/ztex-fpga6.h:139: EP0BUF[0] = 1;			// FPGA unconfigured 
	mov	dptr,#_EP0BUF
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-fpga6.h:140: OEE = 0;
	mov	_OEE,#0x00
;	include/ztex-fpga6.h:141: reset_fpga();			// prepare FPGA for configuration
	lcall	_reset_fpga
00179$:
;	include/ztex-fpga6.h:144: EP0BUF[8] = 1;			// bit order for bitstream in Flash memory: swapped
	mov	dptr,#(_EP0BUF + 0x0008)
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-fpga6.h:146: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-fpga6.h:147: EP0BCL = 9;
	mov	dptr,#_EP0BCL
	mov	a,#0x09
	movx	@dptr,a
;	include/ztex-conf.h:102: break;
;	include/ztex-conf.h:100: case $0:
	sjmp	00187$
00180$:
;	include/ztex-conf.h:102: break;
	mov	dptr,#_EP0BUF
	mov	a,#0x06
	movx	@dptr,a
;	include/ztex-conf.h:103: ]
	mov	dptr,#(_EP0BUF + 0x0001)
;	include/ztex-fpga6.h:223: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	include/ztex-fpga6.h:224: EP0BCL = 2;
	mov	dptr,#_EP0BCL
	mov	a,#0x02
	movx	@dptr,a
;	include/ztex-conf.h:102: break;
;	include/ztex-isr.h:297: default:
	sjmp	00187$
00181$:
;	include/ztex-isr.h:298: EP0CS |= 0x01;			// set stall, unknown request
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	orl	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:300: break;
;	include/ztex-isr.h:301: case 0x40: 					// vendor command
	sjmp	00187$
00183$:
;	include/ztex-isr.h:305: if ( SETUPDAT[7]!=0 || SETUPDAT[6]!=0 ) {
	mov	dptr,#(_SETUPDAT + 0x0007)
	movx	a,@dptr
	jnz	00184$
	mov	dptr,#(_SETUPDAT + 0x0006)
	movx	a,@dptr
	jz	00185$
00184$:
;	include/ztex-isr.h:306: ep0_vendor_cmd_setup = 1;
	mov	dptr,#_ep0_vendor_cmd_setup
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:307: EP0BCL = 0;
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	include/ztex-isr.h:308: EXIF &= ~bmBIT4;			// clear main USB interrupt flag
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:309: USBIRQ = bmBIT0;			// clear SUADV IRQ
	mov	dptr,#_USBIRQ
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:310: return;					// don't clear HSNAK bit. This is done after the command has completed
	sjmp	00188$
00185$:
;	include/ztex-isr.h:312: ep0_vendor_cmd_su();			// setup sequences of vendor command with no payload ara executed immediately
	lcall	_ep0_vendor_cmd_su
;	include/ztex-isr.h:313: EP0BCL = 0;
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	include/ztex-isr.h:315: }
00187$:
;	include/ztex-isr.h:317: EXIF &= ~bmBIT4;					// clear main USB interrupt flag
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:318: USBIRQ = bmBIT0;					// clear SUADV IRQ
	mov	dptr,#_USBIRQ
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:319: EP0CS |= 0x80;					// clear the HSNAK bit
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	orl	a,#0x80
	movx	@dptr,a
00188$:
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'SOF_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:325: void SOF_ISR() __interrupt
;	-----------------------------------------
;	 function SOF_ISR
;	-----------------------------------------
_SOF_ISR:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:327: EXIF &= ~bmBIT4;
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:328: USBIRQ = bmBIT1;
	mov	dptr,#_USBIRQ
	mov	a,#0x02
	movx	@dptr,a
	pop	psw
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'SUTOK_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:334: void SUTOK_ISR() __interrupt 
;	-----------------------------------------
;	 function SUTOK_ISR
;	-----------------------------------------
_SUTOK_ISR:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:336: EXIF &= ~bmBIT4;
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:337: USBIRQ = bmBIT2;
	mov	dptr,#_USBIRQ
	mov	a,#0x04
	movx	@dptr,a
	pop	psw
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'SUSP_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:343: void SUSP_ISR() __interrupt
;	-----------------------------------------
;	 function SUSP_ISR
;	-----------------------------------------
_SUSP_ISR:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:345: EXIF &= ~bmBIT4;
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:346: USBIRQ = bmBIT3;
	mov	dptr,#_USBIRQ
	mov	a,#0x08
	movx	@dptr,a
	pop	psw
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'URES_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:352: void URES_ISR() __interrupt
;	-----------------------------------------
;	 function URES_ISR
;	-----------------------------------------
_URES_ISR:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:354: EXIF &= ~bmBIT4;
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:355: USBIRQ = bmBIT4;
	mov	dptr,#_USBIRQ
	mov	a,#0x10
	movx	@dptr,a
	pop	psw
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'HSGRANT_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:361: void HSGRANT_ISR() __interrupt
;	-----------------------------------------
;	 function HSGRANT_ISR
;	-----------------------------------------
_HSGRANT_ISR:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:363: EXIF &= ~bmBIT4;
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:365: USBIRQ = bmBIT5;
	mov	dptr,#_USBIRQ
	mov	a,#0x20
	movx	@dptr,a
	pop	psw
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP0ACK_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:371: void EP0ACK_ISR() __interrupt
;	-----------------------------------------
;	 function EP0ACK_ISR
;	-----------------------------------------
_EP0ACK_ISR:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:373: EXIF &= ~bmBIT4;	// clear USB interrupt flag
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:374: USBIRQ = bmBIT6;	// clear EP0ACK IRQ
	mov	dptr,#_USBIRQ
	mov	a,#0x40
	movx	@dptr,a
	pop	psw
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP0IN_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:380: static void EP0IN_ISR () __interrupt
;	-----------------------------------------
;	 function EP0IN_ISR
;	-----------------------------------------
_EP0IN_ISR:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:382: EUSB = 0;			// block all USB interrupts
	clr	_EUSB
;	include/ztex-isr.h:383: ep0_payload_update();
	lcall	_ep0_payload_update
;	include/ztex-isr.h:384: switch ( ep0_prev_setup_request ) {
	mov	dptr,#_ep0_prev_setup_request
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x30,00146$
	ljmp	00113$
00146$:
	cjne	r7,#0x33,00147$
	sjmp	00113$
00147$:
	cjne	r7,#0x38,00148$
	sjmp	00101$
00148$:
	cjne	r7,#0x3A,00149$
	sjmp	00113$
00149$:
	cjne	r7,#0x3B,00150$
	sjmp	00103$
00150$:
	cjne	r7,#0x3D,00151$
	sjmp	00113$
00151$:
	cjne	r7,#0x40,00152$
	sjmp	00113$
00152$:
	cjne	r7,#0x41,00153$
	sjmp	00106$
00153$:
;	include/ztex-conf.h:105: case $0:
	cjne	r7,#0x43,00112$
	sjmp	00113$
00101$:
;	include/ztex-eeprom.h:222: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-eeprom.h:223: EP0BCL = eeprom_read_ep0(); 
	lcall	_eeprom_read_ep0
	mov	a,dpl
	mov	dptr,#_EP0BCL
	movx	@dptr,a
;	include/ztex-conf.h:107: break;
;	include/ztex-conf.h:105: case $0:
	sjmp	00113$
00103$:
;	include/ztex-eeprom.h:371: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-eeprom.h:372: EP0BCL = mac_eeprom_read_ep0(); 
	lcall	_mac_eeprom_read_ep0
	mov	a,dpl
	mov	dptr,#_EP0BCL
	movx	@dptr,a
;	include/ztex-conf.h:107: break;
;	include/ztex-conf.h:105: case $0:
	sjmp	00113$
00106$:
;	include/ztex-flash2.h:676: if ( ep0_payload_transfer != 0 ) {
	mov	dptr,#_ep0_payload_transfer
	movx	a,@dptr
	mov	r7,a
	jz	00108$
;	include/ztex-flash2.h:677: flash_ec = 0;
	mov	dptr,#_flash_ec
	clr	a
	movx	@dptr,a
;	include/ztex-flash2.h:678: spi_read_ep0(); 
	lcall	_spi_read_ep0
00108$:
;	include/ztex-flash2.h:680: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	include/ztex-flash2.h:681: EP0BCL = ep0_payload_transfer;
	mov	dptr,#_ep0_payload_transfer
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_EP0BCL
	movx	@dptr,a
;	include/ztex-conf.h:107: break;
;	include/ztex-isr.h:386: default:
	sjmp	00113$
00112$:
;	include/ztex-isr.h:387: EP0BCH = 0;
	mov	dptr,#_EP0BCH
;	include/ztex-isr.h:388: EP0BCL = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_EP0BCL
	movx	@dptr,a
;	include/ztex-isr.h:389: }
00113$:
;	include/ztex-isr.h:390: EXIF &= ~bmBIT4;		// clear USB interrupt flag
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:391: EPIRQ = bmBIT0;		// clear EP0IN IRQ
	mov	dptr,#_EPIRQ
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex-isr.h:392: EUSB = 1;
	setb	_EUSB
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'EP0OUT_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:398: static void EP0OUT_ISR () __interrupt
;	-----------------------------------------
;	 function EP0OUT_ISR
;	-----------------------------------------
_EP0OUT_ISR:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:400: EUSB = 0;			// block all USB interrupts
	clr	_EUSB
;	include/ztex-isr.h:401: if ( ep0_vendor_cmd_setup ) {
	mov	dptr,#_ep0_vendor_cmd_setup
	movx	a,@dptr
	mov	r7,a
	jz	00102$
;	include/ztex-isr.h:402: ep0_vendor_cmd_setup = 0;
	mov	dptr,#_ep0_vendor_cmd_setup
	clr	a
	movx	@dptr,a
;	include/ztex-isr.h:403: ep0_payload_remaining = (SETUPDAT[7] << 8) | SETUPDAT[6];
	mov	dptr,#(_SETUPDAT + 0x0007)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_SETUPDAT + 0x0006)
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	mov	dptr,#_ep0_payload_remaining
	mov	a,r5
	orl	a,r7
	movx	@dptr,a
	mov	a,r4
	orl	a,r6
	inc	dptr
	movx	@dptr,a
;	include/ztex-isr.h:404: ep0_vendor_cmd_su();
	lcall	_ep0_vendor_cmd_su
00102$:
;	include/ztex-isr.h:407: ep0_payload_update();
	lcall	_ep0_payload_update
;	include/ztex-isr.h:409: switch ( ep0_prev_setup_request ) {
	mov	dptr,#_ep0_prev_setup_request
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x31,00169$
	ljmp	00118$
00169$:
	cjne	r7,#0x32,00170$
	ljmp	00115$
00170$:
	cjne	r7,#0x34,00171$
	ljmp	00118$
00171$:
	cjne	r7,#0x35,00172$
	ljmp	00118$
00172$:
	cjne	r7,#0x39,00173$
	sjmp	00107$
00173$:
	cjne	r7,#0x3C,00174$
	sjmp	00108$
00174$:
	cjne	r7,#0x42,00175$
	sjmp	00109$
00175$:
	cjne	r7,#0x80,00176$
	sjmp	00103$
00176$:
	cjne	r7,#0x81,00177$
	sjmp	00104$
00177$:
	cjne	r7,#0x82,00178$
	sjmp	00105$
00178$:
;	include/ztex-conf.h:128: case $0:			
	cjne	r7,#0x83,00118$
	sjmp	00106$
00103$:
;	include/ztex-utils.h:37: __endasm;
	nop
;	include/ztex-conf.h:130: break;
;	include/ztex-conf.h:128: case $0:			
	sjmp	00118$
00104$:
;	include/ztex-utils.h:37: __endasm;
	nop
;	include/ztex-conf.h:130: break;
;	include/ztex-conf.h:128: case $0:			
	sjmp	00118$
00105$:
;	include/ztex-utils.h:37: __endasm;
	nop
;	include/ztex-conf.h:130: break;
;	include/ztex-conf.h:128: case $0:			
	sjmp	00118$
00106$:
;	include/ztex-utils.h:37: __endasm;
	nop
;	include/ztex-conf.h:130: break;
;	include/ztex-conf.h:128: case $0:			
	sjmp	00118$
00107$:
;	include/ztex-eeprom.h:240: eeprom_write_ep0(EP0BCL);
	mov	dptr,#_EP0BCL
	movx	a,@dptr
	mov	dpl,a
	lcall	_eeprom_write_ep0
;	include/ztex-conf.h:130: break;
;	include/ztex-conf.h:128: case $0:			
	sjmp	00118$
00108$:
;	include/ztex-eeprom.h:382: mac_eeprom_write(EP0BUF, mac_eeprom_addr, EP0BCL);
	mov	dptr,#_mac_eeprom_addr
	movx	a,@dptr
	mov	_mac_eeprom_write_PARM_2,a
	mov	dptr,#_EP0BCL
	movx	a,@dptr
	mov	_mac_eeprom_write_PARM_3,a
	mov	dptr,#_EP0BUF
	lcall	_mac_eeprom_write
;	include/ztex-conf.h:130: break;
;	include/ztex-conf.h:128: case $0:			
	sjmp	00118$
00109$:
;	include/ztex-flash2.h:700: if ( ep0_payload_transfer != 0 ) {
	mov	dptr,#_ep0_payload_transfer
	movx	a,@dptr
	mov	r7,a
	jz	00118$
;	include/ztex-flash2.h:701: flash_ec = 0;
	mov	dptr,#_flash_ec
	clr	a
	movx	@dptr,a
;	include/ztex-flash2.h:702: spi_send_ep0();
	lcall	_spi_send_ep0
;	include/ztex-flash2.h:703: if ( flash_ec != 0 ) {
	mov	dptr,#_flash_ec
	movx	a,@dptr
	mov	r7,a
	jz	00118$
;	include/ztex-flash2.h:704: spi_deselect();
	lcall	_spi_deselect
;	include/ztex-conf.h:137: EP0CS |= 0x01;	// set stall
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	orl	a,#0x01
	movx	@dptr,a
;	include/ztex-conf.h:138: ep0_payload_remaining = 0;
	mov	dptr,#_ep0_payload_remaining
	clr	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	include/ztex-conf.h:139: break;
;	include/ztex-conf.h:128: case $0:			
	sjmp	00118$
00115$:
;	include/ztex-fpga6.h:202: fpga_send_ep0();
	lcall	_fpga_send_ep0
;	include/ztex-isr.h:411: } 
00118$:
;	include/ztex-isr.h:413: EP0BCL = 0;
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	include/ztex-isr.h:415: EXIF &= ~bmBIT4;		// clear main USB interrupt flag
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:416: EPIRQ = bmBIT1;		// clear EP0OUT IRQ
	mov	dptr,#_EPIRQ
	mov	a,#0x02
	movx	@dptr,a
;	include/ztex-isr.h:417: if ( ep0_payload_remaining == 0 ) {
	mov	dptr,#_ep0_payload_remaining
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00120$
;	include/ztex-isr.h:418: EP0CS |= 0x80; 		// clear the HSNAK bit
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	orl	a,#0x80
	movx	@dptr,a
00120$:
;	include/ztex-isr.h:420: EUSB = 1;
	setb	_EUSB
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'EP1IN_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:427: void EP1IN_ISR() __interrupt
;	-----------------------------------------
;	 function EP1IN_ISR
;	-----------------------------------------
_EP1IN_ISR:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:429: EXIF &= ~bmBIT4;
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:430: EPIRQ = bmBIT2;
	mov	dptr,#_EPIRQ
	mov	a,#0x04
	movx	@dptr,a
	pop	psw
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP1OUT_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:437: void EP1OUT_ISR() __interrupt
;	-----------------------------------------
;	 function EP1OUT_ISR
;	-----------------------------------------
_EP1OUT_ISR:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:439: EXIF &= ~bmBIT4;
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:440: EPIRQ = bmBIT3;
	mov	dptr,#_EPIRQ
	mov	a,#0x08
	movx	@dptr,a
	pop	psw
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP2_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:446: void EP2_ISR() __interrupt
;	-----------------------------------------
;	 function EP2_ISR
;	-----------------------------------------
_EP2_ISR:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:448: EXIF &= ~bmBIT4;
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:449: EPIRQ = bmBIT4;
	mov	dptr,#_EPIRQ
	mov	a,#0x10
	movx	@dptr,a
	pop	psw
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP4_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:455: void EP4_ISR() __interrupt
;	-----------------------------------------
;	 function EP4_ISR
;	-----------------------------------------
_EP4_ISR:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:457: EXIF &= ~bmBIT4;
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:458: EPIRQ = bmBIT5;
	mov	dptr,#_EPIRQ
	mov	a,#0x20
	movx	@dptr,a
	pop	psw
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP6_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:464: void EP6_ISR() __interrupt
;	-----------------------------------------
;	 function EP6_ISR
;	-----------------------------------------
_EP6_ISR:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:466: EXIF &= ~bmBIT4;
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:467: EPIRQ = bmBIT6;
	mov	dptr,#_EPIRQ
	mov	a,#0x40
	movx	@dptr,a
	pop	psw
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP8_ISR'
;------------------------------------------------------------
;	include/ztex-isr.h:473: void EP8_ISR() __interrupt
;	-----------------------------------------
;	 function EP8_ISR
;	-----------------------------------------
_EP8_ISR:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	psw
	mov	psw,#0x00
;	include/ztex-isr.h:475: EXIF &= ~bmBIT4;
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex-isr.h:476: EPIRQ = bmBIT7;
	mov	dptr,#_EPIRQ
	mov	a,#0x80
	movx	@dptr,a
	pop	psw
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'mac_eeprom_init'
;------------------------------------------------------------
;b                         Allocated to registers r7 
;c                         Allocated to registers r7 
;d                         Allocated to registers r5 
;buf                       Allocated with name '_mac_eeprom_init_buf_1_167'
;------------------------------------------------------------
;	include/ztex.h:285: void mac_eeprom_init ( ) { 
;	-----------------------------------------
;	 function mac_eeprom_init
;	-----------------------------------------
_mac_eeprom_init:
;	include/ztex.h:290: mac_eeprom_read ( buf, 0, 3 );	// read signature
	mov	_mac_eeprom_read_PARM_2,#0x00
	mov	_mac_eeprom_read_PARM_3,#0x03
	mov	dptr,#_mac_eeprom_init_buf_1_167
	lcall	_mac_eeprom_read
;	include/ztex.h:291: if ( buf[0]==67 && buf[1]==68 && buf[2]==48 ) {
	mov	dptr,#_mac_eeprom_init_buf_1_167
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x43,00102$
	mov	dptr,#(_mac_eeprom_init_buf_1_167 + 0x0001)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x44,00102$
	mov	dptr,#(_mac_eeprom_init_buf_1_167 + 0x0002)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x30,00102$
;	include/ztex.h:292: config_data_valid = 1;
	mov	dptr,#_config_data_valid
	mov	a,#0x01
	movx	@dptr,a
;	include/ztex.h:293: mac_eeprom_read ( SN_STRING, 16, 10 );	// copy serial number
	mov	_mac_eeprom_read_PARM_2,#0x10
	mov	_mac_eeprom_read_PARM_3,#0x0A
	mov	dptr,#_SN_STRING
	lcall	_mac_eeprom_read
	sjmp	00120$
00102$:
;	include/ztex.h:296: config_data_valid = 0;
	mov	dptr,#_config_data_valid
	clr	a
	movx	@dptr,a
;	include/ztex.h:299: for (b=0; b<10; b++) {	// abort if SN != "0000000000"
00120$:
	mov	r7,#0x00
00110$:
;	include/ztex.h:300: if ( SN_STRING[b] != 48 )
	mov	a,r7
	add	a,#_SN_STRING
	mov	dpl,a
	clr	a
	addc	a,#(_SN_STRING >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r6,a
;	include/ztex.h:301: return;
	cjne	r6,#0x30,00114$
;	include/ztex.h:299: for (b=0; b<10; b++) {	// abort if SN != "0000000000"
	inc	r7
	cjne	r7,#0x0A,00145$
00145$:
	jc	00110$
;	include/ztex.h:304: mac_eeprom_read ( buf, 0xfb, 5 );	// read the last 5 MAC digits
	mov	_mac_eeprom_read_PARM_2,#0xFB
	mov	_mac_eeprom_read_PARM_3,#0x05
	mov	dptr,#_mac_eeprom_init_buf_1_167
	lcall	_mac_eeprom_read
;	include/ztex.h:306: c=0;
	mov	r7,#0x00
;	include/ztex.h:307: for (b=0; b<5; b++) {	// convert to MAC to SN string
	mov	r6,#0x00
00112$:
;	include/ztex.h:308: d = buf[b];
	mov	a,r6
	add	a,#_mac_eeprom_init_buf_1_167
	mov	dpl,a
	clr	a
	addc	a,#(_mac_eeprom_init_buf_1_167 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
;	include/ztex.h:309: SN_STRING[c] = hexdigits[d>>4];
	mov	a,r7
	add	a,#_SN_STRING
	mov	r3,a
	clr	a
	addc	a,#(_SN_STRING >> 8)
	mov	r4,a
	mov	a,r5
	swap	a
	anl	a,#0x0F
	mov	dptr,#_mac_eeprom_init_hexdigits_1_167
	movc	a,@a+dptr
	mov	r2,a
	mov	dpl,r3
	mov	dph,r4
	movx	@dptr,a
;	include/ztex.h:310: c++;
	inc	r7
;	include/ztex.h:311: SN_STRING[c] = hexdigits[d & 15];
	mov	a,r7
	add	a,#_SN_STRING
	mov	r3,a
	clr	a
	addc	a,#(_SN_STRING >> 8)
	mov	r4,a
	mov	a,#0x0F
	anl	a,r5
	mov	dptr,#_mac_eeprom_init_hexdigits_1_167
	movc	a,@a+dptr
	mov	r5,a
	mov	dpl,r3
	mov	dph,r4
	movx	@dptr,a
;	include/ztex.h:312: c++;
	inc	r7
;	include/ztex.h:307: for (b=0; b<5; b++) {	// convert to MAC to SN string
	inc	r6
	cjne	r6,#0x05,00147$
00147$:
	jc	00112$
00114$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'init_USB'
;------------------------------------------------------------
;	include/ztex.h:361: void init_USB ()
;	-----------------------------------------
;	 function init_USB
;	-----------------------------------------
_init_USB:
;	include/ztex.h:363: USBCS |= bmBIT3;
	mov	dptr,#_USBCS
	movx	a,@dptr
	orl	a,#0x08
	movx	@dptr,a
;	include/ztex.h:365: CPUCS = bmBIT4 | bmBIT1;
	mov	dptr,#_CPUCS
	mov	a,#0x12
	movx	@dptr,a
;	include/ztex.h:366: wait(2);
	mov	dptr,#0x0002
	lcall	_wait
;	include/ztex.h:367: CKCON &= ~7;
	mov	r7,_CKCON
	mov	a,#0xF8
	anl	a,r7
	mov	_CKCON,a
;	include/ztex.h:390: init_fpga();
	lcall	_init_fpga
;	include/ztex.h:401: EA = 0;
	clr	_EA
;	include/ztex.h:402: EUSB = 0;
	clr	_EUSB
;	include/ezintavecs.h:123: INT8VEC_USB.op=0x02;
	mov	dptr,#_INT8VEC_USB
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:124: INT8VEC_USB.addrH = 0x01;
	mov	dptr,#(_INT8VEC_USB + 0x0001)
	mov	a,#0x01
	movx	@dptr,a
;	include/ezintavecs.h:125: INT8VEC_USB.addrL = 0xb8;
	mov	dptr,#(_INT8VEC_USB + 0x0002)
	mov	a,#0xB8
	movx	@dptr,a
;	include/ezintavecs.h:126: INTSETUP |= 8;
	mov	dptr,#_INTSETUP
	movx	a,@dptr
	orl	a,#0x08
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_SUDAV
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_SUDAV_ISR
	mov	r7,#(_SUDAV_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_SUDAV + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_SUDAV + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_SOF
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_SOF_ISR
	mov	r7,#(_SOF_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_SOF + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_SOF + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_SUTOK
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_SUTOK_ISR
	mov	r7,#(_SUTOK_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_SUTOK + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_SUTOK + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_SUSPEND
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_SUSP_ISR
	mov	r7,#(_SUSP_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_SUSPEND + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_SUSPEND + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_USBRESET
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_URES_ISR
	mov	r7,#(_URES_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_USBRESET + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_USBRESET + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_HISPEED
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_HSGRANT_ISR
	mov	r7,#(_HSGRANT_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_HISPEED + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_HISPEED + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP0ACK
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_EP0ACK_ISR
	mov	r7,#(_EP0ACK_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_EP0ACK + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP0ACK + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP0IN
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_EP0IN_ISR
	mov	r7,#(_EP0IN_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_EP0IN + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP0IN + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP0OUT
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_EP0OUT_ISR
	mov	r7,#(_EP0OUT_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_EP0OUT + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP0OUT + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP1IN
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_EP1IN_ISR
	mov	r7,#(_EP1IN_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_EP1IN + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP1IN + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP1OUT
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_EP1OUT_ISR
	mov	r7,#(_EP1OUT_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_EP1OUT + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP1OUT + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP2
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_EP2_ISR
	mov	r7,#(_EP2_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_EP2 + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP2 + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP4
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_EP4_ISR
	mov	r7,#(_EP4_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_EP4 + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP4 + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP6
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_EP6_ISR
	mov	r7,#(_EP6_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_EP6 + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP6 + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP8
	mov	a,#0x02
	movx	@dptr,a
;	include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r6,#_EP8_ISR
	mov	r7,#(_EP8_ISR >> 8)
	mov	ar5,r7
	mov	dptr,#(_INTVEC_EP8 + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP8 + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	include/ztex.h:423: EXIF &= ~bmBIT4;
	mov	r7,_EXIF
	mov	a,#0xEF
	anl	a,r7
	mov	_EXIF,a
;	include/ztex.h:424: USBIRQ = 0x7f;
	mov	dptr,#_USBIRQ
	mov	a,#0x7F
	movx	@dptr,a
;	include/ztex.h:425: USBIE |= 0x7f; 
	mov	dptr,#_USBIE
	movx	a,@dptr
	mov	r7,a
	orl	a,#0x7F
	movx	@dptr,a
;	include/ztex.h:426: EPIRQ = 0xff;
	mov	dptr,#_EPIRQ
	mov	a,#0xFF
	movx	@dptr,a
;	include/ztex.h:427: EPIE = 0xff;
	mov	dptr,#_EPIE
	mov	a,#0xFF
	movx	@dptr,a
;	include/ztex.h:429: EUSB = 1;
	setb	_EUSB
;	include/ztex.h:430: EA = 1;
	setb	_EA
;	include/ztex.h:349: EP$0CFG = bmBIT7 | bmBIT5;
	mov	dptr,#_EP1INCFG
	mov	a,#0xA0
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex.h:349: EP$0CFG = bmBIT7 | bmBIT5;
	mov	dptr,#_EP1OUTCFG
	mov	a,#0xA0
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex.h:344: ;
	mov	dptr,#_EP2CFG
	mov	a,#0xE0
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex.h:344: ;
	mov	dptr,#_EP4CFG
	clr	a
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex.h:344: ;
	mov	dptr,#_EP6CFG
	mov	a,#0xA0
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex.h:344: ;
	mov	dptr,#_EP8CFG
	clr	a
	movx	@dptr,a
;	include/ezregs.h:46: __endasm;
	nop
	nop
	nop
	nop
;	include/ztex.h:450: flash_init();
	lcall	_flash_init
;	include/ztex.h:451: if ( !flash_enabled ) {
	mov	dptr,#_flash_enabled
	movx	a,@dptr
	mov	r7,a
	jnz	00102$
;	include/ztex.h:452: wait(250);
	mov	dptr,#0x00FA
	lcall	_wait
;	include/ztex.h:453: flash_init();
	lcall	_flash_init
00102$:
;	include/ztex.h:463: mac_eeprom_init();
	lcall	_mac_eeprom_init
;	include/ztex.h:480: USBCS |= bmBIT7 | bmBIT1;
	mov	dptr,#_USBCS
	movx	a,@dptr
	orl	a,#0x82
	movx	@dptr,a
;	include/ztex.h:481: wait(10);
	mov	dptr,#0x000A
	lcall	_wait
;	include/ztex.h:483: USBCS &= ~bmBIT3;
	mov	dptr,#_USBCS
	movx	a,@dptr
	anl	a,#0xF7
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	transceiver.c:150: void main(void)	
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	transceiver.c:152: init_USB();
	lcall	_init_USB
;	transceiver.c:153: while (1) {}
00102$:
	sjmp	00102$
	.area CSEG    (CODE)
	.area CONST   (CODE)
_manufacturerString:
	.ascii "ZTEX"
	.db 0x00
_productString:
	.ascii "transceiver"
	.db 0x00
_configurationString:
	.ascii "default"
	.db 0x00
_DeviceDescriptor:
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x40	; 64
	.db #0x1A	; 26
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
_DeviceQualifierDescriptor:
	.db #0x0A	; 10
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0x00	; 0
_HighSpeedConfigDescriptor:
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x2E	; 46
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0xC0	; 192
	.db #0x32	; 50	'2'
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x82	; 130
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
_HighSpeedConfigDescriptor_PadByte:
	.db #0x00	; 0
	.db 0x00
_FullSpeedConfigDescriptor:
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x2E	; 46
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0xC0	; 192
	.db #0x32	; 50	'2'
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x82	; 130
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_FullSpeedConfigDescriptor_PadByte:
	.db #0x00	; 0
	.db 0x00
_EmptyStringDescriptor:
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
_mac_eeprom_init_hexdigits_1_167:
	.ascii "0123456789ABCDEF"
	.db 0x00
	.area XINIT   (CODE)
__xinit__ep0_payload_remaining:
	.byte #0x00,#0x00	; 0
__xinit__ep0_payload_transfer:
	.db #0x00	; 0
__xinit__GPIF_WAVE_DATA_HSFPGA_24MHZ:
	.db #0x01	;  1
	.db #0x88	; -120
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x07	;  7
	.db #0x02	;  2
	.db #0x07	;  7
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x00	;  0
	.db #0x20	;  32
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x20	;  32
	.db #0x00	;  0
	.db #0x36	;  54	'6'
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x3F	;  63
__xinit__GPIF_WAVE_DATA_HSFPGA_12MHZ:
	.db #0x02	;  2
	.db #0x01	;  1
	.db #0x90	; -112
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x07	;  7
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x07	;  7
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x00	;  0
	.db #0x20	;  32
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x20	;  32
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x36	;  54	'6'
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x3F	;  63
__xinit__ep0_prev_setup_request:
	.db #0xFF	; 255
__xinit__ep0_vendor_cmd_setup:
	.db #0x00	; 0
__xinit__ISOFRAME_COUNTER:
	.byte #0x00,#0x00	; 0
	.byte #0x00,#0x00	; 0
	.byte #0x00,#0x00	; 0
	.byte #0x00,#0x00	; 0
	.area CABS    (ABS,CODE)
