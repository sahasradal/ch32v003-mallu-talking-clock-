#riscv32-unknown-elf-as -g ch32v003_mallu_clock_3.S -o ch32v003_mallu_clock_3.o
#riscv32-unknown-elf-ld -T CH32V003.ld -Map=final.map ch32v003_mallu_clock_3.O
#riscv32-unknown-elf-objcopy -O ihex a.out ch32v003_mallu_clock_3.hex

.equ SRAM_start, 0x20000000
.equ SRAM_end, 0x20000800
.equ STACK, 0x20000800
.equ TIM2_BASE, 0x40000000
.equ W_WDG_BASE, 0x40002C00
.equ I_WDG_BASE, 0x40003000
.equ I2C_BASE, 0x40005400
.equ PWR_BASE, 0x40007000
.equ AFIO_BASE, 0x40010000
.equ EXTI_BASE, 0x40010400
.equ PORTA_BASE, 0x40010800
.equ PORTC_BASE, 0x40011000
.equ PORTD_BASE, 0x40011400
.equ ADC_BASE, 0x40012400
.equ TIM1_BASE, 0x40012C00
.equ SPI_BASE, 0x40013000
.equ USART_BASE, 0x40013800
.equ DMA_BASE, 0x40020000
.equ RCC_BASE, 0x40021000
.equ FLASH_INTERFACE_BASE, 0x40022000
.equ EXTENDED_MEM_BASE, 0x40023800
.equ CORE_PRIVATE_BASE, 0xE0000000
.equ FLASH_BASE, 0x08000000
.equ R32_RCC_CTLR, 0x40021000 #Clock control register 0x0000xx83
.equ R32_RCC_CFGR0, 0x40021004 #Clock configuration register 0 0x00000000
.equ R32_RCC_INTR, 0x40021008 #Clock interrupt register 0x00000000
.equ R32_RCC_APB2PRSTR, 0x4002100C #APB2 peripheral reset register 0x00000000
.equ R32_RCC_APB1PRSTR, 0x40021010 # APB1 peripheral reset register 0x00000000
.equ R32_RCC_AHBPCENR, 0x40021014 #AHB peripheral clock enable register 0x00000014
.equ R32_RCC_APB2PCENR, 0x40021018 #APB2 peripheral clock enable register 0x00000000
.equ R32_RCC_APB1PCENR, 0x4002101C #APB1 peripheral clock enable register 0x00000000
.equ R32_GPIOC_CFGLR, 0x40011000 #PC port configuration register low 0x44444444
.equ R32_GPIOD_CFGLR, 0x40011400 #PD port configuration register low 0x44444444
.equ R32_GPIOC_INDR, 0x40011008 #PC port input data register 0x0000XXXX
.equ R32_GPIOD_INDR, 0x40011408 #PD port input data register 0x0000XXXX
.equ R32_GPIOC_OUTDR, 0x4001100C #PC port output data register 0x00000000
.equ R32_GPIOD_OUTDR, 0x4001140C #PD port output data register 0x00000000
.equ R32_GPIOC_BSHR, 0x40011010 #PC port set/reset register 0x00000000
.equ R32_GPIOD_BSHR, 0x40011410 #PD port set/reset register 0x00000000
.equ R32_GPIOC_BCR, 0x40011014 #PC port reset register
.equ R32_GPIOD_BCR, 0x40011414 #PD port reset register 0x00000000
.equ R32_GPIOC_LCKR, 0x40011018 #PC port configuration lock register 0x00000000
.equ R32_GPIOD_LCKR, 0x40011418 #PD port configuration lock register 
.equ R32_AFIO_PCFR1, 0x40010004 #AFIO Remap Register 1
.equ R32_AFIO_EXTICR, 0x40010008 #External interrupt configuration register 1
.equ R32_USART_STATR, 0x40013800 #UASRT status register 0x000000C0
.equ R32_USART_DATAR, 0x40013804 #UASRT data register 0x000000XX
.equ R32_USART_BRR, 0x40013808 #UASRT baud rate register 0x00000000
.equ R32_USART_CTLR1, 0x4001380C #UASRT control register 1 0x00000000
.equ R32_USART_CTLR2, 0x40013810 #UASRT control register 2 0x00000000
.equ R32_USART_CTLR3, 0x40013814 #UASRT control register 3 0x00000000
.equ R32_USART_GPR, 0x40013818 #UASRT protection time and prescaler register
.equ R16_SPI_CTLR1, 0x40013000 #SPI Control register1 0x0000
.equ R16_SPI_CTLR2, 0x40013004 #SPI Control register2 0x0000
.equ R16_SPI_STATR, 0x40013008 #SPI Status register 0x0002
.equ R16_SPI_DATAR, 0x4001300C #SPI Data register 0x0000
.equ R16_SPI_CRCR,  0x40013010 #SPI Polynomial register 0x0007
.equ R16_SPI_RCRCR, 0x40013014 #SPI Receive CRC register 0x0000
.equ R16_SPI_TCRCR, 0x40013018 #SPI Transmit CRC register 0x0000
.equ R16_SPI_HSCR,  0x40013024 #SPI High-speed control register
.equ R32_GPIOA_OUTDR, 0x4001080C 	#PA port output data register 0x00000000
.equ R32_GPIOA_INDR, 0x40010808 	#PA port input data register 0x0000XXXX
.equ R32_GPIOA_CFGLR, 0x40010800 	#PA port configuration register low 0x44444444
.equ R32_GPIOA_BSHR, 0x40010810 	#PA port set/reset register 0x00000000
.equ R32_GPIOA_BCR, 0x40010814 	#PA port reset register 0x00000000
##/*--------------Control Command DF MP3 player--------------*/


.equ CMD_SET_VOLUME,        0x06 # Set volume (0 -> 30)
.equ CMD_SELECT_DEVICE,     0x09 # Select storage device (microSD: 2)
.equ CMD_RESET,             0x0C # Chip reset
.equ CMD_PLAY_FOLDER_FILE,  0x0F # Play the song with folder and song name
##/*---------------Query Command DF MP3 player---------------*/


#ST7735 1.8inch 128 x 160 LCD

.equ COLOR_BLACK, 0x0000
.equ COLOR_WHITE, 0xffff
.equ COLOR_RED, 0xf800
.equ COLOR_GREEN, 0x07e0
.equ COLOR_BLUE, 0x001f
.equ COLOR_MAGENTA, 0xf81f
.equ COLOR_CYAN, 0xffe0
.equ COLOR_YELLOW, 0x07ff
.equ ST7735_NOP, 0x00
.equ ST7735_SWRESET, 0x01
.equ ST7735_RDDID, 0x04
.equ ST7735_RDDST, 0x09
.equ ST7735_SLPIN,  0x10
.equ ST7735_SLPOUT,  0x11
.equ ST7735_PTLON, 0x12
.equ ST7735_NORON, 0x13

.equ ST7735_INVOFF, 0x20
.equ ST7735_INVON, 0x21
.equ ST7735_DISPOFF, 0x28
.equ ST7735_DISPON, 0x29
.equ ST7735_CASET, 0x2A
.equ ST7735_RASET, 0x2B
.equ ST7735_RAMWR, 0x2C
.equ ST7735_RAMRD, 0x2E

.equ ST7735_PTLAR, 0x30
.equ ST7735_COLMOD, 0x3A
.equ ST7735_MADCTL, 0x36

.equ ST7735_FRMCTR1, 0xB1
.equ ST7735_FRMCTR2, 0xB2
.equ ST7735_FRMCTR3, 0xB3
.equ ST7735_INVCTR, 0xB4
.equ ST7735_DISSET5, 0xB6

.equ ST7735_PWCTR1, 0xC0
.equ ST7735_PWCTR2, 0xC1
.equ ST7735_PWCTR3, 0xC2
.equ ST7735_PWCTR4, 0xC3
.equ ST7735_PWCTR5, 0xC4
.equ ST7735_VMCTR1, 0xC5

.equ ST7735_RDID1,   0xDA
.equ ST7735_RDID2,    0xDB
.equ ST7735_RDID3,    0xDC
.equ ST7735_RDID4,    0xDD
.equ ST7735_PWCTR6, 0xFC
.equ ST7735_GMCTRP1,  0xE0
.equ ST7735_GMCTRN1,  0xE1
.equ DC_COMMAND,   0
.equ DC_DATA,      0x40
.equ Rotat_UP, 0x00
.equ Rotat_LEFT, 0xa0	  
.equ Rotat_RIGHT, 0x60
.equ Rotat_DOWN, 0xc0 
.equ width,  128
.equ height, 160
.equ MADCTL_MY,  0x80
.equ MADCTL_MX,   0x40
.equ MADCTL_MV,   0x20
.equ MADCTL_ML,   0x10
.equ MADCTL_RGB, 0x00
.equ MADCTL_BGR, 0x08
.equ MADCTL_MH,  0x04
########
# Default mapping (NSS/PC1, CK/PC5, MISO/PC7, MOSI/PC6).Push-pull multiplexed output for full duplex master mode, hardware NSS
# MSB first ,CPL0,CHPA1,full duplex,hardware SS control
###########################
# CH32V003 PIN OUT 
###########################
#CS  = PC1
#DC  = PC2
#CLK = PC5
#MOSI= PC6
#BL  = PC3
#I2C_SCL 		= PA2 # I2C  clock on PD1 (reccomended external pullup 4.7k)
#I2C_SDA 		= PA1 # I2C  data on PD0 (reccomended external pullup 4.7k)
#UART_TX		= PD5
#UART_RX                = PD6
#menu			= PD2
#save			= PD3
#next			= PD4
#voice			= PD1
#DFplayer               = PD0
######################################### SRAM  VARIABLES
fclk 		= 24000000   		# 24Mhz RCO internal , AHB =8Mhz by default
state 		= 0x2000000C 		# located in SRAM
result11 	= 0x20000010 		# 0x20000010 to 0x20000018 is used for storing result in decimal format
result22 	= 0x20000014
fraction 	= 0x20000018
fraction2  	= 0x2000001C
result_lo 	= 0x20000020
result_hi 	= 0x20000024
modulo 		= 0x20000028
scratch 	= 0x2000002C
XYC 		= 0x20000030
XYCOLOUR 	= 0x20000034
dividend 	= 0x20000038 
divisor 	= 0x2000003C
scratchpad 	= 0x20000040
mem 		= 0x20000044
FONTCOLOR       = 0x20000058		#b3b2 = font colour, b1b0 = background color
counter		= 0x2000005C
counter1        = 0x20000060
buffer1		= 0x20000064
buffer2		= 0x20000068
.equ buffer,   0x2000006C
.equ buffer01,  0x20000070
.equ buffer02,  0x20000074
.equ buffer03,  0x20000078
.equ clock_display,   0x2000007C
.equ clock_display1,  0x20000080 # stores 1 second measure window overflow for slow signals
.equ clock_display2,  0x20000084
.equ clock_display3,  0x20000088
.equ result1,  0x2000008C
.equ result2,  0x20000090 
.equ result3,  0x20000094
.equ week   ,  0x20000098
.equ language, 0x2000009C
.equ mem,  0x200000A0 # 10 bytes used by print function from 0(mem)
.equ mem1,  0x200000A4 # till 9(mem) , 2 bytes in mem1

.equ DS1307WAD , 0xD0
.equ DS1307RAD , 0xD1
.equ read_data_len , 7
.equ sda ,	0x00000002
.equ scl ,	0x00000004

.macro push val
  addi sp, sp, -4
  sw \val, 0(sp)
.endm

.macro pop val
  lw \val, 0(sp)
  addi sp, sp, 4
.endm

.macro fontcolor val
  la x10,FONTCOLOR
  addi x10,x10,2
  li x7, \val
  sh x7,0(x10)	
.endm

.macro bgcolor val
  la x10,FONTCOLOR
  li x7, \val
  sh x7,0(x10)
.endm

.macro PRINT val
  li x15,\val
  call select_font
  call DRAW_CHAR32
.endm



.macro FILLSCREEN val
  li x15,\val
  call FILL_SCREEN
.endm

.macro SETCURSOR x y x1 y1 
  la x10,XYC
  li x15,\x
  sb x15,0(x10)
  addi x10,x10,1
  li x15,\x1
  sb x15,0(x10)
  addi x10,x10,1
  li x15,\y
  sb x15,0(x10)
  addi x10,x10,1
  li x15,\y1
  sb x15,0(x10)
  call setTFTwindow
.endm


.macro loadPARAM1 command, ack, x7, x6
	addi sp,sp,-8
	#sw ra,0(sp)
	sw x3,0(sp)
	sw a1,4(sp)
    	la a1,result1		# result1 in SRAM holds 8 byte command format
	addi a1,a1,3
	li x3,\command	
	sb x3,0(a1)		# write byte 3 ,command
	addi a1,a1,1
	li x3,\ack		
	sb x3,0(a1)		# write byte 4,whether ack need or not 0 or 1
	addi a1,a1,1
	mv x3,\x7
	sb x3,0(a1)		# write byte 5, hi byte of data
	addi a1,a1,1
	mv x3,\x6
	sb x3,0(a1)		# write byte 6, low byte of data
	lw a1,4(sp)
	lw x3,0(sp)
	#lw ra,0(sp)
	addi sp,sp,8
	
.endm



.align 4
.text
.global start
start:
sp_init:
    	la sp, STACK			# initialize stack pointer
		
#Enable GPIO clocks & AFIO in APB2 clock register
        
    	la x10,R32_RCC_APB2PCENR	# load address of APB2PCENR register to x10 ,for enabling GPIO A,D,C peripherals
	lw x11,0(x10)			# load contents from peripheral register R32_RCC_APB2PCENR pointed by x10
	li x7,((1<<2)|(1<<4)|(1<<5)|(1<<0)|(1<<11)|(1<<12)|(1<<14))	# 1<<IOPA_EN,1<<IOPC_EN,1<<IOPD_EN,1<<AFIOEN,1<<SPI enable port A,C,D and AFIO functions
	or x11,x11,x7			# or values 
	sw x11,0(x10)			# store modified enable values in R32_RCC_APB2PCENR

###########
#configure GPIO PortC as multiplex push-pull output for SPI
	la x10,R32_GPIOC_CFGLR		# load pointer x10 with address of R32_GPIOC_CFGLR , I2C SDA & SCL is on portC PC1,PC2
	lw x11,0(x10)			# load contents from register pointed by x10
	li x7,~((0xf<<4)|(0xf<<8)|(0xf<<12)|(0xf<<20)|(0xf<<24)|(0xf<<28))	# clear pc1,pc5,pc6,pc7. we need to setup PC1 ,PC5,PC6,PC7 for SPI. PC2 will be D/C pushpull
	and x11,x11,x7			# clear  mode and cnf bits for selected pin C1,C2
	li x7,((0xB<<4)|(0x3<<8)|(0x3<<12)|(0xB<<20)|(0xB<<24)|(0xB<<28))		# SPI PC1,PC5,PC6,PC7 = multiplex pushpull output 50mhz , 0b1011. PC2 = D/C pushpull for TFT,PC3=LED pushpull,PC4 input w/pullup voice switch
	or x11,x11,x7			# OR value to register
	sw x11,0(x10)			# store in R32_GPIOC_CFGLR


#configure GPIO D for uart and I2c
	la x10,R32_GPIOD_CFGLR		# load pointer x10 with address of R32_GPIOD_CFGLR , GPIO configuration register
	lw x11,0(x10)			# load contents from register pointed by x10
	li x7,~((0xf<<0)|(0xf<<4)|(0xf<<8)|(0xf<<12)|(0xf<<16)|(0xf<<20)|(0xf<<24))	#clear pd6,pd5,pd1,pd0. we need to setup PD5 & PD6 for usart tx and rx and pd1,pd0 for I2C remap
	and x11,x11,x7			# clear pd5,pd6,pd1,pd0 mode and cnf bits for selected pin D4,D5,D6
	li x7,((0x3<<0)|(0x8<<4)|(0x8<<8)|(0x8<<12)|(0x8<<16)|(0xB<<20)|(0x8<<24))	# pd1,pd2,pd3,pd4,pd6 = input with PU/PD,pd5= multiplex pushpull output 50mhz,PD0 universal pushpull DF PLAYER
	or x11,x11,x7			# OR value to register
	sw x11,0(x10)			# store in R32_GPIOD_CFGLR

#enable pull up for input	
	la x10,R32_GPIOD_OUTDR		# enable pullup resistor by setting OUTDR register
	lw x11,0(x10)			# this setting of GPIO_OUTDR for pullup resistor effects if corresonding pin is selected as input
	li x7,((1<<1)|(1<<2)|(1<<3)|(1<<4)|(1<<6)) #when PD1,PD2,PD3,PD4,PD6 is input with resistor selected 1= pullup and 0 = pulldown
	or x11,x11,x7
	sw x11,0(x10)

#configure GPIO A for I2c
	la x10,R32_GPIOA_CFGLR		# load pointer x10 with address of R32_GPIOD_CFGLR , GPIO configuration register
	lw x11,0(x10)			# load contents from register pointed by x10
	li x7,~((0xf<<4)|(0xf<<8))	# clear pa1,pa2,
	and x11,x11,x7			# clear pa1,pa2
	li x7,((5<<4)|(5<<8))		# set output opendrain for PA1 and PA2
	or x11,x11,x7			# OR value to register
	sw x11,0(x10)			# store in R32_GPIOA_CFGLR

#configure USART baud
	la x10,R32_USART_BRR		# USART BAUD setting
	lw x11,0(x10)			# copy R32_USART_BRR to x11
	li x7,((52<<4)|(1<<0))		# 52.1 in BRR =9600
	or x11,x11,x7			# or registers
	sw x11,0(x10)			# store in R32_USART_BRR

#setup UART control and enable	
	la x10,R32_USART_CTLR1		# load x10 with R32_USART_CTLR1 address
	lw x11,0(x10)			# load to x11 contents
	li x7,(1<<13)|(1<<3)|(1<<2)	# enable USART UE, TX,RX bits		# UE 
	or x11,x11,x7
	sw x11,0(x10)			# store back new values

SPI_CONFIG:
	la x10,R32_RCC_APB1PRSTR	# set pointer to clock control  peripheral reset register 
	lw x11,0(x10)			# load contents to x11
	li x7,(1<<12)			# shift 1 to 12th bit position
	or x11,x11,x7			# OR with x11
	sw x11,0(x10)			# set bit 12 of R32_RCC_APB1PRSTR to reset SPI peripheral
	not x7,x7			# invert values in x7
	and x11,x11,x7			# and x11 to write a 0 in 21st bit
	sw x11,0(x10)			# store 0 in 12th bit to restart SPI engine


	la x10,R16_SPI_CTLR1
	lw x11,0(x10)
	li x7,((1<<2)|(1<<3)|(1<<8))	# MSTR,BR(FHCLK /4),SSI
	or x11,x11,x7
	sw x11,0(x10)

	
	la x10,R16_SPI_CTLR2
	lw x11,0(x10)
	li x7,(1<<2)			# SSOE bit
	or x11,x11,x7
	sw x11,0(x10)

	la x10,R16_SPI_CTLR1
	lw x11,0(x10)
	li x7,(1<<6)			# SPE , enable SPI
	or x11,x11,x7
	sw x11,0(x10)


############
	call ST7735_init	# ST3375 LCD initialization routine
	call CLEAR_SCREEN	# macro clear screen to blackout screen
	bgcolor COLOR_BLACK	# set font background colour
	fontcolor COLOR_WHITE	# set font colour white
############
check_sw:
	la a4,R32_GPIOD_INDR	# load a4 with PortD base address
	lw a3,0(a4)		# load a3 with contents of portD Istatus
	andi a3,a3,0x00000004	# and with 0x04 to isolate PD2 status
	bnez a3,voice_sw	# if 1 branch to label no menu. If PD0 pressed time set menu is called else go to time display/update
	call menu		# calls routine to save and set time

voice_sw:
	la a4,R32_GPIOD_INDR	# load a4 with PortC base address
	lw a3,0(a4)		# load a3 with contents of portD Istatus
	andi a3,a3,0x00000002	# and with 0x02 to isolate PD1 status
	bnez a3,show_time	# if 1 branch to label no menu. If PD1 pressed time set menu is called else go to time display/update
	call start_audio	# calls routine to announce time

	
show_time:
	SETCURSOR 0 0 15 31	# top left 00 coordinates
	bgcolor COLOR_BLACK	# background colour of font
	fontcolor COLOR_WHITE	# font colour	
	call I2C_START 		# send start condition on I2C bus
	li x7,DS1307WAD 	# radio random read address
	call I2C_WRITE 		# call subroutine to transmit value loaded in a0
	li x7,0x00 		# clock register 0x00 is set as pointer
	call I2C_WRITE 		# call subroutine to transmit value loaded in a0
	call clock_read 	# reads 7 bytes from clock register 
	call BCD_ASCII		# converts BCD to ASCII values
	call time_buffer_for_OLED# rearranges converted ASCII characters in HR:MIN:SEC format, address clock display , 8 bytes for time 
	call print_time		# routine to print time
	call display_date_buffer# routine that arranges date in buffer
	SETCURSOR 0 40 15 71	# set cursor at x0y40
	call print_date		# print date as 2nd line
	SETCURSOR 0 80 15 111	# set cursor at x0y80
	call print_week		# routine prints week string as 3rd line
	call delay1S		# 1 second delay
	j check_sw		# loop to check switch



####----I2C--FUNCTIONS-----------------------------------------------------------------------------
#I2C SUBROUTINES____________________________________#

##########################
SDA_HI:
	addi sp,sp,-12
	sw ra,0(sp)
	sw a0,4(sp)
	sw x7,8(sp)
	la a0,R32_GPIOA_BSHR		# load address of GPIOA port bit set register
	li x7,sda			# set PA1, bit1 ,0x00000002
	sw x7,0(a0)			# store in port register, resistor pulls sda high , opendrain
	lw x7,8(sp)
	lw a0,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret
#########################
SDA_LO:
	addi sp,sp,-12
	sw ra,0(sp)
	sw a0,4(sp)
	sw x7,8(sp)
	la a0,R32_GPIOA_BCR		# address of port bit clear register
	li x7,sda			# 0x00000002 will clear and port pulls sda to low to ground
	sw x7,0(a0)
	lw x7,8(sp)
	lw a0,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret
#######################
SCL_HI:
	addi sp,sp,-12
	sw ra,0(sp)
	sw a0,4(sp)
	sw x7,8(sp)
	la a0,R32_GPIOA_BSHR		# bit set register for porta
	li x7,scl			# 0x00000004 , sets PA2, bit2
	sw x7,0(a0)			# resistor pulls up SCL opendrain line
	lw x7,8(sp)
	lw a0,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret
########################
SCL_LO:
	addi sp,sp,-12
	sw ra,0(sp)
	sw a0,4(sp)
	sw x7,8(sp)
	la a0,R32_GPIOA_BCR		# bit clear register for porta
	li x7,scl			# clear bit when 1 is written, 0x00000004
	sw x7,0(a0)			# pulls SCL low to ground
	lw x7,8(sp)
	lw a0,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret
##########################
I2C_START:
	addi sp,sp,-4
	sw ra,0(sp)
	call SDA_HI			# SDA high , bus in released condition
	call SCL_HI			# SCL high , bus in released condition
	call SDA_LO			# SDA low while SCL high
	call SCL_LO			# follow SDA then SCL low
	lw ra,0(sp)
	addi sp,sp,4
	ret
#########################
I2C_STOP:
	addi sp,sp,-4
	sw ra,0(sp)
	call SDA_LO			# make SDA low before SCL is high
	call SCL_HI			# SCL high while SDA is low for stop
	call SDA_HI			# release SDA for nuetral condition on bus
	lw ra,0(sp)
	addi sp,sp,4
	ret
###################
SEND_ACK:
	addi sp,sp,-4
	sw ra,0(sp)
	call SDA_LO			# while SDA low cycle clock
	call SCL_HI			# cycle clock
	call SCL_LO			# cycle clock
	call SDA_HI			# SDA high after cycling clock
	lw ra,0(sp)
	addi sp,sp,4
	ret
########################
SEND_NACK:
	addi sp,sp,-4
	sw ra,0(sp)
	call SDA_HI			# while SDA high cycle clock
	call SCL_HI			# cycle clock
	call SCL_LO			# cycle clock
	lw ra,0(sp)
	addi sp,sp,4
	ret
###############

I2C_WRITE:				# load data byte in x7 and call I2C_WRITE
	addi sp,sp,-12
	sw ra,0(sp)
	sw x3,4(sp)
	sw x5,8(sp)
	li x3,8				# bit counter
trx_loop:
	call SDA_LO			# start with sda low
	mv x5,x7			# data in x7 is moved to x5 working register
	andi x5,x5,0x80			# extract msb
	beqz x5,bit0			# if 0 branch to bit0
	call SDA_HI			# if 1 call SDA_HI
bit0:
	call SCL_HI			# call SCL_HI , cycle clock to transmit data
	slli x7,x7,1			# shift x7 1 bit left
	call SCL_LO			# call SCL_LO to finisg 1 clock
	addi x3,x3,-1			# decrease bit counter
	bnez x3,trx_loop		# loop till all bits are transmitted
	call SDA_HI           		# for ACK
	call SCL_HI			# ack start
	call SCL_LO			# ack finished
	call SDA_LO			# SDA-LO
	lw x5,8(sp)
	lw x3,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret
##################################
I2C_READ_BYTE:
    	addi sp,sp,-16		# adjust stack
    	sw ra,0(sp)		# push RA
	sw x7,4(sp)		# push x7
	sw x3,8(sp)		# push x3
	sw x5,12(sp)		# push x5
    	li x7,0			# clear result register
    	li x3,8  		# Initialize bit counter
rx_loop:
    	call SDA_HI		# release SDA for data receive
    	call SCL_HI		# begine clocking cycle
    	la a0,R32_GPIOA_INDR	# point a0 to port A input register
    	lw x5,0(a0)		# load word for input register
    	andi x5,x5,2		# extract bit 1 to know data line value
    	slli x7,x7,1       	# Shift left to make room for the next bit
    	or x7,x7,x5        	# Store the bit into the byte
    	call SCL_LO		# finsh clock cycling for the bit
    	addi x3,x3,-1		# decrease bit counter
    	bnez x3,rx_loop    	# Repeat for next bit until all 8 bits are received
	srli x7,x7,1		# SDA is on bit1, the data in x7 is offset by 1 bit to left. align to right by shifting 1 byte right
	sb x7,0(a1) 		# Store received byte in buffer , routine called with a1 pointing buffer      
    	lw x5,12(sp)		# pop x5
	lw x3,8(sp)		# pop x3
	lw x7,4(sp)		# pop x7
	lw ra,0(sp)		# pop RA
    	addi sp,sp,16		# adjust stack
    	ret			# return to caller
##################################

I2C_MULTI_READ:                        # call with number of bytes to be read in x6
	addi sp,sp,-12
	sw ra,0(sp)
	sw a1,4(sp)
	sw x6,8(sp)
	la a1,buffer			# a1 points to buffer
	call I2C_START			# send start on bus
	li x7,DS1307RAD 		# load read address of slave, to be defined
	call I2C_WRITE			# write the address on bus with I2C_WRITE routine
byte_read_loop:
	call I2C_READ_BYTE		# reads 1 byte into buffer
	addi a1,a1,1			# increase buffer address by 1 byte
	addi x6,x6,-1			# decrease receive byte count
	bnez x6,need_ack		# if byte counter is above 0, branch to need_ack label to send ACK
	call SEND_NACK			# if byte counter is 0 send NACK to terminate read
	j send_stop			# jump to label stop to send i2c stop
need_ack:
	call SEND_ACK			# call routine to send ACK if byte counter is not 0
	j byte_read_loop		# jump to byte_read_loop to exhaust byte counter
send_stop:
	call I2C_STOP			# call routine to stop i2c transmission and release bus
	lw x6,8(sp)
	lw a1,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret

################################################################################
# delay routines
#==========================================
delay10S: 
	addi sp,sp,-8 			# push RA
	sw ra,0(sp) 			# push RA
	sw t1,4(sp)
	li t1,20100101 			# load an arbitarary value 20000000 to t1 register 
loop10S:
	addi t1,t1,-1 			# subtract 1 from t1
	bne t1,zero,loop10S 		# if t1 not equal to 0 branch to label loop
	lw t1,4(sp)
	lw ra,0(sp) 			# POP RA
	addi sp,sp,8 			# pop RA
	ret 

delay1S: 
	addi sp,sp,-8 			# push RA
	sw ra,0(sp) 			# push RA
	sw t1,4(sp)
	li t1,2010010 			# load an arbitarary value 20000000 to t1 register 
loop1s:
	addi t1,t1,-1 			# subtract 1 from t1
	bne t1,zero,loop1s 		# if t1 not equal to 0 branch to label loop
	lw t1,4(sp)
	lw ra,0(sp) 			# POP RA
	addi sp,sp,8 			# pop RA
	ret 

delay1ms:
	addi sp,sp,-8 			# push RA
	sw ra,0(sp) 			# push RA
	sw t1,4(sp) 
	li t1,2010 			# load an arbitarary value 20000000 to t1 register 
loop1ms:
	addi t1,t1,-1 			# subtract 1 from t1
	bne t1,zero,loop1ms 		# if t1 not equal to 0 branch to label loop
	lw t1,4(sp)
	lw ra,0(sp) 			# POP RA
	addi sp,sp,8 			# pop RA 
	ret 

delay10ms:
	addi sp,sp,-8 			# push RA
	sw ra,0(sp) 			# push RA
	sw t1,4(sp) 
	li t1,20100 			# load an arbitarary value 20000000 to t1 register 
loop10ms:
	addi t1,t1,-1 			# subtract 1 from t1
	bne t1,zero,loop10ms 		# if t1 not equal to 0 branch to label loop
	lw t1,4(sp)
	lw ra,0(sp) 			# POP RA
	addi sp,sp,8 			# pop RA
	ret

delay50ms:
	addi sp,sp,-8 			# push RA
	sw ra,0(sp) 			# push RA
	sw t1,4(sp) 
	li t1,100500 			# load an arbitrary value 20000000 to t1 register 
loop50ms:
	addi t1,t1,-1 			# subtract 1 from t1
	bne t1,zero,loop50ms 		# if t1 not equal to 0 branch to label loop
	lw t1,4(sp)
	lw ra,0(sp) 			# POP RA
	addi sp,sp,8 			# pop RA
	ret 
#################################################################################
#####################################################################
#load byte in x8 for UART and call USART_TX to transmit a byte
#####################################################################	
	
USART_TX:
	addi sp,sp,-16			# add space in stack
	sw ra,0(sp)			# push ra
	sw x7,4(sp)			# push x7
	sw x10,8(sp)			# push x10
	sw x11,12(sp)			# push x11

	li x10,R32_USART_STATR		# load address of usart status register
	lw x11,0(x10)			# load contents of status register in x11
	andi x11,x11,(1<<7)		# mask out 7th bit, transmit buffer empty flag
	beqz x11,USART_TX		# if 0 transmit buffer full, wait until bit is set
	#li x8,0x30
	mv x7,x8			# move byte in x8 to x7
	li x10,R32_USART_DATAR		# x10 has the address of data register
	sb x7,0(x10)			#store byte in x7 to data register
TC_check:
	li x10,R32_USART_STATR		# get contents of status register again
	lw x11,0(x10)
	andi x11,x11,(1<<6)		# check transmit complete bit
	beqz x11,TC_check		# wait if bit is 0 , when transmit complete = 1
		
	lw x11,12(sp)			# pop x11
	lw x10,8(sp)			# pop x10
	lw x7,4(sp)			# pop x7
	lw ra,0(sp)			# pop ra
	addi sp,sp,16			# set SP back 16 bytes
	ret				# return to caller

########################################
##########################################################################################################
# converts 1 byte into ASCII represented hexadecimal value , load byte in t2
##########################################################################################################
bin_to_ascii:
	addi sp,sp,-4
	sw ra,0(sp)
	mv a3,t2
	andi a3,a3,0xf0
	srli a3,a3,4
	slti a4,a3,10			# set a4 to 1 if a3 is less than 10 ,10and higher a4=0
	beqz a4 ,letter1
	ori a3,a3,0x30
	#mv a0,a3
	mv x8,a3
	call USART_TX
	j low_nibble
letter1:
	addi a3,a3,0x37
	#mv a0,a3
	mv x8,a3
	call USART_TX
low_nibble:
	mv a3,t2
	andi a3,a3,0x0f
	slti a4,a3,10			# set a4 to 1 if a3 is less than 10 ,10and higher a4=0
	beqz a4 ,letter2
	ori a3,a3,0x30
	#mv a0,a3
	mv x8,a3
	call USART_TX
	j exit_bin_to_ascii
letter2:
	addi a3,a3,0x37
	#mv a0,a3
	mv x8,a3
	call USART_TX
exit_bin_to_ascii:
	lw ra,0(sp)
	addi sp,sp,4
	ret
####################################################
#########################################################################################################################################
######### below block is for DEBUGGING, prints  registers contents in hexadecimal & decimal via UART to terminal
#########################################################################################################################################
debug:
	addi sp,sp,-20
	sw ra,0(sp)
	sw x10,4(sp)
	sw t1,8(sp)
	sw t2,12(sp)
	sw x8,16(sp)

	la x10,buffer			# SRAM address where systick count is stored in ISR
	li t1,4				# print count 4 , 4 bytes to be transfered
readloop22:
	lb t2,3(x10)			# read from top most byte 
	call bin_to_ascii		# call routine that converts binary to ASCII format of hexadecimal , convets 1 byte
	addi x10,x10,-1			# decrease memorey address  counter
	addi t1,t1,-1			# decrease byte counter ( total 4 bytes to be converted and transmitted via uart)
	bnez t1,readloop22		# if counter greater than 0 loop
	li x8,0x0d			# carriage return
	call USART_TX			# transmit
	li x8,0x0a			# line feed
	call USART_TX			# transmit

	la x10,buffer01			# SRAM address where systick count is stored in ISR
	li t1,4				# print count 4 , 4 bytes to be transfered
readloop23:
	lb t2,3(x10)			# read from top most byte 
	call bin_to_ascii
	addi x10,x10,-1
	addi t1,t1,-1
	bnez t1,readloop23
	li x8,0x0d
	call USART_TX
	li x8,0x0a
	call USART_TX
	lw x8,16(sp)
	lw t2,12(sp)
	lw t1,8(sp)
	lw x10,4(sp)
	lw ra,0(sp) 
	addi sp,sp,20
	ret
	
###########################################
####################################################################################
# prints time in buffer (8 bytes --- HR:MN:Ss) , arguments in buffer
###################################################################################
	
print_time:
	addi sp,sp,-12		# push RA
	sw ra,0(sp)		# push RA
	sw x3,4(sp)		# push x3
	sw a1,8(sp)		# push a1
	li x3,8			# counter for 8 bytes(hr:n:ss)
	la a1,buffer		# point a1 to buffer start
	addi a1,a1,7		# increase by 7 bytes, time stored as ss:mn:hr in buffer. need to read backwards
print_time_loop:
	lbu a5,0(a1)		# load a byte
	call select_font	# find correct font
	call DRAW_CHAR32	# write to screen
	call push_cursor1	# move cursor one box ahead for the next char
	addi a1,a1,-1		# decrease address by 1 
	addi x3,x3,-1		# increase t1 counter 1
	bnez x3,print_time_loop	# if a3 is not equal to t1 loop
	lw a1,8(sp)		# pop a1
	lw x3,4(sp)		# pop x3
	lw ra,0(sp)		# POP RA
	addi sp,sp,12		# adj stack
	ret			# return to caller

####################################################################################
# prints date in buffer (8 bytes --- DT:MT:YR) , load arguments in buffer before calling
###################################################################################
	
print_date:
	addi sp,sp,-12		# push RA
	sw ra,0(sp)		# push RA
	sw x3,4(sp)		# push x3
	sw a1,8(sp)		# push a1
	li x3,8			# counter for 8 bytes(dt-mo-yr)
	la a1,buffer		# point a1 to buffer
print_date_loop:
	lbu a5,0(a1)		# load byte from buffer
	call select_font	# select eqvalent font
	call DRAW_CHAR32	# write to screen
	call push_cursor1	# move cursor one box ahead for the next char
	addi a1,a1,1		# increase address by 16 , one char array
	addi x3,x3,-1		# increase t1 counter 1
	bnez x3,print_date_loop	# if a3 is not equal to t1 loop
	lw a1,8(sp)		# pop a1
	lw x3,4(sp)		# pop x3
	lw ra,0(sp)		# pop ra
	addi sp,sp,12		# adj stack
	ret			# return to caller
###############################################################################################
# Prints week day string based on what is stored in SRAM variable week,set cursor before caling
###############################################################################################
print_week:
	addi sp,sp,-8			# adj stack
	sw ra,0(sp)			# push ra
	sw a2,4(sp)			# push a2
	la a2,week			# SRAM variable holds address of correct string to be displayed
	lw x3,0(a2)			# copy address of week string to x3
	mv a2,x3			# move address of week string to pointer a2
week_loop:
    	lb a5, 0(a2)             	# Load the current byte (character) into x15
    	beq a5, zero, wend_loop   	# If character is null (0), exit the loop as we reach end of string
	call select_font		# select eqvalent font for the char loaded
	call DRAW_CHAR32		# write font in screen
	call push_cursor1		# move cursor one box ahead for the next char
	addi a2,a2,1           		# increase address by 1 for next byte
	j week_loop             	# Repeat the loop
wend_loop:
	lw a2,4(sp)			# pop a2
	lw ra,0(sp)			# pop ra
	addi sp,sp,8			# adj stack
    	ret				# Exit the program
###################################################################################
#   clock_read ,,, before calling store address in t1, num of bytes in t0 
###################################################################################


clock_read:          		# store address in t1, num of bytes in t0 ,
	addi sp,sp,-4 		# push RA
	sw ra,0(sp) 		# push RA
	li x6,7 		# number of bytes to be received (sec,min,hour,day,date,month,year)
	call I2C_MULTI_READ 	# reads 7 bytes from RDA5807 and stores in buffer in litteendian format
	lw ra,0(sp) 		# POP RA
	addi sp,sp,4 		# pop RA
	ret			# return to caller



#####################################################################################
# BCD_ASCII converts BCD data received from clock in buffer to ASCII chars in clock_dispaly (sram) 
#####################################################################################

BCD_ASCII:
	addi sp,sp,-20
	sw ra,0(sp)
	sw a2,4(sp)
	sw x3,8(sp)
	sw a3,12(sp)
	sw a1,16(sp)
	la a2, buffer
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	la a3, clock_display
	sb x3,0(a3) 		# 2nd seconds digit
	lb x3,0(a2)
	andi x3,x3,0x70
	srli x3,x3,4
	ori x3,x3,0x30
	addi a3,a3,1
	sb x3,0(a3) 		# 1st seconds digit
	addi a3,a3,1

	addi a2,a2,1   		# increase buffer address to read next byte

	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	sb x3,0(a3) 		# 2nd minutes digit
	lb x3,0(a2)
	andi x3,x3,0xf0
	srli x3,x3,4
	ori x3,x3,0x30
	addi a3,a3,1
	sb x3,0(a3) 		# 1st minutes digit
	addi a3,a3,1

	addi a2,a2,1   		# increase buffer address to read next byte

	lb x3,0(a2)
	andi x3,x3,0x0f 
	ori x3,x3,0x30
	sb x3,0(a3) 		# 2nd hour digit, 2 or 1
	lb x3,0(a2)
	andi x3,x3,0x30 	# bit4,bit5
	srli x3,x3,4
	ori x3,x3,0x30
	addi a3,a3,1
	sb x3,0(a3) 		# 1st hours digit
	addi a3,a3,1

	addi a2,a2,1   		# increase buffer address to read next byte

	lb x3,0(a2)
	andi x3,x3,0x07 	# bit2,bit1,bit0
	li x5,1
	beq x3,x5,monday
	li x5,2
	beq x3,x5,tuesday
	li x5,3
	beq x3,x5,wednesday
	li x5,4
	beq x3,x5,thursday
	li x5,5
	beq x3,x5,friday
	li x5,6
	beq x3,x5,saturday
	li x5,7
	beq x3,x5,sunday
monday:
	la x5,mon		# load address of string monday
	la a1,week		# load address of sram registr wweek
	sw x5,0(a1)		# store address of monday string in week
	j dday			# jump to label dday
	
tuesday:
	la x5,tue		# load address of string tuesday
	la a1,week		# load address of sram register
	sw x5,0(a1)		# store address of tuesday string in week
	j dday			# jump to label dday

wednesday:
	la x5,wed
	la a1,week
	sw x5,0(a1)
	j dday

thursday:
	la x5,thu
	la a1,week
	sw x5,0(a1)
	j dday

friday:
	la x5,fri
	la a1,week
	sw x5,0(a1)
	j dday

saturday:
	la x5,sat
	la a1,week
	sw x5,0(a1)
	j dday

sunday:
	la x5,sun
	la a1,week
	sw x5,0(a1)
	j dday

dday:


	lb x3,0(a2)
	andi x3,x3,0x07 	# bit2,bit1,bit0
	add x3,x3,x3		# add day number (1-7) from rtc with itself to determine the start index of week characters
	la x5,day		# load the address of array "day". it has week days characters
	add x5,x5,x3		# add index in x3 to day start address to get the correct 1st char for week
	lb x3,0(x5)		# load the byte 
	sb x3,0(a3) 		# day 1st byte is stored in display
	addi x5,x5,1		# increase day address
	addi a3,a3,1		# increase display address
	lb x3,0(x5)		# load the next char byte from day array
	sb x3,0(a3)		# day 2nd byte stored in display
	addi a3,a3,1		# increase display address for next operation

	addi a2,a2,1   		# increase buffer address to read next byte

	lb x3,0(a2)
	andi x3,x3,0xf0 
	srli x3,x3,4
	ori x3,x3,0x30
	sb x3,0(a3) 		# 2nd date, 3,2 or 1
	lb x3,0(a2)
	andi x3,x3,0x0f 	# bit4,bit5
	ori x3,x3,0x30
	addi a3,a3,1
	sb x3,0(a3) 		# 1st date digit
	addi a3,a3,1 

	addi a2,a2,1   		# increase buffer address to read next byte

	lb x3,0(a2)
	andi x3,x3,0x20 
	srli x3,x3,4
	ori x3,x3,0x30
	sb x3,0(a3) 		# 2nd month, 3,2 or 1
	lb x3,0(a2)
	andi x3,x3,0x0f 	# bit4,bit5
	ori x3,x3,0x30
	addi a3,a3,1
	sb x3,0(a3) 		# 1st month digit
	addi a3,a3,1 

	addi a2,a2,1   		# increase buffer address to read next byte

	lb x3,0(a2)
	andi x3,x3,0xf0 
	srli x3,x3,4
	ori x3,x3,0x30
	sb x3,0(a3) 		# 2nd year, 3,2 or 1
	lb x3,0(a2)
	andi x3,x3,0x0f 	# bit4,bit5
	ori x3,x3,0x30
	addi a3,a3,1
	sb x3,0(a3) 		# 1st year digit
	addi a3,a3,1 
	lw a1,16(sp)
	lw a3,12(sp)
	lw x3,8(sp)
	lw a2,4(sp)
	lw ra,0(sp)
	addi sp,sp,20
	ret
#################################################################################################################
# time_buffer_for_OLED  , arrange buffer in correct order for time,time will be printed from this buffer
################################################################################################################
time_buffer_for_OLED:
	addi sp,sp,-16
	sw ra,0(sp)
	sw x4,4(sp)
	sw a2,8(sp)
	sw a3,12(sp)
	la a2,clock_display
	la a3,buffer
	lb x4,0(a2)
	sb x4,0(a3) # 2nd sec
	addi a2,a2,1
	addi a3,a3,1
	lb x4,0(a2)
	sb x4,0(a3) # 1st sec
	addi a3,a3,1
	li x4,':'
	sb x4,0(a3) # colon
	addi a2,a2,1
	addi a3,a3,1
	lb x4,0(a2)
	sb x4,0(a3) # 2nd min
	addi a2,a2,1
	addi a3,a3,1
	lb x4,0(a2)
	sb x4,0(a3) # 1st min
	addi a3,a3,1
	li x4,':'
	sb x4,0(a3) # colon
	addi a2,a2,1
	addi a3,a3,1
	lb x4,0(a2)
	sb x4,0(a3) # 2nd hr
	addi a2,a2,1
	addi a3,a3,1
	lb x4,0(a2)
	sb x4,0(a3) # 1st hr
	lw a3,12(sp)
	lw a2,8(sp)
	lw x4,4(sp)
	lw ra,0(sp)
	addi sp,sp,16
	ret

###################################################
#################################################################################
# reads a string with address loaded in a2,    la a2, my_string , uses s1 and x3 
####################################################################################
string_reader:
	addi sp,sp,-4
	sw ra,0(sp)
sr_loop:
    	lb a5, 0(a2)             	# Load the current byte (character) into a1
    	beq a5, zero, end_loop   	# If character is null (0), exit the loop
	call select_font
	call DRAW_CHAR32
	call push_cursor1		# move cursor one box ahead for the next char
	addi a2,a2,1           		# increase address by 1 for next byte
	j sr_loop             		# Repeat the loop
end_loop:
	lw ra,0(sp)
	addi sp,sp,4
    	ret				# Exit the program

###################################################################################
#menu- adjust/set seconds,minutes,hour,day,date,month,year and store in RTC
###################################################################################
menu:
	addi sp,sp,-28
	sw ra,0(sp)
	sw x3,4(sp)
	sw s1,8(sp)
	sw a2,12(sp)
	sw x4,16(sp)
	sw a3,20(sp)
	sw x15,24(sp)
	li x3,0			# load 0 in x3
	la s1,clock_display	# point s1 to clock_display (sram)
	sb x3,0(s1)		# store 0 seconds at clock_display0		
	call CLEAR_SCREEN	# clear OLED
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes2		# " adj minutes",0
	call string_reader	# send above sring to OLED
	call delay1S		#  second delay for display message
	call delay1S
	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
min_start:
	li x4,59		# counter 59 for 60 minutes
	la a2,number		# point a2 to label number in ROM
	la s1,buffer		# point s1 to buffer in sram
min_loop:
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	lb x3,0(a2)		# load byte from BCD number array 0x00-0x99
	andi x3,x3,0xf0		# extract the top nibble
	srli x3,x3,4		# right shift 4 to get the nibble in the lower side
	ori x3,x3,0x30		# OR with 0x30(ascii0)to convert the nibble to ASCII char
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)		# load the sane BCD again to process the lower nibble
	andi x3,x3,0x0f		# extract the lower nibble by AND ing with 0x0f
	ori x3,x3,0x30		# OR with ASCII 0 to convert it to ascii char
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call delay1S		# delay of 1 second for human requirement
	addi a2,a2,1		# increase the number address in case user presses next button
	addi x4,x4,-1		# decrease counter x4
scan_save_min:
	la a4,R32_GPIOD_INDR			# load a4 with PortD base address
	lw a3,0(a4)				# load a3 with contents of portD Istatus
	andi a3,a3,0x00000008			# and with 0x08 to isolate PD3 status
	beqz a3,save_min			# if 0 branch to label save minute	
scan_next_min:	
	la a4,R32_GPIOD_INDR			# load a4 with PortD base address
	lw a3,0(a4)				# load a3 with contents of portD Istatus
	andi a3,a3,0x00000010			# and with 0x10 to isolate PD4 status
	beqz a3,next_min			# if 0 branch to label next minute	
	j scan_save_min				# if no switch is pressed jump to scan_save_min label until any of the switch is pressed
next_min:
	beqz x4,min_start			# next switch was pressed, check whether the counter has reached 0 , if reached jump to min_start to reload	
	j min_loop
save_min:
	addi a2,a2,-1				# number address was advanced earlier 1 byte anticipating a next button press , go back 1 byte and store it
	lb x3,0(a2)
	la s1,clock_display
	addi s1,s1,1				# clock_display0 = seconds
	sb x3,0(s1)				# hour BCD in clock_display 1



	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes1
	call string_reader
	call delay1S
	call delay1S
	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
hour_start:
	li x4,24				# counter 24 for 24 hour
	la a2,number
	la s1,buffer
hour_loop:
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	lb x3,0(a2)
	andi x3,x3,0xf0
	srli x3,x3,4
	ori x3,x3,0x30
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	call delay1S
	addi a2,a2,1
	addi x4,x4,-1
scan_save:
	la a4,R32_GPIOD_INDR			# load a4 with PortA base address
	lw a3,0(a4)				# load a3 with contents of portA Istatus
	andi a3,a3,0x00000008			# and with 0x08 to isolate PA3 status
	beqz a3,save_hr				# if 0 branch to label save hour	
scan_next:	
	la a4,R32_GPIOD_INDR			# load a4 with PortA base address
	lw a3,0(a4)				# load a3 with contents of portA Istatus
	andi a3,a3,0x00000010			# and with 0x08 to isolate PA6 status
	beqz a3,next_hr				# if 0 branch to label next hour	
	j scan_save
next_hr:
	beqz x4,hour_start	
	j hour_loop
save_hr:
	addi a2,a2,-1				# number address was advanced earlier 1 byte anticipating a next button press , go back 1 byte and store it
	lb x3,0(a2)
	la s1,clock_display
	addi s1,s1,2
	sb x3,0(s1)				# hour BCD in clock_display 2



	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes3				# save day
	call string_reader
	call delay1S
	call delay1S
	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
day_start:
	li x4,7			# counter 24 for 24 hour
	la a2,number
	addi a2,a2,1		# sajeev
	la s1,buffer
day_loop:
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	lb x3,0(a2)
	andi x3,x3,0xf0
	srli x3,x3,4
	ori x3,x3,0x30
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	call delay1S
	addi a2,a2,1
	addi x4,x4,-1
scan_save_day:
	la a4,R32_GPIOD_INDR			# load a4 with PortA base address
	lw a3,0(a4)				# load a3 with contents of portA Istatus
	andi a3,a3,0x00000008			# and with 0x08 to isolate PA3 status
	beqz a3,save_day			# if 0 branch to label save day	
scan_next_day:	
	la a4,R32_GPIOD_INDR			# load a4 with PortA base address
	lw a3,0(a4)				# load a3 with contents of portA Istatus
	andi a3,a3,0x00000010			# and with 0x08 to isolate PA6 status
	beqz a3,next_day			# if 0 branch to label next day	
	j scan_save_day
next_day:
	beqz x4,day_start	
	j day_loop
save_day:
	addi a2,a2,-1				# number address was advanced earlier 1 byte anticipating a next button press , go back 1 byte and store it
	lb x3,0(a2)
	la s1,clock_display
	addi s1,s1,3
	sb x3,0(s1)				# day BCD in clock_display 3



	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes6		# "adj date ",0
	call string_reader
	call delay1S
	call delay1S
	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
date_start:
	li x4,31				# counter 12 for 12 month
	la a2,number
	addi a2,a2,1		# sajeev
	la s1,buffer
date_loop:
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	lb x3,0(a2)
	andi x3,x3,0xf0
	srli x3,x3,4
	ori x3,x3,0x30
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	call delay1S
	addi a2,a2,1
	addi x4,x4,-1
scan_save_date:
	la a4,R32_GPIOD_INDR			# load a4 with PortA base address
	lw a3,0(a4)				# load a3 with contents of portA Istatus
	andi a3,a3,0x00000008			# and with 0x08 to isolate PA3 status
	beqz a3,save_date			# if 0 branch to label save date	
scan_next_date:	
	la a4,R32_GPIOD_INDR			# load a4 with PortA base address
	lw a3,0(a4)				# load a3 with contents of portA Istatus
	andi a3,a3,0x00000010			# and with 0x08 to isolate PA6 status
	beqz a3,next_date			# if 0 branch to label next date	
	j scan_save_date
next_date:
	beqz x4,date_start	
	j date_loop
save_date:
	addi a2,a2,-1				# number address was advanced earlier 1 byte anticipating a next button press , go back 1 byte and store it
	lb x3,0(a2)
	la s1,clock_display
	addi s1,s1,4
	sb x3,0(s1)				# month BCD in clock_display 4




	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes4				# "adj month ",0
	call string_reader			# display message in oled
	call delay1S				# delay 2 seconds for user
	call delay1S
	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
month_start:
	li x4,12				# counter 12 for 12 month
	la a2,number				# load address of number array to be displayed from which user will select
	addi a2,a2,1				# sajeev
	la s1,buffer				# load address of buffer
month_loop:
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	lb x3,0(a2)				# load a BCD number from array
	andi x3,x3,0xf0				# as BCD has 2digits encoded in byte ,and with 0xf0 to extract MSB
	srli x3,x3,4				# shift 4 right to isolate MSB into lower nibble
	ori x3,x3,0x30				# or with ascii 0 (0x30) to convert BCD to ASCII char
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)				# load same BCD again to process the lower byte of the number
	andi x3,x3,0x0f				# extract LSB by anding with 0x0f
	ori x3,x3,0x30				# convert to ascii by OR ing with 0x30
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	call delay1S				# delay 1 second for seeing and decision making
	addi a2,a2,1				# increase number array address to process next number if user chooses next button
	addi x4,x4,-1				# decrease limit counter, here 1-12 is the range as we are dealing with month
scan_save_month:				# save button is checked for user input
	la a4,R32_GPIOD_INDR			# load a4 with PortA base address
	lw a3,0(a4)				# load a3 with contents of portA Istatus
	andi a3,a3,0x00000008			# and with 0x08 to isolate PA3 status
	beqz a3,save_month			# if 0 branch to label save month	
scan_next_month:				# next button is scanned for user input
	la a4,R32_GPIOD_INDR			# load a4 with PortA base address
	lw a3,0(a4)				# load a3 with contents of portA Istatus
	andi a3,a3,0x00000010			# and with 0x08 to isolate PA6 status
	beqz a3,next_month			# if 0 branch to label next month	
	j scan_save_month			# loops to scan_save_month label until user takes a decision on saving or next
next_month:
	beqz x4,month_start			# if range counter reaches 0 branch to month start which will load 12 in x4 to start over
	j month_loop				# if range counter is not 0 jump to month_loop label for next number
save_month:
	addi a2,a2,-1				# number address was advanced earlier 1 byte anticipating a next button press , go back 1 byte and store it
	lb x3,0(a2)				# store number currently displayed in screen from number array pointed by a2
	la s1,clock_display			# point s1 to clock_display address
	addi s1,s1,5				# set the address to store month as 5th byte (sec,minute,hour,day,date,month,year)
	sb x3,0(s1)				# month BCD in clock_display 5




	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes5				# "adj year ",0
	call string_reader
	call delay1S
	call delay1S
	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
year_start:
	li x4,99				# counter 12 for 12 month
	la a2,number
	la s1,buffer
year_loop:
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	lb x3,0(a2)
	andi x3,x3,0xf0
	srli x3,x3,4
	ori x3,x3,0x30
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	call delay1S
	addi a2,a2,1
	addi x4,x4,-1
scan_save_year:
	la a4,R32_GPIOD_INDR			# load a4 with PortD base address
	lw a3,0(a4)				# load a3 with contents of portD Istatus
	andi a3,a3,0x00000008			# and with 0x08 to isolate PD3 status
	beqz a3,save_year			# if 0 branch to label save year	
scan_next_year:	
	la a4,R32_GPIOD_INDR			# load a4 with PortD base address
	lw a3,0(a4)				# load a3 with contents of portD Istatus
	andi a3,a3,0x00000010			# and with 0x08 to isolate PD4 status
	beqz a3,next_year			# if 0 branch to label next year	
	j scan_save_year
next_year:
	beqz x4,year_start	
	j year_loop
save_year:
	addi a2,a2,-1				# number address was advanced earlier 1 byte anticipating a next button press , go back 1 byte and store it
	lb x3,0(a2)
	la s1,clock_display
	addi s1,s1,6
	sb x3,0(s1)				# month BCD in clock_display 6


	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes7				# "language",0
	call string_reader
	call delay1S
	call delay1S
	call CLEAR_SCREEN	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
lang_start:
	li x4,8				# 9 languages
	la a2,number
	la s1,language
lang_loop:
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	lb x3,0(a2)
	andi x3,x3,0xf0
	srli x3,x3,4
	ori x3,x3,0x30
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	mv  x15, x3
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	SETCURSOR 0 40 15 71	# set cursor at x0y40
	lb x3,0(a2)
	beqz x3,malayalam
	li x5,1
	beq x3,x5,tamil
	li x5,2
	beq x3,x5,kannada
	li x5,3
	beq x3,x5,telugu
	li x5,4
	beq x3,x5,hindi
	li x5,5
	beq x3,x5,gujarati
	li x5,6
	beq x3,x5,punjabi
	li x5,7
	beq x3,x5,english
	li x5,8
	beq x3,x5,bengali


malayalam:
	la a3,mal
	call string_reader1
	j finfin
tamil:
	la a3,tam
	call string_reader1
	j finfin
kannada:
	la a3,kan
	call string_reader1
	j finfin
telugu:
	la a3,tel
	call string_reader1
	j finfin
hindi:
	la a3,hin
	call string_reader1
	j finfin
gujarati:
	la a3,guj
	call string_reader1
	j finfin
punjabi:
	la a3,pun
	call string_reader1
	j finfin
english:
	la a3,eng
	call string_reader1
	j finfin
bengali:
	la a3,ben
	call string_reader1
finfin:

	call delay1S
	addi a2,a2,1
	addi x4,x4,-1
scan_save_lang:
	la a4,R32_GPIOD_INDR			# load a4 with PortD base address
	lw a3,0(a4)				# load a3 with contents of portD Istatus
	andi a3,a3,0x00000008			# and with 0x08 to isolate PD3 status
	beqz a3,save_lang			# if 0 branch to label save year	
scan_next_lang:	
	la a4,R32_GPIOD_INDR			# load a4 with PortD base address
	lw a3,0(a4)				# load a3 with contents of portD Istatus
	andi a3,a3,0x00000010			# and with 0x08 to isolate PD4 status
	beqz a3,next_lang			# if 0 branch to label next year	
	j scan_save_lang
next_lang:
	beqz x4,lang_start	
	j lang_loop
save_lang:
	addi a2,a2,-1				# number address was advanced earlier 1 byte anticipating a next button press , go back 1 byte and store it
	lb x3,0(a2)
	la s1,language
	sb x3,0(s1)				# language BCD in language




clock_update:
	call I2C_START 				# send start condition on I2C bus
	li x7,DS1307WAD 			# clock write address
	call I2C_WRITE
	li x7,0x00 				# clock register 0x00 is set as pointer
	call I2C_WRITE 				# call subroutine to transmit value loaded in a5
	li x7,0x80				# only for DS1307
	call I2C_WRITE				# only for DS1307
	call I2C_STOP				# only for DS1307
# for DS3231 start from here##################	
	call I2C_START				
	li x7,DS1307WAD
	call I2C_WRITE
	li x7,0x00
	call I2C_WRITE
	la a2,clock_display
	li x3,7
time_set_loop:
	lb x7,0(a2)
	call I2C_WRITE
	addi a2,a2,1
	addi x3,x3,-1
	bnez x3,time_set_loop
	call I2C_STOP 				# call subroutine to terminate I2C operation
	lw x15,24(sp)
	lw a3,20(sp)
	lw x4,16(sp)
	lw a2,12(sp)
	lw s1,8(sp)
	lw x3,4(sp)
	lw ra,0(sp)
	addi sp,sp,28
	ret

################################################################################
#display_date_buffer , assembles date and day in buffer - day,date,month,year
#################################################################################
 display_date_buffer:
	addi sp,sp,-16
	sw ra,0(sp)
	sw x4,4(sp)
	sw a2,8(sp)
	sw a3,12(sp)
	la a2,clock_display		# point address of clock display with a2
	addi a2,a2,8			# clock_display+6=day1 sec2byte,minute2byte,hour2byte,day1byte,date2byte,month2byte,year2byte
	la a3,buffer			# point buffer with a3
	lb x4,0(a2)			# load byte from 8th byte of clockdisplay first char of date
	sb x4,0(a3) # 1st date		# store 1st char of date
	addi a2,a2,1			# increase clock display address
	addi a3,a3,1			# increase bufffer 1 byte
	lb x4,0(a2)			# load 2nd char of date
	sb x4,0(a3) # 2nd date		# store 2nd char of date
	addi a3,a3,1			# increase bufffer 1 byte
	li x4,'-'			# load x4 with -
	sb x4,0(a3) # colon		# store - in buffer
	addi a2,a2,1
	addi a3,a3,1
	lb x4,0(a2)
	sb x4,0(a3) # 1st month
	addi a2,a2,1
	addi a3,a3,1
	lb x4,0(a2)
	sb x4,0(a3) # 2nd month
	addi a3,a3,1
	li x4,'-'
	sb x4,0(a3) # colon
	addi a2,a2,1
	addi a3,a3,1
	lb x4,0(a2)
	sb x4,0(a3) # 1st year
	addi a2,a2,1
	addi a3,a3,1
	lb x4,0(a2)
	sb x4,0(a3) # 2nd year
	lw a3,12(sp)
	lw a2,8(sp)
	lw x4,4(sp)
	lw ra,0(sp)
	addi sp,sp,16
	ret


###################################################################################################################
# load_DF_command  used to construct basic DF command structure in result1 , use macro loadPARAM to fill parameters
####################################################################################################################
load_DF_command:
	addi sp,sp,-16
	sw ra,0(sp)
	sw x3,4(sp)
	sw a1,8(sp)
	sw a2,12(sp)
	la a2,result1
	la a1,base_DF_command
	lw x3,0(a1)
	sw x3,0(a2)
	addi a1,a1,4
	addi a2,a2,4
	lw x3,0(a1)
	sw x3,0(a2)
	lw a2,12(sp)
	lw a1,8(sp)
	lw x3,4(sp)
	lw ra,0(sp)
	addi sp,sp,16
	ret
######################################################################################
# send_DF_command , used to send constructed commands to DF mini player
#######################################################################################

send_DF_commands:		# sends DF command , fixed version for 8 bytes
	addi sp,sp,-16
	sw ra,0(sp)
	sw x8,4(sp)
	sw a1,8(sp)
	sw x3,12(sp)
	li x3,8			# x3 loaded with loop count , 
	la a1,result1
Uloop:
	lb x8,0(a1)		# uart takes argument in x8
	call USART_TX
	addi a1,a1,1
	addi x3,x3,-1
	bnez x3,Uloop
	lw x3,12(sp)
	lw a1,8(sp)
	lw x8,4(sp)
	lw ra,0(sp)
	addi sp,sp,16
	ret

######################################################################################
# start_audio 
######################################################################################

start_audio:
	addi sp,sp,-36
	sw ra,0(sp)
	sw a0,4(sp)
	sw a1,8(sp)
	sw x6,12(sp)
	sw x5,16(sp)
	sw x4,20(sp)
	sw x3,24(sp)
	sw x7,28(sp)
	sw x8,32(sp)

DF_ON:
	la x10,R32_GPIOD_BSHR		# R32_GPIOD_BSHR register sets and resets GPIOD pins, load address into pointer x10
	lw x11,0(x10)			# load contents to x11
	li x7,(1<<0)			# set pd0 by shifting 1 to bit position 4
	or x11,x11,x7			# OR with x11
	sw x11,0(x10)			# store x11 to R32_GPIOD_BSHR

	call I2C_START 		# send start condition on I2C bus
	li x7,DS1307WAD 	# radio random read address
	call I2C_WRITE 		# call subroutine to transmit value loaded in a0
	li x7,0x00 		# clock register 0x00 is set as pointer
	call I2C_WRITE 		# call subroutine to transmit value loaded in a0
	call clock_read 	# reads 7 bytes from clock register 


	call load_DF_command
	li x6,0x00
	li x7,0x00
	loadPARAM1 CMD_RESET, 0x00, x7, x6   # initialize DF player
	call send_DF_commands
	call delay1S
	call load_DF_command
	li x6,0x02
	li x7,0x00
	loadPARAM1 CMD_SELECT_DEVICE, 0x00, x7, x6   # select SD card
	call send_DF_commands
	call delay1S
	call load_DF_command
	li x6,0x14
	li x7,0x00
	loadPARAM1 CMD_SET_VOLUME, 0x00, x7, x6   #Select device volume 20 = 0x14
	call send_DF_commands
	call delay1S

cal_lang_folder:	
	la a1,language
	lb x7,0(a1)
	beqz x7,for0
	li x4,9
	mv x8,x7
multiplyF1:
	add x7,x7,x8
	addi x4,x4,-1
	bnez x4, multiplyF1
for0:
	addi x7,x7,1		# increase result by 1 , folder starts from 1 (1-8 for one language, then 11-18 .....)

	call load_DF_command
	li x6,0x00
	li x7,0x00
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, x7, x6   #Select "now time" in folder 01 track 000
	call send_DF_commands
	call delay1S

	la a1,buffer
	addi a1,a1,2            # increment address pointer to 3rd byte hour
	lb x3,0(a1)
	andi x3,x3,0x70
	srli x3,x3,4
	li x4,9
	mv x5,x3
multiply1:
	add x3,x3,x5
	addi x4,x4,-1
	bnez x4, multiply1
	mv x6,x3
	lb x3,0(a1)
	andi x3,x3,0x0f
	add x6,x6,x3
	addi x7,x7,1		# increment folder
	call load_DF_command
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, x7, x6   #Select hour in folder 02
	call send_DF_commands
	call delay1S
	call delay1S

	la a1,buffer
	addi a1,a1,1            # increment address pointer to 2nd byte minute
	lb x3,0(a1)
	andi x3,x3,0xf0
	srli x3,x3,4
	li x4,9
	mv x5,x3
multiply2:
	add x3,x3,x5
	addi x4,x4,-1
	bnez x4, multiply2
	mv x6,x3
	lb x3,0(a1)
	andi x3,x3,0x0f
	add x6,x6,x3
	addi x7,x7,1		# increment folder
	call load_DF_command
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, x7, x6   #Select minute in folder 03
	call send_DF_commands
	call delay1S
	call delay1S

	addi x7,x7,1		# increment folder
	call load_DF_command
	li x6,0x00
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, x7, x6   #Select "today" in folder 04 track 000
	call send_DF_commands
	call delay1S


	la a1,buffer
	addi a1,a1,3            # increment address pointer to 4th byte day
	lb x3,0(a1)
	andi x3,x3,0x0f
	mv x6,x3
	addi x7,x7,1
	call load_DF_command
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, x7, x6   #Select day in folder 05
	call send_DF_commands
	call delay1S
	

	la a1,buffer
	addi a1,a1,4            # increment address pointer to 5th byte date
	lb x3,0(a1)
	andi x3,x3,0xf0
	srli x3,x3,4
	li x4,9
	mv x5,x3
multiply3:
	add x3,x3,x5
	addi x4,x4,-1
	bnez x4, multiply3
	mv x6,x3
	lb x3,0(a1)
	andi x3,x3,0x0f
	add x6,x6,x3
	addi x7,x7,1		# increment folder
	call load_DF_command
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, x7, x6   #Select date in folder 06
	call send_DF_commands
	call delay1S
	call delay1S


	la a1,buffer
	addi a1,a1,5            # increment address pointer to 6th byte month
	lb x3,0(a1)
	andi x3,x3,0xf0
	srli x3,x3,4
	li x4,9
	mv x5,x3
multiply4:
	add x3,x3,x5
	addi x4,x4,-1
	bnez x4, multiply4
	mv x6,x3
	lb x3,0(a1)
	andi x3,x3,0x0f
	add x6,x6,x3
	addi x7,x7,1		# increment folder
	call load_DF_command
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, x7, x6   #Select month in folder 07
	call send_DF_commands
	call delay1S

	la a1,buffer
	addi a1,a1,6            # increment address pointer to 7th byte year
	lb x3,0(a1)
	andi x3,x3,0xf0
	srli x3,x3,4
	li x4,9
	mv x5,x3
multiply5:
	add x3,x3,x5
	addi x4,x4,-1
	bnez x4, multiply5
	mv x6,x3
	lb x3,0(a1)
	andi x3,x3,0x0f
	add x6,x6,x3
	addi x7,x7,1		# increment folder
	call load_DF_command
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, x7, x6  #Select year in folder 08
	call send_DF_commands
	call delay1S
	call delay1S
DF_OFF:
	la x10,R32_GPIOD_BSHR		# R32_GPIOD_BSHR register sets and resets GPIOC pins, load address into pointer x10
	lw x11,0(x10)			# load contents to x11
	li x7,1<<16			# reset pd0 by shifting 1 into bit position 20 of R32_GPIOD_BSHR
	or x11,x11,x7			# OR with x11
	sw x11,0(x10)			# store x11 to R32_GPIOD_BSHR

	

	lw x8,32(sp)
	lw x7,28(sp)
	lw x3,24(sp)
	lw x4,20(sp)
	lw x5,16(sp)
	lw x6,12(sp)
	lw a1,8(sp)
	lw a0,4(sp)
	lw ra,0(sp)
	addi sp,sp,36
	ret

		
#########################################################################
#######SPI_SUBROUTINES:
#########################################################################
SPI_WRITE:
	addi sp,sp,-12			# move stack pointer 3 words
	sw ra,0(sp)			# push return address
	sw x10,4(sp)			# push x10
	sw x11,8(sp)			# push x11
SPIW_LOOP:
	la x10,R16_SPI_STATR		# set pointer x10 to SPI status register
	lw x11,0(x10)			# copy contents to x11
	andi x11,x11,(1<<1)		# TXE bit , AND x11 with TXE,transmission buffer empty bit mask
	beqz x11,SPIW_LOOP		# if TXE bit not set wait in a tight loop
	la x10,R16_SPI_DATAR		# once TXE bit is set ,point SPI data register with x10
	sw x15,0(x10)			# store data in x15 to SPI data register

	lw x11,8(sp)			# pop x11
	lw x10,4(sp)			# pop x10
	lw ra,0(sp)			# pop return address register
	addi sp,sp,12			# restore stack pointer to old position
	ret				# return to caller
#####################	
SPI_READ:
	addi sp,sp,-12			# move stack pointer 3 words
	sw ra,0(sp)			# push return address
	sw x10,4(sp)			# push x10
	sw x11,8(sp)			# push x11
SPIR_LOOP:
	la x10,R16_SPI_STATR		# set pointer x10 to SPI status register
	lw x11,0(x10)			# copy contents to x11
	andi x11,x11,(1<<0)		# RXNE bit, AND with RXNE bit mask , receive buffer not empty bit mask
	beqz x11,SPIR_LOOP		# if RXNE bit not set wait in a tight loop, wait till data arrive in receive register
	la x10,R16_SPI_DATAR		# x10 points to SPI data register
	lw x15,0(x10)			# load data to x15 from address pointed by x10(SPI data register)

	lw x11,8(sp)			# pop x11
	lw x10,4(sp)			# pop x10
	lw ra,0(sp)			# pop return address register
	addi sp,sp,12			# restore stack pointer to old position
	ret				# return to caller
#######################################################################################################################
# DATA_ON routine to make DC pin PD4 made high to indicate data is being transmitted
#######################################################################################################################
DATA_ON:
	addi sp,sp,-16			# move stack pointer 3 words
	sw ra,0(sp)			# push return address
	sw x10,4(sp)			# push x10
	sw x11,8(sp)			# push x11
	sw x7,12(sp)

	la x10,R32_GPIOC_BSHR		# R32_GPIOD_BSHR register sets and resets GPIOD pins, load address into pointer x10
	lw x11,0(x10)			# load contents to x11
	li x7,(1<<2)			# set pd4 by shifting 1 to bit position 4
	or x11,x11,x7			# OR with x11
	sw x11,0(x10)			# store x11 to R32_GPIOD_BSHR

	lw x7,12(sp)
	lw x11,8(sp)			# pop x11
	lw x10,4(sp)			# pop x10
	lw ra,0(sp)			# pop return address register
	addi sp,sp,16			# restore stack pointer to old position
	ret				# return to caller
##########################################################################################################################
# COMMAND_ON , routine to make DC pin PD4 low to indicate TFT commands are transmitted
##########################################################################################################################
COMMAND_ON:
	addi sp,sp,-16			# move stack pointer 3 words
	sw ra,0(sp)			# push return address
	sw x10,4(sp)			# push x10
	sw x11,8(sp)			# push x11
	sw x7,12(sp)

	la x10,R32_GPIOC_BSHR		# R32_GPIOD_BSHR register sets and resets GPIOD pins, load address into pointer x10
	lw x11,0(x10)			# load contents to x11
	li x7,(1<<18)			# reset pd4 by shifting 1 into bit position 20 of R32_GPIOD_BSHR
	or x11,x11,x7			# OR with x11
	sw x11,0(x10)			# store x11 to R32_GPIOD_BSHR

	lw x7,12(sp)
	lw x11,8(sp)			# pop x11
	lw x10,4(sp)			# pop x10
	lw ra,0(sp)			# pop return address register
	addi sp,sp,16			# restore stack pointer to old position
	ret				# return to caller


####################################################################
# call with value in x6-100000# 50ms,1000000# 500ms,20000# 10ms,
####################################################################

delay:	
	addi sp,sp,-8			# move sp 2 words
	sw ra,0(sp)			# push ra
	sw x6,4(sp)			# push x6
#	li x6,2000000			# load an arbitarary value 20000000 to t1 register		
dloop:
	addi x6,x6,-1			# subtract 1 from t1
	bne x6,zero,dloop		# if t1 not equal to 0 branch to label loop
	lw x6,4(sp)			# pop x6
	lw ra,0(sp)			# pop ra
	addi sp,sp,8			# sp back 2 words
	ret				# return to caller

################################################################################

#####################################################################################
## call PIXEL_REPEAT to fill entire screen with colour stored in upper 2 bytes of 
## XYCOLOUR . 
####################################################################################
PIXEL_REPEAT:
	addi sp,sp,-12			# move stack pointer 3 words
	sw ra,0(sp)			# push return address
	sw x10,4(sp)
	sw x5,8(sp)
	
	li x5,20480			# length ((x1-x0)*(y1-y0)) = total number of pixels to be written
	call setTFTwindow		# 128 x 160 = 20480 pixels
repeat_pixel:
	call TFTpixel			# TFTpixel subroutine transmits colour to one pixel
	addi x5,x5,-1			# The pixel pointer internal to the TFT auto increments after each write and detrmined by the boundaries set by setTFTwindow routine
	bnez x5,repeat_pixel		# If x5 register is not 0 repeat sending colour data to pixels

	lw x5,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)			# pop return address register
	addi sp,sp,12			# restore stack pointer to old position
	ret				# return to caller
###########################################################################	


##########################################################################################################################
#### TFTpixel writes colour data , should be called after calling setTFTwindow and required colour in XYCOLOUR byte3&byte2
############################################################################################################################
TFTpixel:
	addi sp,sp,-8			# move stack pointer 3 words
	sw ra,0(sp)			# push return address
	sw x10,4(sp)
	call DATA_ON			# DC pin PD4 high indicating LCD that data foloows
	li x10,XYCOLOUR			# point to XYCOLOUR which holds colour data in hiher bytes
	addi x10,x10,3			# point to byte3
	lb x15,0(x10)			# load hi byte colour to x15
	addi x10,x10,-1			# move pointer x10 to byte2 of XYCOLOUR
	call SPI_WRITE			# send hi byte of colour in x15 with SPI
	lb x15,0(x10)			# low byte colour
	call SPI_WRITE			# send low byte via spi
	lw x10,4(sp)
	lw ra,0(sp)			# pop return address register
	addi sp,sp,8			# restore stack pointer to old position
	ret				# return to caller
############################################################################
###############################################################################
# routine to clear screen and fill black colour , direct call , no prerequisites
###############################################################################
CLEAR_SCREEN:
	addi sp,sp,-12
	sw ra,0(sp)
	sw x7,4(sp)
	sw x10,8(sp)
	li x7,0xA0008000		# 160 ,0,128,0 screen size in pixels
	la x10,XYC			# load address of XYC to hold coordinates
	sw x7,0(x10)			# store coordinnates in XYC
	la x10,XYCOLOUR			# point x10 to XYCOLOUR
	li x7,COLOR_BLACK		# load black colour in x7
	slli x7,x7,16			# shift lhs 16 steps , loaded values is shifted to high bytes
	sw x7,0(x10)			# store colour values in XYCOLOUR
	call PIXEL_REPEAT		# call PIXEL_REPEAT to write pixels
	lw x10,8(sp)
	lw x7,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret
################################################################################################################
# FILL_SCREEN ,routine to fill screen with desired colour, load colour in x15 to call FILL_SCREEN or use macro
##################################################################################################################
FILL_SCREEN:
	addi sp,sp,-16
	sw ra,0(sp)
	sw x7,4(sp)
	sw x10,8(sp)
	sw x11,12(sp)
	li x7,0xA0008000		# 160 ,0,128,0 screen size in pixels
	la x10,XYC			# point x10 to XYC ,holds pixel coordinates
	sw x7,0(x10)			# store coordinates in XYC
	la x10,XYCOLOUR			# point x10 to XYCOLOUR
#	la x11,FONTCOLOR		# colour
#	lh x7,0(x11)			# byte0 and byte1 holds background colour
#	addi x10,x10,2			# byte2,byte3 holds colour data for PIXEL_WRITE
	slli x15,x15,16			# colour value is loaded in x15 outside this routine, shft 16 left to align with XYCOLOUR
	sw x15,0(x10)			# store colour in XYCOLOUR
	call PIXEL_REPEAT		# call PIXEL_REPEAT to fill colour data in screen
	lw x11,12(sp)
	lw x10,8(sp)
	lw x7,4(sp)
	lw ra,0(sp)
	addi sp,sp,16
	ret

##############################################################################################
###  setTFTwindow sets the area where the colour to be filled , load XYC before calling
#############################################################################################

setTFTwindow:	
	addi sp,sp,-8			# move stack pointer 3 words
	sw ra,0(sp)			# push return address
	sw x10,4(sp)
	li x6 , 2000			# 1ms
	call delay			# ims delay
	call COMMAND_ON			# DC pin pulled low , commands to be transmitted
	li x15,ST7735_CASET		#/* col address command */
	call SPI_WRITE			# transmit command via spi
	li x6 , 2000			# 1ms
	call delay			# 1ms delay for SPI to finish transmission
	call DATA_ON			# pull DC high to transmit data
	li x15,0x00			# D16 to D8 of 1st parameter of column
	call SPI_WRITE			# transmit command via spi
	li x10,XYC			# XYC in sram stores x0,x1,y0,y1 coordinates
	lb x15,0(x10)			# write X0 start of x coordinate to x15 UART loader,D7 to D0 of 1st parameter
	addi x10,x10,1			# increase XYC address by 1 byte
	call SPI_WRITE			# write x0 to LCD
	li x15,0x00			# D16 to D8 of 2nd parameter of column
	call SPI_WRITE			# transmit command via spi
	lb x15,0(x10)			# write X1 end of x coordinate to x15
	addi x10,x10,1			# increase XYC address by 1 byte
	call SPI_WRITE			# write x1 to LCD	
	li x6 , 2000			# 1ms
	call delay

	call COMMAND_ON			# DC pin pulled low , commands to be transmitted
	li x15,ST7735_RASET		#/* Row address command */
	call SPI_WRITE			# transmit command via spi
	li x6 , 2000			# 1ms
	call delay			# 1ms delay
	call DATA_ON			# DC pin pulled hi for data
	li x15,0x00			# hi byte of row is 0 ,
	call SPI_WRITE			# write via SPI
	lb x15,0(x10)			# write Y0 start of x coordinate to x15
	addi x10,x10,1			# increase XYC address by 1 byte
	call SPI_WRITE			# write Y0 to LCD
	li x15,0x00			# hi byte is 0
	call SPI_WRITE			# spi write
	lb x15,0(x10)			# write Y1 end of y coordinate to x15
	call SPI_WRITE			# write Y0 to LCD, x10 not increased as 4 coordinates written
	li x6 , 2000			# 1ms
	call delay			# 1ms delay
	call COMMAND_ON			# pull DC low for command
	li x15,ST7735_RAMWR		# command for LCD RAM access
	call SPI_WRITE			# transmit command via SPI
	li x6 , 2000			# 1ms
	call delay			# call 1ms delay
	lw x10,4(sp)
	lw ra,0(sp)			# pop return address register
	addi sp,sp,8			# restore stack pointer to old position
	ret				# return to caller	

###################################################################################
# RAMWR command Memory range: (0000h, 0000h) -> (007Fh, 09Fh) , 128x160x18-bit memory can be written by this command
###################################################################################	


###################################################################################################################
# ST7735_init subroutines load the initialization values for the LCD
###################################################################################################################

ST7735_init:
	addi sp,sp,-12
	sw ra,0(sp)
	sw x6,4(sp)
	sw x15,8(sp)
	call COMMAND_ON
	li x15,ST7735_SWRESET
	call SPI_WRITE
	li x6 , 100000			# 50ms
	call delay
	
	li x15,ST7735_SLPOUT
	call SPI_WRITE
	li x6 , 1000000			# 500ms
	call delay

	li x15,ST7735_COLMOD
	call SPI_WRITE
	li x6 , 2000			# 1ms delay for SPI to finish transmission
	call delay
	call DATA_ON
	li x15,0x05			#16-bit color , 5-6-5 RGB
	call SPI_WRITE
	li x6 , 20000			# 10ms
	call delay

	call COMMAND_ON
	li x15,ST7735_FRMCTR1
	call SPI_WRITE
	li x6 , 2000			# 1ms
	call delay
	call DATA_ON
	li x15,0x00			#fastest refresh
	call SPI_WRITE
	li x15,0x06			#6 lines front porch
	call SPI_WRITE
	li x15,0x03			#3 lines front porch
	call SPI_WRITE
	li x6 , 20000			# 10ms
	call delay

	call COMMAND_ON
	li x15,ST7735_MADCTL		#Memory access ctrl (directions)
	call SPI_WRITE
	li x6 , 2000			# 1ms
	call delay
	call DATA_ON
	li x15,0xC8			#Row addr/col addr, bottom to top refresh
	call SPI_WRITE
	li x6 , 2000			# 1ms
	call delay
	
	call COMMAND_ON
	li x15,ST7735_DISSET5		#Display settings  no delay:
	call SPI_WRITE
	li x6 , 2000			# 1ms
	call delay
	call DATA_ON
	li x15,0x15			#1 clk cycle nonoverlap, 2 cycle gate rise, 3 cycle osc equalize
	call SPI_WRITE
	li x15,0x02			#Fix on VTL
	call SPI_WRITE
	li x6 , 2000			# 1ms
	call delay

	call COMMAND_ON
	li x15,ST7735_INVCTR		#Display inversion control
	call SPI_WRITE
	li x6 , 2000			# 1ms
	call delay
	call DATA_ON
	li x15,0x00			#Line inversion
	call SPI_WRITE
	li x6 , 2000			# 1ms
	call delay

	call COMMAND_ON
	li x15,ST7735_GMCTRP1		#
	call SPI_WRITE
	li x6 , 2000			# 1ms
	call delay
	call DATA_ON
	li x15,0x09			#
	call SPI_WRITE
	li x15,0x16			#
	call SPI_WRITE
	li x15,0x09			#
	call SPI_WRITE
	li x15,0x20			#
	call SPI_WRITE
	li x15,0x21			#
	call SPI_WRITE
	li x15,0x1B			#
	call SPI_WRITE
	li x15,0x13			#
	call SPI_WRITE
	li x15,0x19			#
	call SPI_WRITE
	li x15,0x17			#
	call SPI_WRITE
	li x15,0x15			#
	call SPI_WRITE
	li x15,0x1E			#
	call SPI_WRITE
	li x15,0x2B			#
	call SPI_WRITE
	li x15,0x04			#
	call SPI_WRITE
	li x15,0x05			#
	call SPI_WRITE
	li x15,0x02			#
	call SPI_WRITE
	li x15,0x0E			#
	call SPI_WRITE
	li x6 , 2000			# 1ms
	call delay
	
	call COMMAND_ON
	li x15,ST7735_GMCTRN1		#
	call SPI_WRITE
	li x6 , 2000			# 1ms
	call delay
	call DATA_ON
	li x15,0x0B			#
	call SPI_WRITE
	li x15,0x14			#
	call SPI_WRITE
	li x15,0x08			#
	call SPI_WRITE
	li x15,0x1E			#
	call SPI_WRITE
	li x15,0x22			#
	call SPI_WRITE
	li x15,0x1D			#
	call SPI_WRITE
	li x15,0x18			#
	call SPI_WRITE
	li x15,0x1E			#
	call SPI_WRITE
	li x15,0x1B			#
	call SPI_WRITE
	li x15,0x1A			#
	call SPI_WRITE
	li x15,0x24			#
	call SPI_WRITE
	li x15,0x2B			#
	call SPI_WRITE
	li x15,0x06			#
	call SPI_WRITE
	li x15,0x06			#
	call SPI_WRITE
	li x15,0x02			#
	call SPI_WRITE
	li x15,0x0F			#
	call SPI_WRITE
	li x6 , 2000			# 1ms
	call delay
#
	call COMMAND_ON
	li x15,ST7735_NORON 		#Normal display on,
	call SPI_WRITE
	li x6 , 20000			# 10ms
	call delay

	call COMMAND_ON
	li x15,ST7735_DISPON 		#Main screen turn on
	call SPI_WRITE
	li x6 ,1000000			# 500ms
	call delay
	lw x15,8(sp)
	lw x6,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret
################################################################################################################
#################################################################################################################
# DRAW_CHAR32, prints default 16x32font. after setting window ,load font address in variable state directly or use subroutine
# select_font , x5 array count,set fontcolor & bgcolor before calling
##################################################################################################################
DRAW_CHAR32:
	addi sp,sp,-28
	sw ra,0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
	sw x5,12(sp)
	sw x7,16(sp)
	sw x4,20(sp)
	sw x6,24(sp)
	li x10,state		# point x10 to variable state which has address of the font
	lw x11,0(x10)		# copy address of font to new pointer x11 from state
	li x5,64		# number of bytes in the font, a font in this code has a 64 byte array, a macro can be developed later
loadbyte:
	beqz x5,font_finish	# check byte counter x5 is equal to 0, if equal branch to font_finish
	li x4,8			# load bit counter x4 with 8 bits
	lbu x7,0(x11)		# load x7 byte from font array
	addi x11,x11,1		# increase x11 to next byte address
	addi x5,x5,-1		# decrease byte counter
#	beqz x5,font_finish
extract:
	andi x6,x7,0x80		# extract the msb by anding with 0x80
	beqz x6,BGW		# if msb is 0 branch to BGW
	call FONT_COLOUR	# if msb is 1 call FONT_COLOUR subroutine to print font
	slli x7,x7,1		# shift x7 left by 1 bit
	addi x4,x4,-1		# decrease bit counter
	bnez x4,extract		# if bit counter is greater than 0 repeat
	j loadbyte		# if x4 is 0 jump to loadbyte to start with another byte
BGW:
	call BG_COLOUR   	# call subroutine BG_COLOUR to print background colour
	slli x7,x7,1		# shift 1 bit left
	addi x4,x4,-1		# reduce bit counter
	bnez x4,extract		# if bit counter is greater than 0 repeat
	j loadbyte		# if x4 is 0 jump to loadbyte to start with another byte
font_finish:
	lw x6,24(sp)
	lw x4,20(sp)
	lw x7,16(sp)
	lw x5,12(sp)
	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,28
	ret

BG_COLOUR:
	addi sp,sp,-16
	sw ra, 0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
	sw x7,12(sp)
	la x11,FONTCOLOR		# point x11 to FONTCOLOR
	la x10,XYCOLOUR			# point x10 to XYCOLOUR
	addi x10,x10,3			# point to byte3 ,colour hi byte stored here
	addi x11,x11,1			# back ground colour hibyte for font stored here
	lb x7,0(x11)
	sb x7,0(x10)			# hi byte
	addi x10,x10,-1
	addi x11,x11,-1
	lb x7,0(x11)
	sb x7,0(x10)			# lo byte
	call TFTpixel
	lw x7,12(sp)
	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,16
	ret


FONT_COLOUR:
	addi sp,sp,-16
	sw ra, 0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
	sw x7,12(sp)
	la x11,FONTCOLOR
	la x10,XYCOLOUR
	addi x10,x10,3			# point to byte3
	addi x11,x11,3			# font colour hibyte for font stored here
	lb x7,0(x11)
	sb x7,0(x10)
	addi x10,x10,-1			# point to byte2
	addi x11,x11,-1			# point to byte2
	lb x7,0(x11)
	sb x7,0(x10)
	call TFTpixel
	lw x7,12(sp)
	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,16
	ret

############################################################################

push_cursor1:
	addi sp,sp,-24
	sw ra,0(sp)
	sw x11,4(sp)
	sw x10,8(sp)
	sw x7,12(sp)
	sw x5,16(sp)
	sw x6,20(sp)
	la x10,XYC		# point x10 to XYC 
	la x11,scratch		# point x11 to scratch
	addi x10,x10,1		# point to x1 XYC, current cursor x1
	lb x7,0(x10)		
	sb x7,0(x11)		# store (oldx1) current cursor x in x0 scratch
	addi x10,x10,-1         # old x0 ,XYC
	lb x5,0(x10)		# load old x0
	sub x5,x7,x5		# width in x5
	add x5,x7,x5		# add width with old x1 to get new x1
	li x6, width		# 128 pixels
	bltu x5,x6,hpush	# if less than 128 pixels branch to hpush
				# reset x to 0 and increase y by height of font
	addi x10,x10,3		#old y1
	lb x7,0(x10)		# loa old y1
	addi x11,x11,2		# store in x11 new y0
	sb x7,0(x11)		# store new y0
	addi x10,x10,-1		#y0
	lb x5,0(x10)		#old y0
	sub x5,x7,x5		#old y1-y0 = height
	add x5,x7,x5		# new y0 + height = new y1
	li x6,height		# 160 pixels
	bltu x5,x6,vpush	# if height less than 160 pixels branch  to vpush
	
	lb x5,0(x10)		# old y0
	addi x10,x10,1		# point to old y1 in XYC
	lb x7,0(x10)		# old y1
	sub x5,x7,x5		# y1-y0 = height
	addi x11,x11,1          # new y1
	sb x5,0(x11)		# new y1
	li x7,0
	addi x11,x11,-1		# new y0
	sb x7,0(x11)            # new y0 , Y coordinate becomes y0= 0 ,y1 = heigt of font
	
	addi x10,x10,-3         # old x0
	lb x5,0(x10)
	addi x10,x10,1		# old x1
	lb x7,0(x10)
	sub x5,x7,x5		# x1-x0 = width
	addi x11,x11,-1		# new x1
	sb x5,0(x11)		# new x1
	addi x11,x11,-1		# new x0
	sb x0,0(x11)
	
	j outout
			
vpush:					
	addi x11,x11,1		# point to new y1
	sb x5,0(x11)		# new y1 = (old y1-y0) + old y1
	li x7,0			# 0 for x0 as new line write starts at 0
	addi x11,x11,-3		# point to new x0
	sb x7,0(x11)		# new x0 has value 0 pixel
	addi x10,x10,-1		# x10 points to old x1
	lb x7,0(x10)		# load old x1
	addi x10,x10,-1		# point to old x0
	lb x5,0(x10)		# load old x0
	sub x5,x7,x5		# x1-x0 = width of font
	addi x11,x11,1		# point to new x1
	sb x5,0(x11)		# store width in new x1 , 0,width will be new x coordinates
	j outout
hpush:
	addi x11,x11,1		# point to new x1
	sb x5,0(x11)		#
	addi x11,x11,1		# y0
	addi x10,x10,2		# y0
	lb x7,0(x10)		# old y0
	sb x7,0(x11)		# new y0
	addi x11,x11,1		# y1
	addi x10,x10,1		# y1
	lb x7,0(x10)		# old y1
	sb x7,0(x11)		# new y1
	
outout:
	la x11,scratch
	la x10,XYC
	lw x7,0(x11)
	sw x7,0(x10)
	call setTFTwindow
	lw x6,20(sp)
	lw x5,16(sp)
	lw x7,12(sp)
	lw x10,8(sp)
	lw x11,4(sp)
	lw ra,0(sp)
	addi sp,sp,24
	ret

##############################################################################
# call select font with ascii char in x15, will store address of font in state
##############################################################################
select_font:
	addi sp,sp,-16
	sw ra,0(sp)
	sw x7,4(sp)
	sw x10,8(sp)
	sw x11,12(sp)
	la x10,space		# load address of 1st font "space"
	li x7,0x20		# ascii space
	sub x7,x15,x7		# difference between 1st char of list and requested font in x15
	beqz x7,loadfont
searchfont:
	addi x10,x10,64
	addi x7,x7,-1
	bnez x7,searchfont
loadfont:
	la x11,state
	sw x10,0(x11)		# store address of font in X10 to "state" which will be used by DRAW_CHAR32
	lw x11,12(sp)
	lw x10,8(sp)
	lw x7,4(sp)
	lw ra,0(sp)
	addi sp,sp,16
	ret

#########################################################################################


############################################################################
.section .rodata
.global CONSTANTS

name: .string "SAJEEV SANKARAN CH32V003 UART"
eol: .byte 0x0d,0x0a,0x00

.align 4

line1: .word 0x640a0a0a   
color1: .word 0xf8000000


############################################################################
.section .rodata
.global font1632

#    * code=32, hex=0x20, ascii=" "
space:
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */


#     * code=33, hex=0x21, ascii="!"
exclaim:
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x03,0xC0 #,  /* 0000001111000000 */
.byte    0x07,0xE0 #,  /* 0000011111100000 */
.byte    0x0F,0xF0 #,  /* 0000111111110000 */
.byte    0x0F,0xF0 #,  /* 0000111111110000 */
.byte    0x0F,0xF0 #,  /* 0000111111110000 */
.byte    0x0F,0xF0 #,  /* 0000111111110000 */
.byte    0x0F,0xF0 #,  /* 0000111111110000 */
.byte    0x0F,0xF0 #,  /* 0000111111110000 */
.byte    0x07,0xE0 #,  /* 0000011111100000 */
.byte    0x07,0xE0 #,  /* 0000011111100000 */
.byte    0x07,0xE0 #,  /* 0000011111100000 */
.byte    0x03,0xC0 #,  /* 0000001111000000 */
.byte    0x03,0xC0 #,  /* 0000001111000000 */
.byte    0x03,0xC0 #,  /* 0000001111000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x03,0xC0 #,  /* 0000001111000000 */
.byte    0x03,0xC0 #,  /* 0000001111000000 */
.byte    0x03,0xC0 #,  /* 0000001111000000 */
.byte    0x03,0xC0 #,  /* 0000001111000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */
.byte    0x00,0x00 #,  /* 0000000000000000 */


#     * code=34, hex=0x22, ascii="""
dq:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x3C,0x3C  #,  /* 0011110000111100 */
.byte    0x3C,0x3C  #,  /* 0011110000111100 */
.byte    0x3C,0x3C  #,  /* 0011110000111100 */
.byte    0x3C,0x3C  #,  /* 0011110000111100 */
.byte    0x3C,0x3C  #,  /* 0011110000111100 */
.byte    0x1C,0x38  #,  /* 0001110000111000 */
.byte    0x0C,0x30  #,  /* 0000110000110000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=35, hex=0x23, ascii="#"
hash:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#    * code=36, hex=0x24, ascii="$"
dollar:
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x3F,0xF0  #,  /* 0011111111110000 */
.byte    0x7F,0xF8  #,  /* 0111111111111000 */
.byte    0xF8,0x7C  #,  /* 1111100001111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xF0,0x1C  #,  /* 1111000000011100 */
.byte    0xF0,0x00  #,  /* 1111000000000000 */
.byte    0xF0,0x00  #,  /* 1111000000000000 */
.byte    0xF8,0x00  #,  /* 1111100000000000 */
.byte    0x7F,0xF0  #,  /* 0111111111110000 */
.byte    0x3F,0xF8  #,  /* 0011111111111000 */
.byte    0x00,0x7C  #,  /* 0000000001111100 */
.byte    0x00,0x3C  #,  /* 0000000000111100 */
.byte    0x00,0x3C  #,  /* 0000000000111100 */
.byte    0x00,0x3C  #,  /* 0000000000111100 */
.byte    0x00,0x3C  #,  /* 0000000000111100 */
.byte    0xE0,0x3C  #,  /* 1110000000111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xF8,0x7C  #,  /* 1111100001111100 */
.byte    0x7F,0xF8  #,  /* 0111111111111000 */
.byte    0x3F,0xF0  #,  /* 0011111111110000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=37, hex=0x25, ascii="%"
percentage:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x78,0x78  #,  /* 0111100001111000 */
.byte    0xFC,0x78  #,  /* 1111110001111000 */
.byte    0xCC,0xF0  #,  /* 1100110011110000 */
.byte    0xCC,0xF0  #,  /* 1100110011110000 */
.byte    0xFD,0xE0  #,  /* 1111110111100000 */
.byte    0x79,0xE0  #,  /* 0111100111100000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x1E,0x78  #,  /* 0001111001111000 */
.byte    0x1E,0xFC  #,  /* 0001111011111100 */
.byte    0x3C,0xCC  #,  /* 0011110011001100 */
.byte    0x3C,0xCC  #,  /* 0011110011001100 */
.byte    0x78,0xFC  #,  /* 0111100011111100 */
.byte    0x78,0x78  #,  /* 0111100001111000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=38, hex=0x26, ascii="&"
and:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x0F,0xC0  #,  /* 0000111111000000 */
.byte    0x1F,0xE0  #,  /* 0001111111100000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x1D,0xE0  #,  /* 0001110111100000 */
.byte    0x1F,0xC0  #,  /* 0001111111000000 */
.byte    0x3F,0x1C  #,  /* 0011111100011100 */
.byte    0x7F,0xBC  #,  /* 0111111110111100 */
.byte    0xFB,0xF8  #,  /* 1111101111111000 */
.byte    0xF1,0xF0  #,  /* 1111000111110000 */
.byte    0xF0,0xF0  #,  /* 1111000011110000 */
.byte    0xF0,0xE0  #,  /* 1111000011100000 */
.byte    0xF0,0xE0  #,  /* 1111000011100000 */
.byte    0xF0,0xE0  #,  /* 1111000011100000 */
.byte    0xF0,0xF0  #,  /* 1111000011110000 */
.byte    0xF9,0xF0  #,  /* 1111100111110000 */
.byte    0x7F,0xF8  #,  /* 0111111111111000 */
.byte    0x3F,0x3C  #,  /* 0011111100111100 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=39, hex=0x27, ascii="'"
ucoma:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x1F,0x00  #,  /* 0001111100000000 */
.byte    0x3E,0x00  #,  /* 0011111000000000 */
.byte    0x3C,0x00  #,  /* 0011110000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=40, hex=0x28, ascii="("
obracket:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x70  #,  /* 0000000001110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x01,0xE0  #,  /* 0000000111100000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x01,0xE0  #,  /* 0000000111100000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0x70  #,  /* 0000000001110000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=41, hex=0x29, ascii=")"
cbracket:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x0E,0x00  #,  /* 0000111000000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x01,0xE0  #,  /* 0000000111100000 */
.byte    0x01,0xE0  #,  /* 0000000111100000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x01,0xE0  #,  /* 0000000111100000 */
.byte    0x01,0xE0  #,  /* 0000000111100000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0E,0x00  #,  /* 0000111000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=42, hex=0x2A, ascii="*"
asterix:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x38,0x70  #,  /* 0011100001110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x1F,0xE0  #,  /* 0001111111100000 */
.byte    0x0F,0xC0  #,  /* 0000111111000000 */
.byte    0x7F,0xF8  #,  /* 0111111111111000 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0x7F,0xF8  #,  /* 0111111111111000 */
.byte    0x0F,0xC0  #,  /* 0000111111000000 */
.byte    0x1F,0xE0  #,  /* 0001111111100000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x38,0x70  #,  /* 0011100001110000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=43, hex=0x2B, ascii="+"
plus:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x7F,0xF8  #,  /* 0111111111111000 */
.byte    0x7F,0xF8  #,  /* 0111111111111000 */
.byte    0x7F,0xF8  #,  /* 0111111111111000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=44, hex=0x2C, ascii=","
coma:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x07,0xC0  #,  /* 0000011111000000 */
.byte    0x0F,0x80  #,  /* 0000111110000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=45, hex=0x2D, ascii="-"
minus:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=46, hex=0x2E, ascii="."
period:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=47, hex=0x2F, ascii="/"
fslash:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x3C  #,  /* 0000000000111100 */
.byte    0x00,0x3C  #,  /* 0000000000111100 */
.byte    0x00,0x78  #,  /* 0000000001111000 */
.byte    0x00,0x78  #,  /* 0000000001111000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x01,0xE0  #,  /* 0000000111100000 */
.byte    0x01,0xE0  #,  /* 0000000111100000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x1E,0x00  #,  /* 0001111000000000 */
.byte    0x1E,0x00  #,  /* 0001111000000000 */
.byte    0x3C,0x00  #,  /* 0011110000000000 */
.byte    0x3C,0x00  #,  /* 0011110000000000 */
.byte    0x78,0x00  #,  /* 0111100000000000 */
.byte    0x78,0x00  #,  /* 0111100000000000 */
.byte    0xF0,0x00  #,  /* 1111000000000000 */
.byte    0xF0,0x00  #,  /* 1111000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=48, hex=0x30, ascii="0"
zero:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7C,0xF8  #,  /* 0111110011111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF7,0xBC  #,  /* 1111011110111100 */
.byte     0xF7,0xBC  #,  /* 1111011110111100 */
.byte     0xF7,0xBC  #,  /* 1111011110111100 */
.byte     0xF7,0xBC  #,  /* 1111011110111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7C,0xF8  #,  /* 0111110011111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */



#     * code=49, hex=0x31, ascii="1"
one:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x07,0xC0  #,  /* 0000011111000000 */
.byte     0x0F,0xC0  #,  /* 0000111111000000 */
.byte     0x1F,0xC0  #,  /* 0001111111000000 */
.byte     0x3F,0xC0  #,  /* 0011111111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x3F,0xFC  #,  /* 0011111111111100 */
.byte     0x3F,0xFC  #,  /* 0011111111111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=50, hex=0x32, ascii="2"
two:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xE0,0x3C  #,  /* 1110000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x7C  #,  /* 0000000001111100 */
.byte     0x00,0xF8  #,  /* 0000000011111000 */
.byte     0x01,0xF0  #,  /* 0000000111110000 */
.byte     0x03,0xE0  #,  /* 0000001111100000 */
.byte     0x07,0xC0  #,  /* 0000011111000000 */
.byte     0x0F,0x80  #,  /* 0000111110000000 */
.byte     0x1F,0x00  #,  /* 0001111100000000 */
.byte     0x3E,0x00  #,  /* 0011111000000000 */
.byte     0x7C,0x00  #,  /* 0111110000000000 */
.byte     0xF8,0x00  #,  /* 1111100000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=51, hex=0x33, ascii="3"
three:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x78  #,  /* 0000000001111000 */
.byte     0x0F,0xF0  #,  /* 0000111111110000 */
.byte     0x0F,0xF0  #,  /* 0000111111110000 */
.byte     0x00,0x78  #,  /* 0000000001111000 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=52, hex=0x34, ascii="4"
four:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x01,0xF0  #,  /* 0000000111110000 */
.byte     0x03,0xF0  #,  /* 0000001111110000 */
.byte     0x07,0xF0  #,  /* 0000011111110000 */
.byte     0x0F,0xF0  #,  /* 0000111111110000 */
.byte     0x1F,0xF0  #,  /* 0001111111110000 */
.byte     0x3E,0xF0  #,  /* 0011111011110000 */
.byte     0x7C,0xF0  #,  /* 0111110011110000 */
.byte     0xF8,0xF0  #,  /* 1111100011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x03,0xFC  #,  /* 0000001111111100 */
.byte     0x03,0xFC  #,  /* 0000001111111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=53, hex=0x35, ascii="5"
five:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xFF,0xF0  #,  /* 1111111111110000 */
.byte     0xFF,0xF8  #,  /* 1111111111111000 */
.byte     0x00,0x7C  #,  /* 0000000001111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */

 
#     * code=54, hex=0x36, ascii="6"
six:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x0F,0xF0  #,  /* 0000111111110000 */
.byte     0x1F,0xF0  #,  /* 0001111111110000 */
.byte     0x3E,0x00  #,  /* 0011111000000000 */
.byte     0x7C,0x00  #,  /* 0111110000000000 */
.byte     0xF8,0x00  #,  /* 1111100000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xFF,0xF0  #,  /* 1111111111110000 */
.byte     0xFF,0xF8  #,  /* 1111111111111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=55, hex=0x37, ascii="7"
seven:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x7C  #,  /* 0000000001111100 */
.byte     0x00,0xF8  #,  /* 0000000011111000 */
.byte     0x01,0xF0  #,  /* 0000000111110000 */
.byte     0x03,0xE0  #,  /* 0000001111100000 */
.byte     0x07,0xC0  #,  /* 0000011111000000 */
.byte     0x0F,0x80  #,  /* 0000111110000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=56, hex=0x38, ascii="8"
eight:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0x78,0x78  #,  /* 0111100001111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x78,0x78  #,  /* 0111100001111000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=57, hex=0x39, ascii="9"
nine:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7F,0xFC  #,  /* 0111111111111100 */
.byte     0x3F,0xFC  #,  /* 0011111111111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x7C  #,  /* 0000000001111100 */
.byte     0x00,0xF8  #,  /* 0000000011111000 */
.byte     0x01,0xF0  #,  /* 0000000111110000 */
.byte     0x3F,0xE0  #,  /* 0011111111100000 */
.byte     0x3F,0xC0  #,  /* 0011111111000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */

   



#     * code=58, hex=0x3A, ascii=":"
colon:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=59, hex=0x3B, ascii=";"
semicolon:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x07,0xC0  #,  /* 0000011111000000 */
.byte    0x0F,0x80  #,  /* 0000111110000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=60, hex=0x3C, ascii="<"
lessthan:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x3C  #,  /* 0000000000111100 */
.byte    0x00,0x7C  #,  /* 0000000001111100 */
.byte    0x00,0xF8  #,  /* 0000000011111000 */
.byte    0x01,0xF0  #,  /* 0000000111110000 */
.byte    0x03,0xE0  #,  /* 0000001111100000 */
.byte    0x07,0xC0  #,  /* 0000011111000000 */
.byte    0x0F,0x80  #,  /* 0000111110000000 */
.byte    0x1F,0x00  #,  /* 0001111100000000 */
.byte    0x3E,0x00  #,  /* 0011111000000000 */
.byte    0x3E,0x00  #,  /* 0011111000000000 */
.byte    0x1F,0x00  #,  /* 0001111100000000 */
.byte    0x0F,0x80  #,  /* 0000111110000000 */
.byte    0x07,0xC0  #,  /* 0000011111000000 */
.byte    0x03,0xE0  #,  /* 0000001111100000 */
.byte    0x01,0xF0  #,  /* 0000000111110000 */
.byte    0x00,0xF8  #,  /* 0000000011111000 */
.byte    0x00,0x7C  #,  /* 0000000001111100 */
.byte    0x00,0x3C  #,  /* 0000000000111100 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=61, hex=0x3D, ascii="="
equal:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=62, hex=0x3E, ascii=">"
greaterthan:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x3C,0x00  #,  /* 0011110000000000 */
.byte    0x3E,0x00  #,  /* 0011111000000000 */
.byte    0x1F,0x00  #,  /* 0001111100000000 */
.byte    0x0F,0x80  #,  /* 0000111110000000 */
.byte    0x07,0xC0  #,  /* 0000011111000000 */
.byte    0x03,0xE0  #,  /* 0000001111100000 */
.byte    0x01,0xF0  #,  /* 0000000111110000 */
.byte    0x00,0xF8  #,  /* 0000000011111000 */
.byte    0x00,0x7C  #,  /* 0000000001111100 */
.byte    0x00,0x7C  #,  /* 0000000001111100 */
.byte    0x00,0xF8  #,  /* 0000000011111000 */
.byte    0x01,0xF0  #,  /* 0000000111110000 */
.byte    0x03,0xE0  #,  /* 0000001111100000 */
.byte    0x07,0xC0  #,  /* 0000011111000000 */
.byte    0x0F,0x80  #,  /* 0000111110000000 */
.byte    0x1F,0x00  #,  /* 0001111100000000 */
.byte    0x3E,0x00  #,  /* 0011111000000000 */
.byte    0x3C,0x00  #,  /* 0011110000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=63, hex=0x3F, ascii="?"
question:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x3F,0xF0  #,  /* 0011111111110000 */
.byte    0x7F,0xF8  #,  /* 0111111111111000 */
.byte    0xF8,0x7C  #,  /* 1111100001111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0x00,0x3C  #,  /* 0000000000111100 */
.byte    0x00,0x7C  #,  /* 0000000001111100 */
.byte    0x00,0xF8  #,  /* 0000000011111000 */
.byte    0x01,0xF0  #,  /* 0000000111110000 */
.byte    0x03,0xE0  #,  /* 0000001111100000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=64, hex=0x40, ascii="@"
amperesand:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x3F,0xF0  #,  /* 0011111111110000 */
.byte    0x7F,0xF8  #,  /* 0111111111111000 */
.byte    0xF8,0x7C  #,  /* 1111100001111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xF1,0xFC  #,  /* 1111000111111100 */
.byte    0xF3,0xFC  #,  /* 1111001111111100 */
.byte    0xF3,0xFC  #,  /* 1111001111111100 */
.byte    0xF3,0xFC  #,  /* 1111001111111100 */
.byte    0xF3,0xFC  #,  /* 1111001111111100 */
.byte    0xF3,0xFC  #,  /* 1111001111111100 */
.byte    0xF3,0xF0  #,  /* 1111001111110000 */
.byte    0xF1,0xF0  #,  /* 1111000111110000 */
.byte    0xF0,0x00  #,  /* 1111000000000000 */
.byte    0xF8,0x00  #,  /* 1111100000000000 */
.byte    0x7F,0xF0  #,  /* 0111111111110000 */
.byte    0x3F,0xF0  #,  /* 0011111111110000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */



#    * code=65, hex=0x41, ascii="A"
A:
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x03,0x00  #/* 0000001100000000 */
.byte     0x07,0x80  #/* 0000011110000000 */
.byte     0x0F,0xC0  #/* 0000111111000000 */
.byte     0x1F,0xE0  #/* 0001111111100000 */
.byte     0x3F,0xF0  #/* 0011111111110000 */
.byte     0x7C,0xF8  #/* 0111110011111000 */
.byte     0xF8,0x7C  #/* 1111100001111100 */
.byte     0xF0,0x3C  #/* 1111000000111100 */
.byte     0xF0,0x3C  #/* 1111000000111100 */
.byte     0xF0,0x3C  #/* 1111000000111100 */
.byte     0xFF,0xFC  #/* 1111111111111100 */
.byte     0xFF,0xFC  #/* 1111111111111100 */
.byte     0xF0,0x3C  #/* 1111000000111100 */
.byte     0xF0,0x3C  #/* 1111000000111100 */
.byte     0xF0,0x3C  #/* 1111000000111100 */
.byte     0xF0,0x3C  #/* 1111000000111100 */
.byte     0xF0,0x3C  #/* 1111000000111100 */
.byte     0xF0,0x3C  #/* 1111000000111100 */
.byte     0xF0,0x3C  #/* 1111000000111100 */
.byte     0xF0,0x3C  #/* 1111000000111100 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */


#     * code=66, hex=0x42, ascii="B"
B:
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0xFF,0xF0  #/* 1111111111110000 */
.byte     0xFF,0xF8  #/* 1111111111111000 */
.byte     0x3C,0x7C  #/* 0011110001111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x78  #/* 0011110001111000 */
.byte     0x3F,0xF0  #/* 0011111111110000 */
.byte     0x3F,0xF0  #/* 0011111111110000 */
.byte     0x3C,0x78  #/* 0011110001111000 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x7C  #/* 0011110001111100 */
.byte     0xFF,0xF8  #/* 1111111111111000 */
.byte     0xFF,0xF0  #/* 1111111111110000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */


#     * code=67, hex=0x43, ascii="C"
C: 
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x1F,0xF0  #/* 0001111111110000 */
.byte     0x3F,0xF8  #/* 0011111111111000 */
.byte     0x7C,0x7C  #/* 0111110001111100 */
.byte     0xF8,0x3C  #/* 1111100000111100 */
.byte     0xF0,0x1C  #/* 1111000000011100 */
.byte     0xF0,0x00  #/* 1111000000000000 */
.byte     0xF0,0x00  #/* 1111000000000000 */
.byte     0xF0,0x00  #/* 1111000000000000 */
.byte     0xF0,0x00  #/* 1111000000000000 */
.byte     0xF0,0x00  #/* 1111000000000000 */
.byte     0xF0,0x00  #/* 1111000000000000 */
.byte     0xF0,0x00  #/* 1111000000000000 */
.byte     0xF0,0x00  #/* 1111000000000000 */
.byte     0xF0,0x00  #/* 1111000000000000 */
.byte     0xF0,0x00  #/* 1111000000000000 */
.byte     0xF0,0x1C  #/* 1111000000011100 */
.byte     0xF8,0x3C  #/* 1111100000111100 */
.byte     0x7C,0x7C  #/* 0111110001111100 */
.byte     0x3F,0xF8  #/* 0011111111111000 */
.byte     0x1F,0xF0  #/* 0001111111110000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */


#     * code=68, hex=0x44, ascii="D"
D:
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0xFF,0xC0  #/* 1111111111000000 */
.byte     0xFF,0xE0  #/* 1111111111100000 */
.byte     0x3C,0xF0  #/* 0011110011110000 */
.byte     0x3C,0x78  #/* 0011110001111000 */
.byte     0x3C,0x78  #/* 0011110001111000 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x78  #/* 0011110001111000 */
.byte     0x3C,0x78  #/* 0011110001111000 */
.byte     0x3C,0xF0  #/* 0011110011110000 */
.byte     0xFF,0xE0  #/* 1111111111100000 */
.byte     0xFF,0xC0  #/* 1111111111000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */


#     * code=69, hex=0x45, ascii="E"
E:
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0xFF,0xFC  #/* 1111111111111100 */
.byte     0xFF,0xFC  #/* 1111111111111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x1C  #/* 0011110000011100 */
.byte     0x3C,0x0C  #/* 0011110000001100 */
.byte     0x3C,0x00  #/* 0011110000000000 */
.byte     0x3C,0xC0  #/* 0011110011000000 */
.byte     0x3C,0xC0  #/* 0011110011000000 */
.byte     0x3F,0xC0  #/* 0011111111000000 */
.byte     0x3F,0xC0  #/* 0011111111000000 */
.byte     0x3C,0xC0  #/* 0011110011000000 */
.byte     0x3C,0xC0  #/* 0011110011000000 */
.byte     0x3C,0x00  #/* 0011110000000000 */
.byte     0x3C,0x00  #/* 0011110000000000 */
.byte     0x3C,0x00  #/* 0011110000000000 */
.byte     0x3C,0x0C  #/* 0011110000001100 */
.byte     0x3C,0x1C  #/* 0011110000011100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0xFF,0xFC  #/* 1111111111111100 */
.byte     0xFF,0xFC  #/* 1111111111111100 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */


#     * code=70, hex=0x46, ascii="F"
F:
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0xFF,0xFC  #/* 1111111111111100 */
.byte     0xFF,0xFC  #/* 1111111111111100 */
.byte     0x3C,0x3C  #/* 0011110000111100 */
.byte     0x3C,0x1C  #/* 0011110000011100 */
.byte     0x3C,0x0C  #/* 0011110000001100 */
.byte     0x3C,0x00  #/* 0011110000000000 */
.byte     0x3C,0xC0  #/* 0011110011000000 */
.byte     0x3C,0xC0  #/* 0011110011000000 */
.byte     0x3F,0xC0  #/* 0011111111000000 */
.byte     0x3F,0xC0  #/* 0011111111000000 */
.byte     0x3C,0xC0  #/* 0011110011000000 */
.byte     0x3C,0xC0  #/* 0011110011000000 */
.byte     0x3C,0x00  #/* 0011110000000000 */
.byte     0x3C,0x00  #/* 0011110000000000 */
.byte     0x3C,0x00  #/* 0011110000000000 */
.byte     0x3C,0x00  #/* 0011110000000000 */
.byte     0x3C,0x00  #/* 0011110000000000 */
.byte     0x3C,0x00  #/* 0011110000000000 */
.byte     0xFF,0x00  #/* 1111111100000000 */
.byte     0xFF,0x00  #/* 1111111100000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */
.byte     0x00,0x00  #/* 0000000000000000 */


#     * code=71, hex=0x47, ascii="G"
G:
.byte     0x00,0x00  #  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x1F,0xF0  #,  /* 0001111111110000 */
.byte     0x3F,0xF8  #,  /* 0011111111111000 */
.byte     0x7C,0x7C  #,  /* 0111110001111100 */
.byte     0xF8,0x3C  #,  /* 1111100000111100 */
.byte     0xF0,0x1C  #,  /* 1111000000011100 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF1,0xFC  #,  /* 1111000111111100 */
.byte     0xF1,0xFC  #,  /* 1111000111111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x3C  #,  /* 1111100000111100 */
.byte     0x7C,0x7C  #,  /* 0111110001111100 */
.byte     0x3F,0xFC  #,  /* 0011111111111100 */
.byte     0x1F,0xEC  #,  /* 0001111111101100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=72, hex=0x48, ascii="H"
H:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#   * code=73, hex=0x49, ascii="I"
I:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=74, hex=0x4A, ascii="J"
J:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x03,0xFC  #,  /* 0000001111111100 */
.byte     0x03,0xFC  #,  /* 0000001111111100 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF9,0xF0  #,  /* 1111100111110000 */
.byte     0x7F,0xE0  #,  /* 0111111111100000 */
.byte     0x3F,0xC0  #,  /* 0011111111000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=75, hex=0x4B, ascii="K"
K: 
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFC,0x3C  #,  /* 1111110000111100 */
.byte     0xFC,0x3C  #,  /* 1111110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x7C  #,  /* 0011110001111100 */
.byte     0x3C,0xF8  #,  /* 0011110011111000 */
.byte     0x3D,0xF0  #,  /* 0011110111110000 */
.byte     0x3F,0xE0  #,  /* 0011111111100000 */
.byte     0x3F,0xC0  #,  /* 0011111111000000 */
.byte     0x3F,0xC0  #,  /* 0011111111000000 */
.byte     0x3F,0xE0  #,  /* 0011111111100000 */
.byte     0x3D,0xF0  #,  /* 0011110111110000 */
.byte     0x3C,0xF8  #,  /* 0011110011111000 */
.byte     0x3C,0x7C  #,  /* 0011110001111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0xFC,0x3C  #,  /* 1111110000111100 */
.byte     0xFC,0x3C  #,  /* 1111110000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=76, hex=0x4C, ascii="L"
L:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFF,0x00  #,  /* 1111111100000000 */
.byte     0xFF,0x00  #,  /* 1111111100000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x0C  #,  /* 0011110000001100 */
.byte     0x3C,0x1C  #,  /* 0011110000011100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=77, hex=0x4D, ascii="M"
M:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xFC,0xFC  #,  /* 1111110011111100 */
.byte     0xFC,0xFC  #,  /* 1111110011111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xF7,0xBC  #,  /* 1111011110111100 */
.byte     0xF7,0xBC  #,  /* 1111011110111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=78, hex=0x4E, ascii="N"
N:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x3C  #,  /* 1111100000111100 */
.byte     0xF8,0x3C  #,  /* 1111100000111100 */
.byte     0xFC,0x3C  #,  /* 1111110000111100 */
.byte     0xFC,0x3C  #,  /* 1111110000111100 */
.byte     0xFE,0x3C  #,  /* 1111111000111100 */
.byte     0xFE,0x3C  #,  /* 1111111000111100 */
.byte     0xFF,0x3C  #,  /* 1111111100111100 */
.byte     0xFF,0x3C  #,  /* 1111111100111100 */
.byte     0xF7,0xBC  #,  /* 1111011110111100 */
.byte     0xF7,0xBC  #,  /* 1111011110111100 */
.byte     0xF3,0xFC  #,  /* 1111001111111100 */
.byte     0xF3,0xFC  #,  /* 1111001111111100 */
.byte     0xF1,0xFC  #,  /* 1111000111111100 */
.byte     0xF1,0xFC  #,  /* 1111000111111100 */
.byte     0xF0,0xFC  #,  /* 1111000011111100 */
.byte     0xF0,0xFC  #,  /* 1111000011111100 */
.byte     0xF0,0x7C  #,  /* 1111000001111100 */
.byte     0xF0,0x7C  #,  /* 1111000001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=79, hex=0x4F, ascii="O"
O:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=80, hex=0x50, ascii="P"
P:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFF,0xF0  #,  /* 1111111111110000 */
.byte     0xFF,0xF8  #,  /* 1111111111111000 */
.byte     0x3C,0x7C  #,  /* 0011110001111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x7C  #,  /* 0011110001111100 */
.byte     0x3F,0xF8  #,  /* 0011111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0xFF,0x00  #,  /* 1111111100000000 */
.byte     0xFF,0x00  #,  /* 1111111100000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=81, hex=0x51, ascii="Q"
Q:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0xBC  #,  /* 1111001110111100 */
.byte     0xF3,0xFC  #,  /* 1111001111111100 */
.byte     0xF9,0xFC  #,  /* 1111100111111100 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0xE0  #,  /* 0000000011100000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0x7C  #,  /* 0000000001111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=82, hex=0x52, ascii="R"
R:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFF,0xF0  #,  /* 1111111111110000 */
.byte     0xFF,0xF8  #,  /* 1111111111111000 */
.byte     0x3C,0x7C  #,  /* 0011110001111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x7C  #,  /* 0011110001111100 */
.byte     0x3F,0xF8  #,  /* 0011111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x3F,0xE0  #,  /* 0011111111100000 */
.byte     0x3D,0xF0  #,  /* 0011110111110000 */
.byte     0x3C,0xF8  #,  /* 0011110011111000 */
.byte     0x3C,0x7C  #,  /* 0011110001111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0xFC,0x3C  #,  /* 1111110000111100 */
.byte     0xFC,0x3C  #,  /* 1111110000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=83, hex=0x53, ascii="S"
S:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0x78,0x00  #,  /* 0111100000000000 */
.byte     0x3F,0x00  #,  /* 0011111100000000 */
.byte     0x0F,0xC0  #,  /* 0000111111000000 */
.byte     0x03,0xF0  #,  /* 0000001111110000 */
.byte     0x00,0x78  #,  /* 0000000001111000 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=84, hex=0x54, ascii="T"
T:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xC7,0x8C  #,  /* 1100011110001100 */
.byte     0xC7,0x8C  #,  /* 1100011110001100 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=85, hex=0x55, ascii="U"
U:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=86, hex=0x56, ascii="V"
V:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7C,0xF8  #,  /* 0111110011111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x0F,0xC0  #,  /* 0000111111000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x03,0x00  #,  /* 0000001100000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=87, hex=0x57, ascii="W"
W:   
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF7,0xBC  #,  /* 1111011110111100 */
.byte     0xF7,0xBC  #,  /* 1111011110111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0x7C,0xF8  #,  /* 0111110011111000 */
.byte     0x7C,0xF8  #,  /* 0111110011111000 */
.byte     0x38,0x70  #,  /* 0011100001110000 */
.byte     0x38,0x70  #,  /* 0011100001110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=88, hex=0x58, ascii="X"
X:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0x78,0x78  #,  /* 0111100001111000 */
.byte     0x78,0x78  #,  /* 0111100001111000 */
.byte     0x3C,0xF0  #,  /* 0011110011110000 */
.byte     0x3C,0xF0  #,  /* 0011110011110000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x0F,0xC0  #,  /* 0000111111000000 */
.byte     0x0F,0xC0  #,  /* 0000111111000000 */
.byte     0x0F,0xC0  #,  /* 0000111111000000 */
.byte     0x0F,0xC0  #,  /* 0000111111000000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x3C,0xF0  #,  /* 0011110011110000 */
.byte     0x3C,0xF0  #,  /* 0011110011110000 */
.byte     0x78,0x78  #,  /* 0111100001111000 */
.byte     0x78,0x78  #,  /* 0111100001111000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=89, hex=0x59, ascii="Y"
Y:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3E,0x7C  #,  /* 0011111001111100 */
.byte     0x1F,0xF8  #,  /* 0001111111111000 */
.byte     0x0F,0xF0  #,  /* 0000111111110000 */
.byte     0x07,0xE0  #,  /* 0000011111100000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x0F,0xF0  #,  /* 0000111111110000 */
.byte     0x0F,0xF0  #,  /* 0000111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=90, hex=0x5A, ascii="Z"
Z:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xE0,0x3C  #,  /* 1110000000111100 */
.byte     0xC0,0x3C  #,  /* 1100000000111100 */
.byte     0x00,0x7C  #,  /* 0000000001111100 */
.byte     0x00,0xF8  #,  /* 0000000011111000 */
.byte     0x01,0xF0  #,  /* 0000000111110000 */
.byte     0x03,0xE0  #,  /* 0000001111100000 */
.byte     0x07,0xC0  #,  /* 0000011111000000 */
.byte     0x0F,0x80  #,  /* 0000111110000000 */
.byte     0x1F,0x00  #,  /* 0001111100000000 */
.byte     0x3E,0x00  #,  /* 0011111000000000 */
.byte     0x7C,0x00  #,  /* 0111110000000000 */
.byte     0xF8,0x00  #,  /* 1111100000000000 */
.byte     0xF0,0x0C  #,  /* 1111000000001100 */
.byte     0xF0,0x1C  #,  /* 1111000000011100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */




#     * code=91, hex=0x5B, ascii="["
sqbracketo:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x0F,0xF0  #,  /* 0000111111110000 */
.byte    0x0F,0xF0  #,  /* 0000111111110000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0xF0  #,  /* 0000111111110000 */
.byte    0x0F,0xF0  #,  /* 0000111111110000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=92, hex=0x5C, ascii="\"
backslash:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0xF0,0x00  #,  /* 1111000000000000 */
.byte    0xF0,0x00  #,  /* 1111000000000000 */
.byte    0x78,0x00  #,  /* 0111100000000000 */
.byte    0x78,0x00  #,  /* 0111100000000000 */
.byte    0x3C,0x00  #,  /* 0011110000000000 */
.byte    0x3C,0x00  #,  /* 0011110000000000 */
.byte    0x1E,0x00  #,  /* 0001111000000000 */
.byte    0x1E,0x00  #,  /* 0001111000000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x01,0xE0  #,  /* 0000000111100000 */
.byte    0x01,0xE0  #,  /* 0000000111100000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0x78  #,  /* 0000000001111000 */
.byte    0x00,0x78  #,  /* 0000000001111000 */
.byte    0x00,0x3C  #,  /* 0000000000111100 */
.byte    0x00,0x3C  #,  /* 0000000000111100 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=93, hex=0x5D, ascii="]"
sqbracketc:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x0F,0xF0  #,  /* 0000111111110000 */
.byte    0x0F,0xF0  #,  /* 0000111111110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x00,0xF0  #,  /* 0000000011110000 */
.byte    0x0F,0xF0  #,  /* 0000111111110000 */
.byte    0x0F,0xF0  #,  /* 0000111111110000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=94, hex=0x5E, ascii="^"
power:
.byte    0x03,0x00  #,  /* 0000001100000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x0F,0xC0  #,  /* 0000111111000000 */
.byte    0x1F,0xE0  #,  /* 0001111111100000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x78,0x78  #,  /* 0111100001111000 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xE0,0x1C  #,  /* 1110000000011100 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=95, hex=0x5F, ascii="_"
underscore:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0xFF,0xFF  #,  /* 1111111111111111 */
.byte    0xFF,0xFF  #,  /* 1111111111111111 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=96, hex=0x60, ascii="`"
upostrophy:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x00  #,  /* 0000111100000000 */
.byte    0x0F,0x80  #,  /* 0000111110000000 */
.byte    0x07,0xC0  #,  /* 0000011111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=97, hex=0x61, ascii="a"
a:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0xC0  #,  /* 0011111111000000 */
.byte     0x3F,0xE0  #,  /* 0011111111100000 */
.byte     0x01,0xF0  #,  /* 0000000111110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7F,0xF0  #,  /* 0111111111110000 */
.byte     0xF8,0xF0  #,  /* 1111100011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF9,0xF0  #,  /* 1111100111110000 */
.byte     0x7F,0xFC  #,  /* 0111111111111100 */
.byte     0x3F,0x3C  #,  /* 0011111100111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=98, hex=0x62, ascii="b"
b:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFC,0x00  #,  /* 1111110000000000 */
.byte     0xFC,0x00  #,  /* 1111110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3F,0x80  #,  /* 0011111110000000 */
.byte     0x3F,0xE0  #,  /* 0011111111100000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x3C,0xF8  #,  /* 0011110011111000 */
.byte     0x3C,0x7C  #,  /* 0011110001111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x7C  #,  /* 0011110001111100 */
.byte     0x3F,0xF8  #,  /* 0011111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=99, hex=0x63, ascii="c"
c:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=100, hex=0x64, ascii="d"
d:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x03,0xF0  #,  /* 0000001111110000 */
.byte     0x03,0xF0  #,  /* 0000001111110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x0F,0xF0  #,  /* 0000111111110000 */
.byte     0x1F,0xF0  #,  /* 0001111111110000 */
.byte     0x3C,0xF0  #,  /* 0011110011110000 */
.byte     0x78,0xF0  #,  /* 0111100011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0x79,0xF0  #,  /* 0111100111110000 */
.byte     0x3F,0xFC  #,  /* 0011111111111100 */
.byte     0x1F,0x3C  #,  /* 0001111100111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=101, hex=0x65, ascii="e"
e:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x00  #,  /* 1111000000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=102, hex=0x66, ascii="f"
f:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x0F,0xC0  #,  /* 0000111111000000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x3C,0xF0  #,  /* 0011110011110000 */
.byte     0x3C,0x70  #,  /* 0011110001110000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0xFF,0x00  #,  /* 1111111100000000 */
.byte     0xFF,0x00  #,  /* 1111111100000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0xFF,0x00  #,  /* 1111111100000000 */
.byte     0xFF,0x00  #,  /* 1111111100000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=103, hex=0x67, ascii="g"
g:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0x3C  #,  /* 0011111100111100 */
.byte     0x7F,0xFC  #,  /* 0111111111111100 */
.byte     0xF9,0xF0  #,  /* 1111100111110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF8,0xF0  #,  /* 1111100011110000 */
.byte     0x7F,0xF0  #,  /* 0111111111110000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF9,0xF0  #,  /* 1111100111110000 */
.byte     0x7F,0xE0  #,  /* 0111111111100000 */
.byte     0x3F,0xC0  #,  /* 0011111111000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=104, hex=0x68, ascii="h"
h:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFC,0x00  #,  /* 1111110000000000 */
.byte     0xFC,0x00  #,  /* 1111110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0xF0  #,  /* 0011110011110000 */
.byte     0x3F,0xF8  #,  /* 0011111111111000 */
.byte     0x3F,0xFC  #,  /* 0011111111111100 */
.byte     0x3F,0x3C  #,  /* 0011111100111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0xFC,0x3C  #,  /* 1111110000111100 */
.byte     0xFC,0x3C  #,  /* 1111110000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=105, hex=0x69, ascii="i"
i:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x1F,0x80  #,  /* 0001111110000000 */
.byte     0x1F,0x80  #,  /* 0001111110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=106, hex=0x6A, ascii="j"
j:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0xFC  #,  /* 0000000011111100 */
.byte     0x00,0xFC  #,  /* 0000000011111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3E,0x7C  #,  /* 0011111001111100 */
.byte     0x1F,0xF8  #,  /* 0001111111111000 */
.byte     0x0F,0xF0  #,  /* 0000111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=107, hex=0x6B, ascii="k"
k:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFC,0x00  #,  /* 1111110000000000 */
.byte     0xFC,0x00  #,  /* 1111110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x7C  #,  /* 0011110001111100 */
.byte     0x3C,0xF8  #,  /* 0011110011111000 */
.byte     0x3D,0xF0  #,  /* 0011110111110000 */
.byte     0x3F,0xE0  #,  /* 0011111111100000 */
.byte     0x3F,0xC0  #,  /* 0011111111000000 */
.byte     0x3F,0xC0  #,  /* 0011111111000000 */
.byte     0x3F,0xE0  #,  /* 0011111111100000 */
.byte     0x3D,0xF0  #,  /* 0011110111110000 */
.byte     0x3C,0xF8  #,  /* 0011110011111000 */
.byte     0x3C,0x7C  #,  /* 0011110001111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0xFC,0x3C  #,  /* 1111110000111100 */
.byte     0xFC,0x3C  #,  /* 1111110000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=108, hex=0x6C, ascii="l"
l:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x1F,0x80  #,  /* 0001111110000000 */
.byte     0x1F,0x80  #,  /* 0001111110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x07,0x80  #,  /* 0000011110000000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=109, hex=0x6D, ascii="m"
m:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFC,0xF0  #,  /* 1111110011110000 */
.byte     0xFF,0xF8  #,  /* 1111111111111000 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=110, hex=0x6E, ascii="n"
n:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF3,0xF0  #,  /* 1111001111110000 */
.byte     0xFF,0xF8  #,  /* 1111111111111000 */
.byte     0x3E,0x7C  #,  /* 0011111001111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=111, hex=0x6F, ascii="o"
o:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=112, hex=0x70, ascii="p"
p:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF3,0xF0  #,  /* 1111001111110000 */
.byte     0xFF,0xF8  #,  /* 1111111111111000 */
.byte     0x3E,0x7C  #,  /* 0011111001111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x7C  #,  /* 0011110001111100 */
.byte     0x3F,0xF8  #,  /* 0011111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0xFF,0x00  #,  /* 1111111100000000 */
.byte     0xFF,0x00  #,  /* 1111111100000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=113, hex=0x71, ascii="q"
q: 
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0x3C  #,  /* 0011111100111100 */
.byte     0x7F,0xFC  #,  /* 0111111111111100 */
.byte     0xF9,0xF0  #,  /* 1111100111110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF8,0xF0  #,  /* 1111100011110000 */
.byte     0x7F,0xF0  #,  /* 0111111111110000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x00,0xF0  #,  /* 0000000011110000 */
.byte     0x03,0xFC  #,  /* 0000001111111100 */
.byte     0x03,0xFC  #,  /* 0000001111111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=114, hex=0x72, ascii="r"
r:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF3,0xF0  #,  /* 1111001111110000 */
.byte     0xFF,0xF8  #,  /* 1111111111111000 */
.byte     0x3F,0x7C  #,  /* 0011111101111100 */
.byte     0x3E,0x3C  #,  /* 0011111000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0x3C,0x00  #,  /* 0011110000000000 */
.byte     0xFF,0x00  #,  /* 1111111100000000 */
.byte     0xFF,0x00  #,  /* 1111111100000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=115, hex=0x73, ascii="s"
s:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0xF0,0x7C  #,  /* 1111000001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0x78,0x00  #,  /* 0111100000000000 */
.byte     0x3E,0x00  #,  /* 0011111000000000 */
.byte     0x1F,0x80  #,  /* 0001111110000000 */
.byte     0x07,0xE0  #,  /* 0000011111100000 */
.byte     0x01,0xF0  #,  /* 0000000111110000 */
.byte     0x00,0x78  #,  /* 0000000001111000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x3C  #,  /* 1111100000111100 */
.byte     0x7F,0xF8  #,  /* 0111111111111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=116, hex=0x74, ascii="t"
t:  
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x01,0x00  #,  /* 0000000100000000 */
.byte     0x03,0x00  #,  /* 0000001100000000 */
.byte     0x07,0x00  #,  /* 0000011100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0xFF,0xF0  #,  /* 1111111111110000 */
.byte     0xFF,0xF0  #,  /* 1111111111110000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x00  #,  /* 0000111100000000 */
.byte     0x0F,0x1C  #,  /* 0000111100011100 */
.byte     0x0F,0xBC  #,  /* 0000111110111100 */
.byte     0x07,0xF8  #,  /* 0000011111111000 */
.byte     0x03,0xF0  #,  /* 0000001111110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=117, hex=0x75, ascii="u"
u:     
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF0,0xF0  #,  /* 1111000011110000 */
.byte     0xF9,0xF0  #,  /* 1111100111110000 */
.byte     0x7F,0xFC  #,  /* 0111111111111100 */
.byte     0x3F,0x3C  #,  /* 0011111100111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=118, hex=0x76, ascii="v"
v:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3C,0x3C  #,  /* 0011110000111100 */
.byte     0x3E,0x7C  #,  /* 0011111001111100 */
.byte     0x1F,0xF8  #,  /* 0001111111111000 */
.byte     0x0F,0xF0  #,  /* 0000111111110000 */
.byte     0x07,0xE0  #,  /* 0000011111100000 */
.byte     0x03,0xC0  #,  /* 0000001111000000 */
.byte     0x01,0x80  #,  /* 0000000110000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=119, hex=0x77, ascii="w"
w:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF3,0x3C  #,  /* 1111001100111100 */
.byte     0xF7,0xBC  #,  /* 1111011110111100 */
.byte     0xF7,0xBC  #,  /* 1111011110111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0x7C,0xF8  #,  /* 0111110011111000 */
.byte     0x38,0x70  #,  /* 0011100001110000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=120, hex=0x78, ascii="x"
x:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0x7C,0xF8  #,  /* 0111110011111000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x0F,0xC0  #,  /* 0000111111000000 */
.byte     0x0F,0xC0  #,  /* 0000111111000000 */
.byte     0x0F,0xC0  #,  /* 0000111111000000 */
.byte     0x0F,0xC0  #,  /* 0000111111000000 */
.byte     0x1F,0xE0  #,  /* 0001111111100000 */
.byte     0x3F,0xF0  #,  /* 0011111111110000 */
.byte     0x7C,0xF8  #,  /* 0111110011111000 */
.byte     0xF8,0x7C  #,  /* 1111100001111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=121, hex=0x79, ascii="y"
y:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xF8,0x3C  #,  /* 1111100000111100 */
.byte     0x7F,0xFC  #,  /* 0111111111111100 */
.byte     0x3F,0xFC  #,  /* 0011111111111100 */
.byte     0x00,0x3C  #,  /* 0000000000111100 */
.byte     0x00,0x7C  #,  /* 0000000001111100 */
.byte     0x00,0xF8  #,  /* 0000000011111000 */
.byte     0x01,0xF0  #,  /* 0000000111110000 */
.byte     0xFF,0xE0  #,  /* 1111111111100000 */
.byte     0xFF,0xC0  #,  /* 1111111111000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=122, hex=0x7A, ascii="z"
z:
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xF0,0xF8  #,  /* 1111000011111000 */
.byte     0xF1,0xF0  #,  /* 1111000111110000 */
.byte     0x03,0xE0  #,  /* 0000001111100000 */
.byte     0x07,0xC0  #,  /* 0000011111000000 */
.byte     0x0F,0x80  #,  /* 0000111110000000 */
.byte     0x1F,0x00  #,  /* 0001111100000000 */
.byte     0x3E,0x00  #,  /* 0011111000000000 */
.byte     0x7C,0x00  #,  /* 0111110000000000 */
.byte     0xF8,0x3C  #,  /* 1111100000111100 */
.byte     0xF0,0x3C  #,  /* 1111000000111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0xFF,0xFC  #,  /* 1111111111111100 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */
.byte     0x00,0x00  #,  /* 0000000000000000 */


#     * code=123, hex=0x7B, ascii="{"
curlyo:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0xFC  #,  /* 0000000011111100 */
.byte    0x01,0xFC  #,  /* 0000000111111100 */
.byte    0x03,0xE0  #,  /* 0000001111100000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x3F,0x00  #,  /* 0011111100000000 */
.byte    0x3F,0x00  #,  /* 0011111100000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xE0  #,  /* 0000001111100000 */
.byte    0x01,0xFC  #,  /* 0000000111111100 */
.byte    0x00,0xFC  #,  /* 0000000011111100 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=124, hex=0x7C, ascii="|"
sslash:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=125, hex=0x7D, ascii="}"
curlyc:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x3F,0x00  #,  /* 0011111100000000 */
.byte    0x3F,0x80  #,  /* 0011111110000000 */
.byte    0x07,0xC0  #,  /* 0000011111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x01,0xE0  #,  /* 0000000111100000 */
.byte    0x00,0xFC  #,  /* 0000000011111100 */
.byte    0x00,0xFC  #,  /* 0000000011111100 */
.byte    0x01,0xE0  #,  /* 0000000111100000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x03,0xC0  #,  /* 0000001111000000 */
.byte    0x07,0xC0  #,  /* 0000011111000000 */
.byte    0x3F,0x80  #,  /* 0011111110000000 */
.byte    0x3F,0x00  #,  /* 0011111100000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=126, hex=0x7E, ascii="~"
tidle:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x3C,0x1C  #,  /* 0011110000011100 */
.byte    0x7F,0x3C  #,  /* 0111111100111100 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0xF3,0xF8  #,  /* 1111001111111000 */
.byte    0xE0,0xF0  #,  /* 1110000011110000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=127, hex=0x7F, ascii="^?"
house:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x03,0x00  #,  /* 0000001100000000 */
.byte    0x07,0x80  #,  /* 0000011110000000 */
.byte    0x0F,0xC0  #,  /* 0000111111000000 */
.byte    0x1F,0xE0  #,  /* 0001111111100000 */
.byte    0x3F,0xF0  #,  /* 0011111111110000 */
.byte    0x7C,0xF8  #,  /* 0111110011111000 */
.byte    0xF8,0x7C  #,  /* 1111100001111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xF0,0x3C  #,  /* 1111000000111100 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0xFF,0xFC  #,  /* 1111111111111100 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


#     * code=248, hex=0xF8, ascii="!x" degree^0
celcius:
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x0F,0xC0  #,  /* 0000111111000000 */
.byte    0x1F,0xE0  #,  /* 0001111111100000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x3C,0xF0  #,  /* 0011110011110000 */
.byte    0x1F,0xE0  #,  /* 0001111111100000 */
.byte    0x0F,0xC0  #,  /* 0000111111000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */
.byte    0x00,0x00  #,  /* 0000000000000000 */


.align 4

.section .rodata
.global clock_numbers


day:
.byte 0x00,0x00,'M','o','T','u','W','e','T','h','F','r','S','a','S','u'

number:
.byte 0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09
number1:
.byte 0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19
number2:
.byte 0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27,0x28,0x29
number3:
.byte 0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39
number4:
.byte 0x40,0x41,0x42,0x43,0x44,0x45,0x46,0x47,0x48,0x49
number5:
.byte 0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57,0x58,0x59
welcome:
.asciz "Hello, World!" 
mes1:.asciz  "adj hour"
mes2:.asciz  "adj min"
mes3:.asciz  "adj day"
mes4:.asciz  "adj mon"
mes5:.asciz  "adj year"
mes6:.asciz  "adj date"
mes7:.asciz  "language"
mal:.asciz "malyalam"
tam:.asciz "tamil"
kan:.asciz "kannada"
tel:.asciz "telgu"
hin:.asciz "hindi"
guj:.asciz "gujrati"
pun:.asciz "punjabi"
eng:.asciz "english"
ben:,asciz "bengali"
mon:.asciz "Monday"
tue:.asciz "Tuesday"
wed:.asciz "Wednesdy"
thu:.asciz "Thursday"
fri:.asciz "Friday"
sat:.asciz "Saturday"
sun:.asciz "Sunday"
.align 4
base_DF_command: .byte 0x7e,0xff,0x06,0x00,0x00,0x00,0x00,0xef








