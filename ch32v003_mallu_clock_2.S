SRAM_start = 0x20000000
SRAM_end   = 0x20000800	
STACK = 0x20000800
fclk = 24000000   			# 24Mhz RCO internal 
.equ R32_RCC_APB2PCENR, 0x40021018
.equ R32_GPIOC_CFGLR, 0x40011000
.equ R32_GPIOD_CFGLR, 0x40011400
.equ R32_GPIOD_OUTDR, 0x4001140C
.equ R32_USART_BRR, 0x40013808
.equ R32_USART_CTLR1, 0x4001380C
.equ R32_RCC_APB1PRSTR, 0x40021010 
.equ R16_SPI_CTLR1, 0x40013000
.equ R16_SPI_CTLR2, 0x40013004
.equ R16_SPI_CTLR1, 0x40013000
.equ R32_USART_STATR, 0x40013800
.equ R32_USART_DATAR, 0x40013804
.equ R16_SPI_STATR, 0x40013008
.equ R16_SPI_DATAR, 0x4001300C
.equ R32_GPIOC_BSHR, 0x40011010 

#ST7735 1.8inch 128 x 160 LCD

COLOR_BLACK 	= 0x0000
COLOR_WHITE 	= 0xffff
COLOR_RED 	= 0xf800
COLOR_GREEN 	= 0x07e0
COLOR_BLUE 	= 0x001f
COLOR_MAGENTA 	= 0xf81f
COLOR_CYAN 	= 0xffe0
COLOR_YELLOW 	= 0x07ff
ST7735_NOP   	= 0x00
ST7735_SWRESET = 0x01
ST7735_RDDID   = 0x04
ST7735_RDDST   = 0x09
ST7735_SLPIN   = 0x10
ST7735_SLPOUT  = 0x11
ST7735_PTLON   = 0x12
ST7735_NORON   = 0x13

ST7735_INVOFF  = 0x20
ST7735_INVON   = 0x21
ST7735_DISPOFF = 0x28
ST7735_DISPON  = 0x29
ST7735_CASET   = 0x2A
ST7735_RASET   = 0x2B
ST7735_RAMWR   = 0x2C
ST7735_RAMRD   = 0x2E

ST7735_PTLAR   = 0x30
ST7735_COLMOD  = 0x3A
ST7735_MADCTL  = 0x36

ST7735_FRMCTR1 = 0xB1
ST7735_FRMCTR2 = 0xB2
ST7735_FRMCTR3 = 0xB3
ST7735_INVCTR  = 0xB4
ST7735_DISSET5 = 0xB6

ST7735_PWCTR1  = 0xC0
ST7735_PWCTR2  = 0xC1
ST7735_PWCTR3  = 0xC2
ST7735_PWCTR4  = 0xC3
ST7735_PWCTR5  = 0xC4
ST7735_VMCTR1  = 0xC5

ST7735_RDID1   = 0xDA
ST7735_RDID2   = 0xDB
ST7735_RDID3   = 0xDC
ST7735_RDID4   = 0xDD

ST7735_PWCTR6  = 0xFC

ST7735_GMCTRP1 = 0xE0
ST7735_GMCTRN1 = 0xE1
DC_COMMAND =  0
DC_DATA    =  0x40

Rotat_UP    = 0x00
Rotat_LEFT  = 0xa0	  
Rotat_RIGHT = 0x60
Rotat_DOWN  = 0xc0 
width =  128
height = 160
MADCTL_MY =  0x80
MADCTL_MX =  0x40
MADCTL_MV =  0x20
MADCTL_ML =  0x10
MADCTL_RGB = 0x00
MADCTL_BGR = 0x08
MADCTL_MH  = 0x04
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
#I2C_SCL 		= PD1 # I2C  clock on PD1 (reccomended external pullup 4.7k)
#I2C_SDA 		= PD0 # I2C  data on PD0 (reccomended external pullup 4.7k)
#UART_TX		= PD5
#UART_RX                = PD6
#########################################   VARIABLES
fclk 		= 24000000   		# 24Mhz RCO internal , AHB =8Mhz by default
state 		= 0x2000000C 		# located in SRAM
result1 	= 0x20000010 		# 0x20000010 to 0x20000018 is used for storing result in decimal format
result2 	= 0x20000014
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
.equ mem,  0x2000009C # 10 bytes used by print function from 0(mem)
.equ mem1,  0x200000A0 # till 9(mem) , 2 bytes in mem1


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

.macro drawHline x y x1 colour
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
  li x15,\y
  sb x15,0(x10)
  call setTFTwindow
  la x10,XYCOLOUR		# point x11 to XYCOLOUR variable
  addi x10,x10,2		# increase  address to byte2 , lo byte of colour
  li x15,\colour		# load colour data supplied ,half word
  sb x15,0(x10)			# store the low byte in XYCOLOUR byte2
  srli x15,x15,8		# shift out low byte from x15 with only high byte remaining
  addi x10,x10,1		# point to byte3 , hi byte of colour in XYCOLOUR
  sb x15,0(x10)			# store hi byte of colour
  call PIXEL_REPEAT1		# call PIXEL_REPEAT1 subroutine to print the pixels as per coordinates supplied in line2
.endm

.macro drawVline x y y1 colour
  la x10,XYC
  li x15,\x
  sb x15,0(x10)
  addi x10,x10,1
  li x15,\x
  sb x15,0(x10)
  addi x10,x10,1
  li x15,\y
  sb x15,0(x10)
  addi x10,x10,1
  li x15,\y1
  sb x15,0(x10)
  call setTFTwindow
  la x10,XYCOLOUR		# point x11 to XYCOLOUR variable
  addi x10,x10,2		# increase  address to byte2 , lo byte of colour
  li x15,\colour		# load colour data supplied ,half word
  sb x15,0(x10)			# store the low byte in XYCOLOUR byte2
  srli x15,x15,8		# shift out low byte from x15 with only high byte remaining
  addi x10,x10,1		# point to byte3 , hi byte of colour in XYCOLOUR
  sb x15,0(x10)			# store hi byte of colour
  call PIXEL_REPEAT1		# call PIXEL_REPEAT1 subroutine to print the pixels as per coordinates supplied in line2
.endm

.macro drawRECTANGLE x y width height colour
  la x10,XYC			# point x10 to variable XYC
  li x15,\x
  sb x15,0(x10)
  addi x10,x10,1		# increase the XYC pointer to byte1
  li x15,\width	
  addi x15,x15,\x
  sb x15,0(x10)			# store width
  li x15,\y
  addi x10,x10,1		# increase pointer to byte2 in XYC
  sb x15,0(x10)			# store start of y
  addi x10,x10,1		# increase pointer to byte3 in XYC
  li x15,\y
  sb x15,0(x10)			# start y is stored in byte3 XYC, y axis =0 , horizontal line drawn
  call setTFTwindow
  la x10,XYCOLOUR		# point x11 to XYCOLOUR variable
  addi x10,x10,2		# increase  address to byte2 , lo byte of colour
  li x15,\colour		# load colour data supplied ,half word
  sb x15,0(x10)			# store the low byte in XYCOLOUR byte2
  srli x15,x15,8		# shift out low byte from x15 with only high byte remaining
  addi x10,x10,1		# point to byte3 , hi byte of colour in XYCOLOUR
  sb x15,0(x10)			# store hi byte of colour
  call PIXEL_REPEAT1		# call PIXEL_REPEAT1 subroutine to print the pixels as per coordinates supplied by macro
  la x10,XYC			# point x10 to variable XYC
  li x15,\x			# load x15 with x0 start
  sb x15,0(x10)			# store in XYC byte0
  addi x10,x10,1		# increase the XYC pointer to byte1
  li x15,\x			# load x15 with x0 start
  sb x15,0(x10)			# store width as x0, no horizontal component line will be vertical from start x,y
  addi x10,x10,1		# point x10 to byte2 of the XYC
  li x15,\x			# load x15 with x0 start
  sb x15,0(x10)			# vertical line starts here fron x,y
  addi x10,x10,1		# increase XYC pointer to byte3 y1(destination height)  
  li x15,\height		# load the height , final value of the vertical line
  addi x15,x15,\y
  sb x15,0(x10)			# store in byte3 of XYC
  call setTFTwindow
  call PIXEL_REPEAT1		# call PIXEL_REPEAT1 subroutine to print the pixels as per coordinates supplied in line2
  la x10,XYC			# point x10 to variable XYC
  li x15,\width			# load x15 with width, we start drawing line from diagonal opposite x,y to complete rectangle
  addi x15,x15,\x
  sb x15,0(x10)			# store in XYC byte0
  addi x10,x10,1		# increase the XYC pointer to byte1
  li x15,\width			# load x15 with width, x0-x1=0 since start and end is width ,  vertical line will be drawn
  addi x15,x15,\x
  sb x15,0(x10)			# store in XYC byte0
  addi x10,x10,1		# increase the XYC pointer to byte2
  li x15,\y			# load x15 with y start		
  sb x15,0(x10)			# store in XYC byte2
  addi x10,x10,1		# point x10 to byte3 of XYC
  li x15,\height		# load x15 with height , final destination pixel of vertical line
  addi x15,x15,\y		
  sb x15,0(x10)			# store in XYC byte3
  call setTFTwindow		#
  call PIXEL_REPEAT1		# call PIXEL_REPEAT1 subroutine to print the pixels as per coordinates supplied by macro  
  la x10,XYC			# point x10 to variable XYC
  li x15,\x			# load x15 with x start, 
  sb x15,0(x10)			# store in XYC byte0
  addi x10,x10,1		# increase the XYC pointer to byte1
  li x15,\width			# load x15 with width, x0-x1= >0 horizontal line will be drawn
  addi x15,x15,\x
  sb x15,0(x10)			# store in XYC byte1
  addi x10,x10,1		# increase the XYC pointer to byte2
  li x15,\height		# load x15 with height , y starts with height diagnoal opposite of x,y
  addi x15,x15,\y		
  sb x15,0(x10)			# store in XYC byte2
  addi x10,x10,1		# point x10 to byte3 of XYC
  li x15,\height		# load x15 with height , height - height = 0 , vertical component 0 , only horizontal line
  addi x15,x15,\y		
  sb x15,0(x10)			# store in XYC byte3
  call setTFTwindow		#
  call PIXEL_REPEAT1		# call PIXEL_REPEAT1 subroutine to print the pixels as per coordinates supplied by macro  
.endm

.macro fillRECTANGLE x y width height colour
  la x10,XYC			# point x10 to XYC
  li x15,\x			# load x15 with start value x
  sb x15,0(x10)			# store x in byte0 of XYC
  addi x10,x10,1		# point X10 to byte1 of XYC
  li x15,\width 		# load width of the rectanglex in x15
  addi x15,x15,\x
  sb x15,0(x10)			# store in byte1 of XYC
  addi x10,x10,1		# point x10 to byte2 of XYC
  li x15,\y			# load start of rectangley in x15
  sb x15,0(x10)			# store in byte2 of XYC
  addi x10,x10,1		# point x10 to byte3 of XYC
  li x15,\height 		# load height of rectangle in x15
  addi x15,x15,\y
  sb x15,0(x10)			# store in byte3 of XYC
  call setTFTwindow		# set rectangle window in LCD with above coordinates
  la x10,XYCOLOUR		# point x11 to XYCOLOUR variable
  addi x10,x10,2		# increase  address to byte2 , lo byte of colour
  li x15,\colour		# load colour data supplied ,half word
  sb x15,0(x10)			# store the low byte in XYCOLOUR byte2
  srli x15,x15,8		# shift out low byte from x15 with only high byte remaining
  addi x10,x10,1		# point to byte3 , hi byte of colour in XYCOLOUR
  sb x15,0(x10)			# store hi byte of colour
  call PIXEL_REPEAT1		# call PIXEL_REPEAT1 subroutine to print the pixels as per coordinates supplied in line2
.endm


.macro loadPARAM command, ack, hdata,ldata
	addi sp,sp,-8
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
	li x3,\hdata
	sb x3,0(a1)		# write byte 5, hi byte of data
	addi a1,a1,1
	li x3,\ldata
	sb x3,0(a1)		# write byte 6, low byte of data
	lw a1,4(sp)
	lw x3,0(sp)
	addi sp,sp,8
	
.endm

.macro loadPARAM1 command, ack, hdata, x6
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
	li x3,\hdata
	sb x3,0(a1)		# write byte 5, hi byte of data
	addi a1,a1,1
	mv x3,\x6
	sb x3,0(a1)		# write byte 6, low byte of data
	lw a1,4(sp)
	lw x3,0(sp)
	#lw ra,0(sp)
	addi sp,sp,8
	
.endm










#include CH32V003_reg.S
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
#Enable I2C clock in  APB1 register
    
    	la x10,R32_RCC_APB1PCENR 	# load address of APB1PCENR register to x10 ,for enabling I2C peripheral
	lw x11,0(x10) 			# load contents from peripheral register R32_RCC_APB1PCENR pointed by x10
	li x7,(1<<21) 			# 1<<I2C1_EN, = 1<<21 for I2C functions
	or x11,x11,x7 			# or values 
	sw x11,0(x10) 

#I2C remap from pc1,pc2 to pd0,pd1
	
	la x10,R32_AFIO_PCFR1
	lw x11,0(x10)
	li x7,((0<<22)|(1<<1))		# 01 in 22 and 1 bits will remap i2c to pd0 and pd1
	or x11,x11,x7
	sw x11,0(x10)
###########
#configure GPIO PortC as multiplex push-pull output for SPI
	la x10,R32_GPIOC_CFGLR		# load pointer x10 with address of R32_GPIOC_CFGLR , I2C SDA & SCL is on portC PC1,PC2
	lw x11,0(x10)			# load contents from register pointed by x10
	li x7,~((0xf<<4)|(0xf<<8)|(0xf<<20)|(0xf<<24)|(0xf<<28))	# clear pc1,pc5,pc6,pc7. we need to setup PC1 ,PC5,PC6,PC7 for SPI
	and x11,x11,x7			# clear  mode and cnf bits for selected pin C1,C2
	li x7,((0xB<<4)|(0x3<<8)|(0xB<<20)|(0xB<<24)|(0xB<<28))		# PC1,PC5,PC6,PC7 = multiplex pushpull output 50mhz , 0b1011
	or x11,x11,x7			# OR value to register
	sw x11,0(x10)			# store in R32_GPIOC_CFGLR

#configure GPIO D for uart and I2c
	la x10,R32_GPIOD_CFGLR		# load pointer x10 with address of R32_GPIOD_CFGLR , GPIO configuration register
	lw x11,0(x10)			# load contents from register pointed by x10
	li x7,~((0xf<<20)|(0xf<<24)|(0xf<<4)|(0xf<<0))	#clear pd6,pd5,pd1,pd0. we need to setup PD5 & PD6 for usart tx and rx and pd1,pd0 for I2C remap
	and x11,x11,x7			# clear pd5,pd6,pd1,pd0 mode and cnf bits for selected pin D4,D5,D6
	li x7,((0x8<<24)|(0xB<<20)|(13<<4)|(13<<0))	# pd6 = input with PU/PD,pd5= multiplex pushpull output 50mhz,pd4= normal pushpull output 50hz
	or x11,x11,x7			# OR value to register
	sw x11,0(x10)			# store in R32_GPIOD_CFGLR

#enable pull up for input	
	la x10,R32_GPIOD_OUTDR		# enable pullup resistor by setting OUTDR register
	lw x11,0(x10)			# this setting of GPIO_OUTDR for pullup resistor effects if corresonding pin is selected as input
	li x7,(1<<6)			#when PD6 is input with resistor selected 1= pullup and 0 = pulldown
	or x11,x11,x7
	sw x11,0(x0)

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
#I2C0 configuration 
	la x10,R32_RCC_APB1PRSTR 	# set pointer to clock control  peripheral reset register 
	lw x11,0(x10) 			# load contents to x11
	li x7,(1<<21) 			# shift 1 to 21st bit position
	or x11,x11,x7 			# OR with x11
	sw x11,0(x10) 			# set bit 21 of R32_RCC_APB1PRSTR to reset I2C peripheral
	not x7,x7 			# invert values in x7
	and x11,x11,x7 			# and x11 to write a 0 in 21st bit
	sw x11,0(x10) 			# store 0 in 21st bit to restart i2c engine

	la x10,R16_I2C_CTLR2 		# set clock in control 2 register
    	lh x11,0(x10) 			# copy contents of R16_I2C_CTLR2 to x11
	li x7,0xffffffc0 		# clear frequency bits 0-5 with bit mask 0xffffffc0
	and x11,x11,x7 			# AND will clear bit 0-5
    	li x7,(8<<0) 			# 8Mhz I2C clock .default 24Mhz HSI/3 =8Mhz APB clock
    	or x11,x11,x7 			# store APB clock frequency in bit 0-5
	sh x11,0(x10) 			# store back in R16_I2C_CTLR2
    	la x10,R16_I2C_CKCFGR 		# set pointer to I2C clockregister
    	lh x11,0(x10) 			# copy values to x11 from above register
	li x7,0xfffff000 		# clear CCR bits 0-11 with bitmask 0xfffff000
	and x11,x11,x7 			# ANDing clears bit 0-11 in x11 register
	li x7,(40<<0) 			# CCR = t(rscl)+t(wsclh)/tpclk1 = 1000+4000/125 =40 , or (8000000/2*100000)=40 , PCLK/2*100Khz =CCR
    	or x11,x11,x7 			# store calculated CCR (data sheet)in x11 by OR
	sh x11,0(x10) 			# store back in peripheral register
	la x10,R16_I2C_CTLR1 		# set pointer to I2C control register 1
	lh x11,0(x10) 			# copy contents
	li x7,(1<<0) 			# 1<<PE = 1<<0 enable bit is bit0,1<<10 is ack enable bit
	or x11,x11,x7 			# OR enable bit to x11
	sh x11,0(x10) 			# store half word in control register 1
	la x10,R16_I2C_CTLR1 		# set pointer to I2C control register 1
	lh x11,0(x10) 			# copy contents
	li x7,(1<<10) 			# 1<<10 is ack enable bit
	or x11,x11,x7 			# OR ACK enable bit to x11
	sh x11,0(x10) 			# store half word in control register 1



	call ST7735_init		# ST3375 LCD initialization routine


.align 4

#test UART transmission,transmits string SAJEEV SANKARAN CH32V003 UART

	la x10,name			# load address of label "name" to x10, string to be transmitted
string_loop:
	lb x8,0(x10)			# load 1 byte from 0 offset of "name"
	beqz x8,finish			# if byte in x8 null branch to label "finish"
	call USART_TX			# call subroutine USART_TX to transmit byte
	addi x10,x10,1			# increase pointer by 1 byte
	j string_loop			# jump back to label string_loop until null is encountered
finish:
	nop

	li x8,0x0d			# line feed
	call USART_TX			# call uart
	li x8,0x0a			# carriage feed
	call USART_TX			# call uart
####################################################
.align 4
	call CLEAR_SCREEN		# macro clear screen to blackout screen

	FILLSCREEN COLOR_BLUE		# macro FILLSCREEN called with blue colour
	li x6,2000000
	call delay			# approx 1 second delay
	FILLSCREEN COLOR_RED		# macro FILLSCREEN called with red colour
	li x6,2000000
	call delay			# approx 1 second delay
	FILLSCREEN COLOR_GREEN		# macro FILLSCREEN called with green colour
	li x6,2000000
	call delay			# approx 1 second delay
	FILLSCREEN COLOR_MAGENTA	# macro FILLSCREEN called with magenta colour
	li x6,2000000
	call delay			# approx 1 second delay
	FILLSCREEN COLOR_CYAN		# macro FILLSCREEN called with cyan colour
	li x6,2000000
	call delay			# approx 1 second delay
	FILLSCREEN COLOR_YELLOW		# macro FILLSCREEN called with yellow colour
	li x6,2000000
	call delay			# approx 1 second delay

	SETCURSOR 0, 0, 15, 31		# x = 0 ,y =0, x1 =15, y1 =31 ,sets cursor/window in order of x,y,x1,y1 (macro)

	fontcolor COLOR_RED		# stores RED colour for font in FONTCOLOR variable (macro)
	bgcolor COLOR_WHITE		# stores white colour for font background in FONTCOLOR variable (macro)

	PRINT 'Z'			# macro searches and prints an ascii character, call after setting window , font colour
	li x6,2000000
	call delay			# approx 1 second delay

	call push_cursor1		# moves cursor to next legal position on the screen 128x160,new window will be created with off set based on the set window data
	PRINT 'b'			# prints default 16x32 fonts
	li x6,2000000
	call delay			# approx 1 second delay

	SETCURSOR 0, 0, 31, 63		# x = 0 ,y =0, x1 =31, y1 =63
	fontcolor COLOR_MAGENTA		# set font colour magenta (macro)
	bgcolor COLOR_WHITE		# set background colour white(macro)
	li x15,'9'			# char to be enlarged and printed
	call select_font		# subroutine calculates address of font in x15 register and loads it to variable "state"in SRAM
	call DRAW_CHAR_DOUBLE		# subroutine multiplies default 16x32 in this code to 32x64 font
	li x6,2000000
	call delay			# approx 1 second delay

	FILLSCREEN COLOR_WHITE		#
	SETCURSOR 0, 0, 15, 31		# x = 0 ,y =0, x1 =15, y1 =31

					# below loop will print all character in the font table with 1 second delay 16x32 default
	li x15,' '			# laod space in x15 , font array starts with ascii " "
	la x10,mem			# point to variable mem in sram with x10 register
	sb x15,0(x10)			# store byte ' ' in mem
	li x14,0x80			# load 0x80/128 which is total count of ascii characters in the font look up table
loopall:
	call select_font		# call subroutine to locate address of font in x15 and load it in variable state
	call DRAW_CHAR32		# call subroutine to print 16x32 font pointed by the cursor
	call push_cursor1		# move cursor one box ahead for the next char
	li x6,2000000
	call delay			# approx 1 second delay
	la x10,mem			# point to variable mem in sram with x10 register
	lb x15,0(x10)			# reload the already printed char again as x15 is changed while writing char
	addi x15,x15,1			# increase by 1 the ascii value
	sb x15,0(x10)			# store the new char in mem
	bne x15,x14,loopall		# check whether x15 is equal to 0x80 stored in x14

	drawRECTANGLE 10,10,40,50,COLOR_BLACK     # draws a unfilled rectangle with black lines

	fillRECTANGLE 50,50,100,100,COLOR_GREEN	  # draws a filled rectangle in green colour


	call CLEAR_SCREEN	# macro clear screen to blackout screen


	la x10,buffer2
	li x7,0x323214		# byte2 =x,byte1=y,byte0=r ,50,50,20 in hex
	sw x7,0(x10)
	la x10, XYCOLOUR
	li x7,COLOR_WHITE
	slli x7,x7,16
	sw x7,0(x10)
	call fillCircle



	la x10,buffer2
	li x7,0x646419		# byte2 =x,byte1=y,byte0=r ,50,50,20 in hex
	sw x7,0(x10)
	call fillCircle
here:
	j here

	call clear_screen
	call time_buffer_for_OLED
	SETCURSOR 0 0 15 31
	call print_time
	call display_date_buffer
	SETCURSOR 0 40 15 71
	call print_date
	SETCURSOR 0 80 15 111
	call print_week




















####----I2C--FUNCTIONS-----------------------------------------------------------------------------
I2C_BUSY:
	addi sp,sp,-12
	sw ra,0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
IB:
	la x10, R16_I2C_STAR2 		# set pointer x10 to I2C status register 2, busy bit resides there
	lh x11,0(x10) 			# copy to x11 I2C_STAR2 register contents
	andi x11,x11,(1<<1) 		# and x11 with 1<<I2CBUSY
	bnez x11,IB 			# if not 0 loop till I2CBUSY bit becomes 0

	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret 
#####################

I2C_START: 				# send start condition on I2C bus
	addi sp,sp,-20
	sw ra,0(sp)
	sw x12,4(sp)
	sw x11,8(sp)
	sw x10,12(sp)
	sw x7,16(sp)

	la x10,R16_I2C_CTLR1 		# start bit is in i2c cotrol register bit 8
	lh x11,0(x10) 			# copy contents of control register
	ori x11,x11,((1<<10) | (1<<8)) 	# set start bit8 and ack enable bit10
	sh x11,0(x10) 			# store in I2C_CTL0 register
check_master_mode_bit: 			# below code checks start bit is set , master mode bit is set and bus busy bit is set, reading STAR1 & STAR2 clears start bit
	la x10, R16_I2C_STAR1 		# set pointer to status register1
	lh x11,0(x10) 			# read contents to x11
	la x10, R16_I2C_STAR2 		# set pointer to status register2
	lh x12,0(x10) 			# read contents to x12
	slli x12,x12,16 		# shift x12 16 position to add x11 and x12 to accomodate all status bits in 1 register (x11)
	or x11,x11,x12 			# OR both registers , both STAR1 & STAR2 in X11
	li x7,0x00030001 		# BUSY, MSL and SB status bits
	and x11,x11,x7 			# ANDing yeilds the above 3 status bits
	bne x11,x7,check_master_mode_bit # if all 3 bits not sets wait in a loop

	lw x7,16(sp)
	lw x10,12(sp)
	lw x11,8(sp)
	lw x12,4(sp)
	lw ra,0(sp)
	addi sp,sp,20
	ret
#####################################

I2C_WRITE:
	addi sp,sp,-12
	sw ra,0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
IW:
	la x10,R16_I2C_STAR1 		# i2c_status1 register
	lh x11,0(x10) 			# read and copy contents
	andi x11,x11,(1<<7) 		# and contents of x11 with TxE bit7 , if set transmission buffer empty
	beqz x11,IW 			# wait till TBE is set (loop if a3 is 0)
	la x10,R16_I2C_DATAR 		# set pointer to I2C data register
	sb x15,0(x10) 			# store data loaded in x15 to I2C data register

	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret # return to caller
####################################

CLEAR_ACK: 				# subroutine to clear ACKEN bit in I2C_CTLR1 register
	addi sp,sp,-12
	sw ra,0(sp)
	sw x10,4(sp)
	sw x11,8(sp)

	la x10,R16_I2C_CTLR1
	lh x11,0(x10) 			# copy to x11 contents of I2C_CTL0 rgister
	andi x11,x11,~(1<<10) 		# and with 0 shifted to ACK bit10
	sh x11,0(x10) 			# write back to register

	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret 				# return to caller
####################################

I2C_TX_COMPLETE: 			# subroutine checks weather I2C transmission is complete
	addi sp,sp,-12
	sw ra,0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
TX:
	la x10,R16_I2C_STAR1
	lh x11,0(x10)
	andi x11,x11,(1<<7) 		# check TBE(7) is set 
	beqz x11,TX 			# if not wait by looping to label I2C_TX_COMPLETE 

	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret 				# return to caller
#####################################

I2C_STOP: 				# subroutine to stop I2C transmission
	addi sp,sp,-12
	sw ra,0(sp)
	sw x10,4(sp)
	sw x11,8(sp)

	la x10,R16_I2C_CTLR1
	lh x11,0(x10)
	ori x11,x11,(1<<9) 		# set STOP bit9 in I2C_CTRL1 register
	sh x11,0(x10)

	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret # return to caller
#####################################

SEND_ADDRESS: # sends address , address to be loaded in x15
	addi sp,sp,-20
	sw ra,0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
	sw x12,12(sp)
	sw x7,16(sp)

	la x10,R16_I2C_DATAR 		# set pointer to data register
	sb x15,0(x10) 			# store byte in x15 to I2C data register
address_transmit:
	la x10, R16_I2C_STAR1 		# reading STAR1 followed by STAR2 clears the address bit
	lh x11,0(x10)
	la x10, R16_I2C_STAR2 		# reading STAR1 followed by STAR2 clears the address bit
	lh x12,0(x10)
	slli x12,x12,16 		# shift STAR2 by 16 bits LHS
	or x11,x11,x12 			# STAR1 & STAR2 now in x11, top16 bits STAR2 , lower 15 bits STAR1 
	li x7,0x00070082 		# BUSY, MSL, ADDR, TXE and TRA status
	and x11,x11,x7 			# and with above bit mask to see whether these bits are set in status register
	bne x11,x7,address_transmit 	# sit in tight loop until above bits are set in both status register

	lw x7,16(sp)
	lw x12,12(sp)
	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,20
	ret
########################################

check_i2c_status:
	addi sp,sp,-16
	sw ra,0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
	sw x12,12(sp)

	la x10, R16_I2C_STAR1 		# set pointer x10 to R16_I2C_STAR1 , status register 1
	lh x11,0(x10) 			# copy contents to x11
	la x10, R16_I2C_STAR2 		# set pointer to R16_I2C_STAR2
	lh x12,0(x10) 			# copy contents to x12
	slli x12,x12,16 		# shift x12 16 position to left and OR it with x11 to hold both register values in 1 32 bit register
	or x11,x11,x12 			# status register 1 = 0-15 bits and status register2 = 16-32 bit
	la x10,buffer 			# point x10 to SRAM buffer , address 0x20000004
	sw x11,0(x10) 			# store status data in sram for future use

	lw x12,12(sp)
	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,16
	ret
#################################################################
#############################################
check_btf:
	addi sp,sp,-12
	sw ra,0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
BTF:
	la x10,R16_I2C_STAR1
	lw x11,0(x10)
	andi x11,x11,(1<<2)
	beqz x11,BTF

	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret
#############################################################
# I2C read routines , call with address in x15
#############################################################
I2C_READ_ONE:   			# (subroutine for single byte reception)
	addi sp,sp,-20
	sw ra,0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
	sw t1,12(sp)
	sw x12,16(sp)

	la t1,buffer 			# load address of memory location with label buffer
radd_transmit1: 			# this code block below checks whether address bit is set when address is transmitted successfully
	la x10,R16_I2C_STAR1 		# set x10 pointer to I2C status register 1
	lh x11,0(x10) 			# copy contents to x11
	la x10,R16_I2C_STAR2 		# set x10 pointer to I2C status register 2 
	lh x12,0(x10) 			# copy contents to x12
	slli x12,x12,16 		# shift half woord in x12 16 bits left (top half)
	or x11,x11,x12 			# OR left aligned X12 with right aligned x11, both status register bits now in x11
	li x7,0x00030002 		# load bit mask to test BUSY, MSL, ADDR, status for Mster receiver mode
	and x11,x11,x7 			# AND bit mask with x11 (status register contents)
	bne x11,x7,radd_transmit1 	# if 0x00030002 is set address transmission success. else sit in tight loop till address tx is complete
	la x10,R16_I2C_STAR1 		# dummy read R16_I2C_STAR1 followed by R16_I2C_STAR2 to clear ADDR bit in I2C_STAR1 register
	lh x11,0(x10) 			# dummy read
	la x10,R16_I2C_STAR2 		# dummy read R16_I2C_STAR1 followed by R16_I2C_STAR2 to clear ADDR bit in I2C_STAR1 register
	lh x11,0(x10) 			# dummy read
	call CLEAR_ACK 			# call subroutine to clear ACK bit (EVT6_1)
	call I2C_STOP 			# call subroutine to set STOP bit (EVT6_1)
R1:
	la x10,R16_I2C_STAR1 		# copy contents of I2C_STAT0 register to x11
	lw x11,0(x10)
	andi x11,x11,(1<<6) 		# and x11 with RxNE bit6 mask (receive buffer not empty)
	beqz x11,R1 			# if a3 is 0 wait by looping to R1 label until RBNE is set
	la x10,R16_I2C_DATAR 		# set pointer to I2C data register
	lb x15,0(x10) 			# copy contents of I2C data register to x15
	sb x15, 0(t1) 			# store byte in x15 to memory location buffer pointed by t0 register offset 0

	lw x12,16(sp)
	lw t1,12(sp)
	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,20
	ret # return to caller

###############

###############################################################################
# subroutine to read 2 or more bytes , load read address in x15 and call
# load t1 with location address to store received data
# load t0 with number of bytes to be received
# load t2 (7) with 2 indicates last 2 bytes to be received
################################################################################
MULTI_READ: 
	addi sp,sp,-28
	sw ra,0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
	sw t1,12(sp)
	sw t2,16(sp)
	sw t0,20(sp)
	sw x12,24(sp)

	la x10,R16_I2C_DATAR 		# set pointer to I2C data register
	sb x15,0(x10) 			# store byte in x15 to I2C data register to be transmitted to slave
radd_transmit: 				# this code block below checks whether address bit is set when address is transmitted successfully
	la x10,R16_I2C_STAR1 		# set x10 pointer to I2C status register 1
	lh x11,0(x10) 			# copy contents to x11
	la x10,R16_I2C_STAR2 		# set x10 pointer to I2C status register 2 
	lh x12,0(x10) 			# copy contents to x12
	slli x12,x12,16 		# shift half woord in x12 16 bits left (top half)
	or x11,x11,x12 			# OR left aligned X12 with right aligned x11, both status register bits now in x11
	li x7,0x00030002 		# load bit mask to test BUSY, MSL, ADDR, status for Mster receiver mode
	and x11,x11,x7 			# AND bit mask with x11 (status register contents)
	bne x11,x7,radd_transmit 	# if 0x00030002 is set address transmission success. else sit in tight loop till address tx is complete
	la x10,R16_I2C_STAR1 		# dummy read R16_I2C_STAR1 followed by R16_I2C_STAR2 to clear ADDR bit in I2C_STAR1 register
	lh x11,0(x10) 			# read
	la x10,R16_I2C_STAR2 		# dummy read R16_I2C_STAR1 followed by R16_I2C_STAR2 to clear ADDR bit in I2C_STAR1 register
	lh x11,0(x10) 			# read

	# la t1,buffer 			# load address of memory location with label buffer
	# li t0,6 			# t0 is loaded with number of bytes received
	li x7,2 			# load t2 with compare value 2 (last 2 bytes count of message to be received)
	bleu t0,x7,BBYTES2 		# branch to label BYTES2 if t0 is equal or lower than t2 (t2 = 2) , if condition meets we have reached last 2 bytes 
R11:
	la x10,R16_I2C_STAR1 		# copy contents of I2C_STAT1 register to x11
	lw x11,0(x10) 			# copy to x11 contents I2C_STAT1
	andi x11,x11,(1<<6) 		# and x11 with RxNE bit6 mask (receive buffer not empty)
	beqz x11,R11 			# wait till RxNE is set ( data arrived in data register)

	la x10,R16_I2C_DATAR 		# set pointer to I2C data register
	lb x15,0(x10) 			# copy contents of I2C data register to x15
	sb x15,0(t1) 			# store received byte in x15 to address pointed by t1 register (buffer here)
	addi t1,t1,1 			# increase buffer address + 1
	addi t0,t0,-1 			# decrease counter of received bytes
	bleu t0,x7,BBYTES2 		# branch to label BYTES2 if t0 is equal or lower than t2 (t2 = 2) , if condition meets we have reached last 2 bytes 
	j R11 				# if not reached last 2 bytes jump back to R2 to receive bytes
BBYTES2: 				# reach here if the read has reached last 2 bytes of the message
	la x10,R16_I2C_STAR1 		# status register1
	lh x11,0(x10) 			# copy to x11 I2C_STAT0 register
	andi x11,x11,(1<<6) 		# check RxNE bit6 is set by anding x11
	beqz x11,BBYTES2 		# wait till RxNE is set by looping
	la x10,R16_I2C_DATAR 		# set pointer to I2C data register
	lb x15,0(x10) 			# copy contents of I2C data register to x15
	sb x15,0(t1) 			# store 2nd last byte in x15 to memory location buffer
	addi t1,t1,1 			# increase buffer address + 1
	call CLEAR_ACK 			# clear ACK bit so that master will send NAK to stop slave from sending data after next byte
	call I2C_STOP 			# set STOP bit to terminate I2C operation after next byte (last one)
BBYTES1: # last byte
	la x10,R16_I2C_STAR1 		# set pointer x10 to I2C status register1
	lh x11,0(x10) 			# copy contents to x11
	andi x11,x11,(1<<6) 		# check RxNE bit6 is set by anding x11
	beqz x11,BBYTES1 		# sit in tight loop till RxNE sets
	la x10,R16_I2C_DATAR 		# set pointer to I2C data register
	lb x15,0(x10) 			# copy last byte transmitted from slave to I2C data register to x15
	sb x15,0(t1) 			# store byte in x15 to memory location buffer pointed by t0

	lw x12,24(sp)
	lw t0,20(sp)
	lw t2,16(sp)
	lw t1,12(sp)
	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,28
	ret

################################################################################

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


####################################################################################
# prints time i buffer (8 bytes --- HR:MN:Ss)
###################################################################################
	
print_time:
	addi sp,sp,-12		# push RA
	sw ra,0(sp)		# push RA
	sw x3,4(sp)
	sw a1,8(sp)
	li x3,8
	la a1,buffer
print_time_loop:
	lbu a5,0(a1)
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	addi a1,a1,1		# increase address by 16 , one char array
	addi x3,x3,-1		# increase t1 counter 1
	bnez x3,print_time_loop	# if a3 is not equal to t1 loop
	lw a1,8(sp)
	lw x3,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret

####################################################################################
# prints date in buffer (8 bytes --- DT:MT:YR)
###################################################################################
	
print_date:
	addi sp,sp,-12		# push RA
	sw ra,0(sp)		# push RA
	sw x3,4(sp)
	sw a1,8(sp)
	li x3,8
	la a1,buffer
print_date_loop:
	lbu a5,0(a1)
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	addi a1,a1,1		# increase address by 16 , one char array
	addi x3,x3,-1		# increase t1 counter 1
	bnez x3,print_date_loop	# if a3 is not equal to t1 loop
	lw a1,8(sp)
	lw x3,4(sp)
	lw ra,0(sp)
	addi sp,sp,12
	ret


#################################################################
print_week:
	addi sp,sp,-8
	sw ra,0(sp)
	sw a2,4(sp)
	la a2,week
sr_loop:
    	lb a5, 0(a2)             	# Load the current byte (character) into a1
    	beq a5, zero, end_loop   	# If character is null (0), exit the loop
	call select_font
	call DRAW_CHAR32
	call push_cursor1		# move cursor one box ahead for the next char
	addi a2,a2,1           		# increase address by 1 for next byte
	j sr_loop             		# Repeat the loop
end_loop:
	lw a2,4(sp)
	lw ra,0(sp)
	addi sp,sp,8
    	ret				# Exit the program
###################################################################################
#   clock_read ,,, before calling store address in t1, num of bytes in t0 
###################################################################################


clock_read:          		# store address in t1, num of bytes in t0 ,
	addi sp,sp,-4 		# push RA
	sw ra,0(sp) 		# push RA
	la t1,buffer 		# address of location buffer in SRAM
	#call I2C_BUSY 		# check weather I2C is busy ,wait till free
	call I2C_START 		# send start condition on I2C bus
	li a5, DS1307RAD 	# load register a0 with slave address (read), data to be sent is loaded in a0
	li t0,7 		# number of bytes to be received 
	call MULTI_READ 	# reads 7 bytes from RDA5807 and stores in buffer in litteendian format
	lw ra,0(sp) 		# POP RA
	addi sp,sp,4 		# pop RA
	ret


###############################################################################
# load clock address in a1 and data in buffer
################################################################################

clock_write: # data in buffer and address in a1
	addi sp,sp,-4 		# push RA
	sw ra,0(sp) 		# push RA
	call I2C_BUSY
	call I2C_START 		# send start condition on I2C bus
	li a5, DS1307WAD 	# load register a0 with slave address (write), data to be sent is loaded in a0
	call SEND_ADDRESS 	# call subroutine to send address
	mv a5,a1 		# move address of RDA to be written from a1 to a0
	call I2C_WRITE 		# call subroutine to transmit value loaded in a0
	la a2,buffer 		# load sram buffer address
	addi a2,a2,1 		# point to hi address
	lbu a5,0(a2) 		# load 1 byte(MSB)
	call I2C_WRITE 		# call subroutine to transmit value loaded in a0
	addi a2,a2,-1 		# decrease buffer address
	lbu a5,0(a2) 		# load 1 byte(LSB)
	call I2C_WRITE 		# call subroutine to transmit value loaded in a0
	call I2C_TX_COMPLETE 	# call subroutine that checks all transmission is completed
	call I2C_STOP 		# call subroutine to terminate I2C operation
	lw ra,0(sp) 		# POP RA
	addi sp,sp,4 		# pop RA
	ret
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
	andi x3,x3,0xf0
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
	la x5,mon
	la a1,week
	sw x5,0(a1)
	j dday
	
tuesday:
	la x5,tue
	la a1,week
	sw x5,0(a1)
	j dday

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
# seconds,minutes,hour,day,date,month,year
###################################################################################
menu:
	addi sp,sp,-4
	sw ra,0(sp)
	li x3,0			# load 0 in x3
	la s1,clock_display	# point s1 to clock_display (sram)
	sb x3,0(s1)		# store 0 seconds at clock_display0		
	call clear_screen	# clear OLED
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes2		# " adj minutes",0
	call string_reader	# send above sring to OLED
	call delay1S		#  second delay for display message
	call delay1S
	call clear_screen	# clear screen
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
	mv  x5, x3
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)		# load the sane BCD again to process the lower nibble
	andi x3,x3,0x0f		# extract the lower nibble by AND ing with 0x0f
	ori x3,x3,0x30		# OR with ASCII 0 to convert it to ascii char
	mv  x5, x3
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
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



	call clear_screen	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes1
	call string_reader
	call delay1S
	call delay1S
	call clear_screen	# clear screen
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
	mv  x5, x3
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	mv  x5, x3
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
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
	andi a3,a3,0x00000040			# and with 0x08 to isolate PA6 status
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



	call clear_screen	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes3				# save day
	call string_reader
	call delay1S
	call delay1S
	call clear_screen	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
day_start:
	li x4,7					# counter 24 for 24 hour
	la a2,number
	la s1,buffer
day_loop:
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	lb x3,0(a2)
	andi x3,x3,0xf0
	srli x3,x3,4
	ori x3,x3,0x30
	mv  x5, x3
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	mv  x5, x3
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
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
	andi a3,a3,0x00000040			# and with 0x08 to isolate PA6 status
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



	call clear_screen	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes6				# "adj date ",0
	call string_reader
	call delay1S
	call delay1S
	call clear_screen	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
date_start:
	li x4,31				# counter 12 for 12 month
	la a2,number
	la s1,buffer
date_loop:
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	lb x3,0(a2)
	andi x3,x3,0xf0
	srli x3,x3,4
	ori x3,x3,0x30
	mv  x5, x3
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	mv  x5, x3
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
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
	andi a3,a3,0x00000040			# and with 0x08 to isolate PA6 status
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




	call clear_screen	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes4				# "adj month ",0
	call string_reader			# display message in oled
	call delay1S				# delay 2 seconds for user
	call delay1S
	call clear_screen	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
month_start:
	li x4,12				# counter 12 for 12 month
	la a2,number				# load address of number array to be displayed from which user will select
	la s1,buffer				# load address of buffer
month_loop:
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	lb x3,0(a2)				# load a BCD number from array
	andi x3,x3,0xf0				# as BCD has 2digits encoded in byte ,and with 0xf0 to extract MSB
	srli x3,x3,4				# shift 4 right to isolate MSB into lower nibble
	ori x3,x3,0x30				# or with ascii 0 (0x30) to convert BCD to ASCII char
	mv  x5, x3
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)				# load same BCD again to process the lower byte of the number
	andi x3,x3,0x0f				# extract LSB by anding with 0x0f
	ori x3,x3,0x30				# convert to ascii by OR ing with 0x30
	mv  x5, x3
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
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
	andi a3,a3,0x00000040			# and with 0x08 to isolate PA6 status
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




	call clear_screen	# clear screen
	SETCURSOR 0, 0, 15, 31	# set OLED cursor to 0,0
	la a2,mes5				# "adj year ",0
	call string_reader
	call delay1S
	call delay1S
	call clear_screen	# clear screen
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
	mv  x5, x3
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
	call select_font
	call DRAW_CHAR32
	call push_cursor1	# move cursor one box ahead for the next char
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	mv  x5, x3
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
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
	andi a3,a3,0x00000040			# and with 0x08 to isolate PD4 status
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

clock_update:
	call I2C_BUSY 				# check weather I2C is busy ,wait till free
	call I2C_START 				# send start condition on I2C bus
	li a5,DS1307WAD 			# clock write address
	call SEND_ADDRESS 			# call subroutine to send address
	li a5,0x00 				# clock register 0x00 is set as pointer
	call I2C_WRITE 				# call subroutine to transmit value loaded in a5
	la a2,clock_display
	li x3,7
time_set_loop:
	lb a5,0(a2)
	call I2C_WRITE
	addi a2,a2,1
	addi x3,x3,-1
	bnez x3,time_set_loop
	call I2C_TX_COMPLETE # call subroutine that checks all transmission is completed
	call I2C_STOP # call subroutine to terminate I2C operation
	lw ra,0(sp)
	addi sp,sp,4
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
################################################################################
#display_day_buffer , assembles  day in buffer - day of week
#################################################################################
display_day_buffer:
	addi sp,sp,-16
	sw ra,0(sp)
	sw x4,4(sp)
	sw a2,8(sp)
	sw a3,12(sp)
	la a2,clock_display		# point address of clock display with a2
	addi a2,a2,8			# clock_display+6=day1 sec2byte,minute2byte,hour2byte,day1byte,date2byte,month2byte,year2byte









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
	addi sp,sp,-28
	sw ra,0(sp)
	sw a0,4(sp)
	sw a1,8(sp)
	sw x6,12(sp)
	sw x5,16(sp)
	sw x4,20(sp)
	sw x3,24(sp)

DF_ON:
	la x10,R32_GPIOC_BSHR		# R32_GPIOC_BSHR register sets and resets GPIOC pins, load address into pointer x10
	lw x11,0(x10)			# load contents to x11
	li x7,(1<<3)			# set pc3 by shifting 1 to bit position 4
	or x11,x11,x7			# OR with x11
	sw x11,0(x10)			# store x11 to R32_GPIOC_BSHR

	call I2C_START 		# send start condition on I2C bus
	li a5,DS1307WAD 	# radio random read address
	call SEND_ADDRESS 	# call subroutine to send address
	li a5,0x00 		# clock register 0x00 is set as pointer
	call I2C_WRITE 		# call subroutine to transmit value loaded in a0
	call clock_read 	# reads 7 bytes from clock register read into buffer (second,minute,hour,day,date,month,year)

	call load_DF_command
	loadPARAM CMD_RESET, 0x00, 0x00, 0x00   # initialize DF player
	call send_DF_commands
	call delay1S
	call load_DF_command
	loadPARAM CMD_SELECT_DEVICE, 0x00, 0x00, 0x02   # select SD card
	call send_DF_commands
	call delay1S
	call load_DF_command
	loadPARAM CMD_SET_VOLUME, 0x00, 0x00, 0x14   #Select device volume 20 = 0x14
	call send_DF_commands
	call delay1S	
	
	call load_DF_command
	loadPARAM CMD_PLAY_FOLDER_FILE, 0x00, 0x01, 0x00   #Select "now time" in folder 01 track 000
	call send_DF_commands
	call delay1S

	la a1,buffer
	addi a1,a1,2            # increment address pointer to 3rd byte hour
	lb x3,0(a1)
	andi x3,x3,0xf0
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
	call load_DF_command
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, 0x02, x6   #Select hour in folder 02
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
	call load_DF_command
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, 0x03, x6   #Select minute in folder 03
	call send_DF_commands
	call delay1S
	call delay1S

	call load_DF_command
	loadPARAM CMD_PLAY_FOLDER_FILE, 0x00, 0x04, 0x00   #Select "today" in folder 04 track 000
	call send_DF_commands
	call delay1S


	la a1,buffer
	addi a1,a1,3            # increment address pointer to 4th byte day
	lb x3,0(a1)
	andi x3,x3,0x0f
	mv x6,x3
	call load_DF_command
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, 0x05, x6   #Select day in folder 05
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
	call load_DF_command
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, 0x06, x6   #Select date in folder 06
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
	call load_DF_command
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, 0x07, x6   #Select month in folder 07
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
	call load_DF_command
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, 0x08, x6  #Select year in folder 08
	call send_DF_commands
	call delay1S
	call delay1S
DF_OFF:
	la x10,R32_GPIOC_BSHR		# R32_GPIOD_BSHR register sets and resets GPIOC pins, load address into pointer x10
	lw x11,0(x10)			# load contents to x11
	li x7,1<<19			# reset pc3 by shifting 1 into bit position 20 of R32_GPIOD_BSHR
	or x11,x11,x7			# OR with x11
	sw x11,0(x10)			# store x11 to R32_GPIOC_BSHR


	lw x3,24(sp)
	lw x4,20(sp)
	lw x5,16(sp)
	lw x6,12(sp)
	lw a1,8(sp)
	lw a0,4(sp)
	lw ra,0(sp)
	addi sp,sp,28
	ret


#########################################################################

.align 4
#########################################################################
#  USART ROUTINES
#########################################################################

USART_TX:
	addi sp,sp,-16			# add space in stack
	sw ra,0(sp)			# push ra
	sw x7,4(sp)			# push x7
	sw x10,8(sp)			# push x10
	sw x11,12(sp)			# push x11

	la x10,R32_USART_STATR		# load address of usart status register
	lw x11,0(x10)			# load contents of status register in x11
	andi x11,x11,(1<<7)		# mask out 7th bit, transmit buffer empty flag
	beqz x11,USART_TX		# if 0 transmit buffer full, wait until bit is set
	#li x8,0x30
	mv x7,x8			# move byte in x8 to x7
	la x10,R32_USART_DATAR		# x10 has the address of data register
	sb x7,0(x10)			#store byte in x7 to data register
TC_check:
	la x10,R32_USART_STATR		# get contents of status register again
	lw x11,0(x10)
	andi x11,x11,(1<<6)		# check transmit complete bit
	beqz x11,TC_check		# wait if bit is 0 , when transmit complete = 1
		
	lw x11,12(sp)			# pop x11
	lw x10,8(sp)			# pop x10
	lw x7,4(sp)			# pop x7
	lw ra,0(sp)			# pop ra
	addi sp,sp,16			# set SP back 16 bytes
	ret				# return to caller	



		
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

################################################################################################
# multiplication routine , multiplies a1 and a2 , used in PIXEL_REPEAT1 to calculate total pixels
###################################################################################################
soft_mul:			# 32 bit multiplication subroutine
	addi sp,sp,-32		# adjust stack pointer
	sw ra,0(sp)		# PUSH
	sw a0,4(sp)
	sw a1,8(sp)		# PUSH
	sw a2,12(sp)		# PUSH
	sw a3,16(sp)		# PUSH
	sw a4,20(sp)		# PUSH
	sw a5,24(sp)		# PUSH
	sw t0,28(sp)

#	li a1,0xffffffff 	# multiplicand
#	la t0,modulo		# point t0 to modulo register
#	lw a1,0(t0)		# copy remainder/modulo to a1 , multiplicand
# 	li a2,1000		# multiplier
 	li a3,0x00000000 	# result_lo
 	li a4,0x00000000 	# result_hi
	li a5,0			# working register 
 	beqz a1,load0
 	beqz a2,load0
 
 start1:
 	call ROR		# rotate right multiplier to test lsb is 0 or 1
 	bnez x3,multiply	# if lsb =1 branch to repeated adding of multiplicant to result register
 finishmul:
 	call RLL2		# shift multiplicand left or multiply by 2
 	beqz a2,exit_proc	# if a2 is 0 branch to exit_proc
 	J start1		# repeat loop
load0:
 	li a3,0
 exit_proc:
 	#j exit_proc
	la t0,result_lo		# point t0 to result_lo register
	sw a3,0(t0)		# store result of multiplication( modulo * 1000)
	la t0,result_hi		# point t0 to result_hi register to store carry
	sw a4,0(t0)		# store high byte result of multiplication( modulo * 1000)

	lw t0,28(sp)
	lw a5,24(sp)		# POP
	lw a4,20(sp)		# POP
	lw a3,16(sp)		# POP
	lw a2,12(sp)		# POP
	lw a1,8(sp)		# POP
	lw a0,4(sp)		# POP
	lw ra,0(sp)		# POP
	addi sp,sp,32
 	ret			# return to division routine
 multiply:
 	add a5,a3,a1		# add multiplicant to low result register and store final result in a5 for processing
 	sltu a0,a5,a3		# set a0 to 1 if result of addition a3:a1 i a5 is greater than a3
 	sltu x3,a5,a1		# set x3 to 1 if result of addition a3:a1 in a5 is greater than a1
 	or a0,a0,x3		# or a0 and x3 , if 1 carry if a0 = 0 no carry
 	bnez a0,carryset	# if a0 = 1 carry set, branch to label carry set
 	mv a3,a5		# result in working register copied to a3 low result register
 	J finishmul		# jump to label finishmul
 carryset:			# reach here only if carryset
 	mv a3,a5		# copy a5 to low result a3
 	addi a4,a4,1		# add carry to a4 high register result
 	J finishmul		# jump to label finishmul
 
 ROR:
 	li x3,0			# clear carry
 	mv t0,a2		# copy number in a2 to t0
 	andi t0,t0,1		# extract lsb is 0 or 1
 	beqz t0,zzz		# if lab is 0 branch to zzz
 	li x3,1		# if lsb is 1 carry occured , load 1 in carry register x3
 	srli a2,a2,1		# shift right a2 by 1 postion 
 	ret			# return to caller
 zzz:				# reach here if lsb =0
 	li x3,0			# load x3 0 indicating carry bit is 0
 	srli a2,a2,1		# right shift multiplier once. divide multiplier by 2
 	ret			# return to caller
 
 ROL:
 	li x3,0			# 
 	mv t0,a2
 	li x3,0x80000000
 	and t0,t0,x3
 	beqz t0,zzz1
 	li x3,1			# carry
 	slli a2,a2,1
 	ret
 zzz1:
 	li x3,0
 	slli a2,a2,1
 	ret
 
 RLL2:				# rotate left 2 registers a3:a5
 	mv a5,a4		# copy contents of a4 to a5
 	li x3,0			# clear x3
 	mv t0,a1		# copy multiplicant to t0
 	li x3 ,0x80000000	# load x3 MSB bitmask
 	and t0,t0,x3		# and with 0x800000000 to extract the MSB
 	bnez t0,OR1		# if MSB = 1 branch to OR1 label
 	slli a1,a1,1		# shift left 1 position a1 register ( multiplicant)
 	slli a5,a5,1		# shift left 1 position working register with value of a4 register ( multiplicant)
 	beqz a2,exit		# if multiplier register is 0 exit
 	mv a4,a5		# copy back the shifter multiplicant to a4
 	ret
 OR1:
 	mv a5,a4
 	slli a1,a1,1
 	slli a5,a5,1
 	li x3,1
 	or a5,a5,x3
 	beqz a2,exit
 	mv a4,a5
 	ret
exit:
	ret


##########################################################################################################
#
#	li t1,4				# t1 counter = 4
#	
#readloop2:
#	lb t2,3(x10)			# loads 1 byte to t2 from result
#	call bin_to_ascii		# convert bin to ascii
#	addi x10,x10,-1			# decrease pointer
#	addi t1,t1,-1			# decrease counter
#	bnez t1,readloop2		# loop till counter is 0
#	li x8,0x0d			# line feed
#	call USART_TX			# call uart
#	li x8,0x0a			# carriage feed
#	call USART_TX			# call uart
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
#################################################################################################
# PIXEL_REPEAT should be called after loading the y1,y0,x1,x0 pixel coordinates in variable XYC
# to print rectagle/line on LCD , automatically sets window
#################################################################################################

PIXEL_REPEAT1:
	addi sp,sp,-36			# move stack pointer 3 words
	sw ra,0(sp)			# push return address
	sw x5,4(sp)
	sw x6,8(sp)
	sw x7,12(sp)
	sw x8,16(sp)
	sw x10,20(sp)
	sw x11,24(sp)
	sw x12,28(sp)
	la x10,result_lo
	lw x7,0(x10)
	sw x7,32(sp)
	la x10,XYC
	lbu x5,0(x10)			# x0 from XYC
	addi x10,x10,1			# byte1
	lbu x6,0(x10)			# x1 from XYC
	beq x5,x6,only_lineH		# if X1 and x0 is same ,horizontal component is 0 , probably a vertical line ,branch to only_lineH
	sub x5,x6,x5			# x1-x0
	mv x11,x5			# x11 = a1 multiplicand
	J not_lineH			# x1 not = to x0 means this is a rectangle and not a line, jump to not_lineH
only_lineH:
	mv x11,x5			# x11 = a1 multiplicand
not_lineH:
	addi x10,x10,1			# byte2
	lbu x6,0(x10)			# y0
	addi x10,x10,1			# byte3
	lbu x7,0(x10)			# y1
	beq x7,x6,only_lineV
	sub x6,x7,x6			# y1-y0
	mv x12,x6			# x11 = a1 multiplicand
	j not_lineV
only_lineV:
	mv x12,x7			# x11 = a1 multiplicand
not_lineV:
	call soft_mul			# muliplication subroutine
	la x10,result_lo
	lw x5,0(x10)			# length ((x1-x0)*(y1-y0)) = total number of pixels to be written
	call setTFTwindow		# sets the write window for the calculated number of pixels in the given rectangle
repeat_pixel1:
	call TFTpixel			# writes single pixel
	addi x5,x5,-1			# reduce counter
	bnez x5,repeat_pixel1		# if counter is above 0 repeat writing pixel
	la x10,result_lo
	lw x7,32(sp)
	sw x7,0(x10)
	lw x12,28(sp)
	lw x11,24(sp)
	lw x10,20(sp)
	lw x8,16(sp)
	lw x7,12(sp)
	lw x6,8(sp)
	lw x5,4(sp)
	lw ra,0(sp)			# pop return address register
	addi sp,sp,36			# restore stack pointer to old position
	ret				# return to caller
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
	sb x11,0(x10)			# lo byte
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
# doubles 16x32 font to 32x64
#########################################################################################

DRAW_CHAR_DOUBLE:
	addi sp,sp,-32
	sw ra,0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
	sw x5,12(sp)
	sw x7,16(sp)
	sw x4,20(sp)
	sw x6,24(sp)
	sw x12,28(sp)
	la x10,counter
	li x11,4
	sw x11,0(x10)
	la x10,state
	lw x11,0(x10)
#	la x11,A
	li x5,128
loadbyte1:
	li x4,8
	lbu x7,0(x11)
	addi x11,x11,1
	addi x5,x5,-1
	beqz x5,font_finish1
repeat_column:
	la x10,counter
	lw x12,0(x10)
	addi x12,x12,-1
	sw x12,0(x10)
	li x6,2
	beq x12,x6,reset_pointer
	bnez x12,extract1
#######	addi x11,x11,2
	la x10,counter
	li x6,4
	sw x6,0(x10)
extract1:
	andi x6,x7,0x80
	beqz x6,BGW1
	call FONT_COLOUR1
	slli x7,x7,1
	addi x4,x4,-1
	bnez x4,extract1
	j loadbyte1
BGW1:
	call BG_COLOUR1
	slli x7,x7,1
	addi x4,x4,-1
	bnez x4,extract1
	j loadbyte1
font_finish1:
	lw x12,28(sp)
	lw x6,24(sp)
	lw x4,20(sp)
	lw x7,16(sp)
	lw x5,12(sp)
	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,32
	ret


.align 4
BG_COLOUR1:
	addi sp,sp,-16
	sw ra, 0(sp)
	sw x10,4(sp)
	sw x11,8(sp)
	sw x7,12(sp)
	la x11,FONTCOLOR
	la x10,XYCOLOUR
	addi x10,x10,3			# point to byte3 ,colour hi byte stored here
	addi x11,x11,1			# back ground colour hibyte for font stored here
	lb x7,0(x11)
	sb x7,0(x10)			# hi byte
	addi x10,x10,-1
	addi x11,x11,-1
	lb x7,0(x11)
	sb x11,0(x10)			# lo byte
	call TFTpixel
	call TFTpixel
	lw x7,12(sp)
	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,16
	ret
	
.align 4
FONT_COLOUR1:
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
	call TFTpixel
	lw x7,12(sp)
	lw x11,8(sp)
	lw x10,4(sp)
	lw ra,0(sp)
	addi sp,sp,16
	ret
reset_pointer:
	addi x11,x11,-2
	j extract1
######################################################################################

fillCircle:
	addi sp,sp,-36
	sw ra,0(sp)
	sw x7,4(sp)
	sw x8,8(sp)
	sw x9,12(sp)
	sw x10,16(sp)
	sw x11,20(sp)
	sw x12,24(sp)
	sw x13,28(sp)
	sw x14,32(sp)
	la x10,buffer2
	lb x7,0(x10)			# radius
	mv a1,x7			# radius ,X11
	mv a2,x7			# radius ,x12
	call soft_mul			# radius square
	la x10,result_lo		# result in result_lo = radius square
	la x11,buffer1			# place to store r^2 in buffer1
	lw x7,0(x10)			# copy from result_lo
	sw x7,0(x11)			# store radius square in buffer1
	li x7,0				# i ,i counter initiated in x7 .0 to radius max
circle_loop:
	mv a1,x7			# move new value of i to a1 for squaring with softmul routine
	mv a2,x7			# move new value of i to a1 for squaring with softmul routine
	call soft_mul			# soft_mul multiplies value in (a1 & a2)x11 & x12 , result will be stored in result_lo
	la x10,buffer1			# square of r
	la x11,result_lo		# square of i 
	lw x8,0(x10)			# square of r in x8
	lw x9,0(x11)			# square of i in x9
	sub x10,x8,x9			# rsq -isq store in x10, value to be rooted in x10
	call floor_sqrt			# length of base in result_lo
	la x11,result_lo		# result_lo holds the base = sqrt operation
	lw x9,0(x11)			# base in x9
	la x14,buffer2			# radius ,x ,y stored in buffer2
	lb x10,0(x14)			# radius in x10
	addi x14,x14,1			# point x14 to byte1 which holds y
	lb x11,0(x14)			# x11 is loaded with byte1 ,y. x and y are same and can be used alterntely	
	sub x12,x11,x9			# starting of line is (x-base) (x0 of horizontal line) in x12
	add x13,x11,x7			# position of y of upper horizontal line from center,(y+i) , new y in x13
	add x14,x9,x9			# end of horizontal line x1 is (base x 2)+ x0, (base +base)+x0 = x1
	add x14,x14,x12			# (base +base)+x0 = x1
	la x10,XYC			# holds pixel coordinates of horizontal line 
	sb x12,0(x10)			# x0
	addi x10,x10,1
	sb x14,0(x10)			# x1
	addi x10,x10,1
	sb x13,0(x10)			# y0
	addi x10,x10,1
	sb x13,0(x10)			# y1
	call PIXEL_REPEAT1		# prints pixels based on the cordinates in XYC
	la x11,result_lo		# result_lo holds the base = sqrt operation
	lw x9,0(x11)			# base in x9
	la x14,buffer2			# radius ,x ,y stored in buffer2
	lb x10,0(x14)			# radius in x10
	addi x14,x14,1			# point x14 to byte1 which holds y
	lb x11,0(x14)			# x11 is loaded with byte1 ,y. x and y are same and can be used alterntely	
	sub x12,x11,x9			# starting of line is (x-base) (x0 of horizontal line) in x12
	sub x13,x11,x7			# position of y of upper horizontal line from center,(y-i) , new y in x13
	add x14,x9,x9			# end of horizontal line x1 is base x 2, base +base = x1
	add x14,x14,x12			# (base +base)+x0 = x1
	la x10,XYC
	sb x12,0(x10)			# x0
	addi x10,x10,1
	sb x14,0(x10)			# x1
	addi x10,x10,1
	sb x13,0(x10)			# y0
	addi x10,x10,1
	sb x13,0(x10)			# y1
	call PIXEL_REPEAT1
	addi x7,x7,1			# increase i by 1 count till the length of radius r
	la x10,buffer2
	lb x12,0(x10)			# load radius in x12
	bne x7,x12,circle_loop		# if i is less than radius loop back to circle_loop
	lw x14,32(sp)
	lw x13,28(sp)
	lw x12,24(sp)
	lw x11,20(sp)
	lw x10,16(sp)
	lw x9,12(sp)
	lw x8,8(sp)
	lw x7,4(sp)
	lw ra,0(sp)
	addi sp,sp,36
	ret
############################################################################################

# needs value in x10, square root in result_lo
floor_sqrt:
	addi sp,sp,-28
	sw ra,0(sp)
	sw x5,4(sp)
	sw x7,8(sp)
	sw x8,12(sp)
	sw x10,16(sp)
	sw x13,20(sp)
	sw x14,24(sp)
        li   x5, 0            # unsigned int s = 0;
        li   x8, 1            # unsigned int i = 1;t1
        slli x8, x8, 15       # i = i << 15
for_next_bit:
        beqz x8, next_bit_end # if i == 0 goto next_bit_end
        add  x7, x5, x8       # t2 = s + i
#        mul  t3, t2, t2       # t3 = (t2)^2 = (s+i)^2
	mv a1,x7
	mv a2,x7
	call soft_mul
	
	la x13,result_lo
	lw x14,0(x13)

        bltu x10, x14, if_x_is_less_than_t3     # if a0 < t3 then don't add
        add  x5, x5, x8       # s = s + i
	
if_x_is_less_than_t3:
        srli x8, x8, 1        # i = i >> 1
        j for_next_bit        # goto for_next_bit
next_bit_end: 
	
	mv x10, x5
	la x7,result_lo
	sw x10,0(x7)
        lw x14,24(sp)
        lw x13,20(sp)
        lw x10,16(sp)
	lw x8,12(sp)
        lw x7,8(sp)
        lw x5,4(sp)
        lw ra,0(sp)
        addi sp,sp,28
        ret

#########################################################################
# D_ASCII subroutine for converting binary in result1 to DECIMAL (ASCII)
#########################################################################

D_ASCII:			
	addi sp,sp,-32		# adjust stack pointer
	sw ra,28(sp)		# PUSH
	sw x15,24(sp)		# PUSH
	sw x11,20(sp)		# PUSH
	sw x8,16(sp)		# PUSH
	sw x7,12(sp)		# PUSH
	sw x5,8(sp)		# PUSH
	sw x4,4(sp)		# PUSH
	sw t1,0(sp)		# PUSH
	li x4,0			# clear register
	li x5,0			# clear register
	li x7,0			# clear register
	li x8,0			# clear register
	li x15,0		# clear register
	
	la x10,result1		# result1
	lw x4,0(x10)		# copy result1 to x4
#	li x4,0xffffffff	# 32bit word to be converted into ascii chars
	li x7,1000000000	# divisor
Y1:
	sub x8,x4,x7		# subtract divisor from word to be converted
	sltu x5,x4,x7		# if result negative set x5 to indicate cannot be divided
	bnez x5,X1		# if result negative(not divisible) branch to X1
	mv x4,x8		# else move remainder to x4 for further division/subtraction
	addi x15,x15,1		# increase result by 1
	j Y1			# jump to label Y1 till not divisible
X1:
	addi x15,x15,0x30	# add ascii 0 to result to convert to ASCII char
	la x10,mem		# set pointer x10 to SRAM register mem to store the byte
	sb x15,0(x10)		# store byte in mem+0
	li x15,0		# clear result
	li x7,100000000		# load x7 with new divisor
Y2:
	sub x8,x4,x7		# subtract divisor from word to be converted
	sltu x5,x4,x7		# if result negative set x5 to indicate cannot be divided
	bnez x5,X2		# if result negative(not divisible) branch to X2
	mv x4,x8		# else move remainder to x4 for further division/subtraction
	addi x15,x15,1		# increase result by 1
	j Y2			# jump to label Y2 till not divisible
X2:
	addi x15,x15,0x30	# add ascii 0 to result to convert to ASCII char
	addi x10,x10,1		# set pointer x10 to SRAM register mem+1 to store the byte
	sb x15,0(x10)		# store byte in mem+1
	li x15,0		# clear result
	li x7,10000000		# load x7 with new divisor
Y3:
	sub x8,x4,x7		# subtract divisor from word to be converted
	sltu x5,x4,x7		# if result negative set x5 to indicate cannot be divided
	bnez x5,X3		# if result negative(not divisible) branch to X3
	mv x4,x8		# else move remainder to x4 for further division/subtraction
	addi x15,x15,1		# increase result by 1
	j Y3			# jump to label Y3 till not divisible
X3:
	addi x15,x15,0x30	# add ascii 0 to result to convert to ASCII char
	addi x10,x10,1		# set pointer x10 to SRAM register mem+2 to store the byte
	sb x15,0(x10)		# store byte in mem+2
	li x15,0		# clear result
	li x7,1000000		# load x7 with new divisor
Y4:
	sub x8,x4,x7		# subtract divisor from word to be converted
	sltu x5,x4,x7		# if result negative set x5 to indicate cannot be divided
	bnez x5,X4		# if result negative(not divisible) branch to X4
	mv x4,x8		# else move remainder to x4 for further division/subtraction
	addi x15,x15,1		# increase result by 1
	j Y4			# jump to label Y4 till not divisible
X4:
	addi x15,x15,0x30	# add ascii 0 to result to convert to ASCII char
	addi x10,x10,1		# set pointer x10 to SRAM register mem+3		
	sb x15,0(x10)		# store byte in mem+3
	li x15,0		# clear result
	li x7,100000		# load x7 with new divisor
Y5:
	sub x8,x4,x7		# subtract divisor from word to be converted
	sltu x5,x4,x7		# if result negative set x5 to indicate cannot be divided
	bnez x5,X5		# if result negative(not divisible) branch to X5
	mv x4,x8		# else move remainder to x4 for further division/subtraction
	addi x15,x15,1		# increase result by 1
	j Y5			# jump to label Y5 till not divisible
X5:
	addi x15,x15,0x30	# add ascii 0 to result to convert to ASCII char
	addi x10,x10,1		# set pointer x10 to SRAM register mem+4 to store the byte
	sb x15,0(x10)		# store byte in mem+4
	li x15,0		# clear result
	li x7,10000		# load x7 with new divisor
Y6:
	sub x8,x4,x7		# subtract divisor from word to be converted
	sltu x5,x4,x7		# if result negative set x5 to indicate cannot be divided
	bnez x5,X6		# if result negative(not divisible) branch to X6
	mv x4,x8		# else move remainder to x4 for further division/subtraction
	addi x15,x15,1		# increase result by 1
	j Y6			# jump to label Y6 till not divisible
X6:
	addi x15,x15,0x30	# add ascii 0 to result to convert to ASCII char
	addi x10,x10,1		# set pointer x10 to SRAM register mem+5 to store the byte
	sb x15,0(x10)		# store byte in mem+5
	li x15,0		# clear result
	li x7,1000		# load x7 with new divisor
Y7:
	sub x8,x4,x7		# subtract divisor from word to be converted
	sltu x5,x4,x7		# if result negative set x5 to indicate cannot be divided
	bnez x5,X7		# if result negative(not divisible) branch to X7
	mv x4,x8		# else move remainder to x4 for further division/subtraction
	addi x15,x15,1		# increase result by 1
	j Y7			# jump to label Y7 till not divisible
X7:
	addi x15,x15,0x30	# add ascii 0 to result to convert to ASCII char
	addi x10,x10,1		# set pointer x10 to SRAM register mem+6 to store the byte
	sb x15,0(x10)		# store byte in mem+6
	li x15,0		# clear result
	li x7,100		# load x7 with new divisor
Y8:
	sub x8,x4,x7		# subtract divisor from word to be converted
	sltu x5,x4,x7		# if result negative set x5 to indicate cannot be divided
	bnez x5,X8		# if result negative(not divisible) branch to X8
	mv x4,x8		# else move remainder to x4 for further division/subtraction
	addi x15,x15,1		# increase result by 1
	j Y8			# jump to label Y8 till not divisible
X8:
	addi x15,x15,0x30	# add ascii 0 to result to convert to ASCII char
	addi x10,x10,1		# set pointer x10 to SRAM register mem+7 to store the byte
	sb x15,0(x10)		# store byte in mem+7
	li x15,0		# clear result
	li x7,10		# load x7 with new divisor
Y9:
	sub x8,x4,x7		# subtract divisor from word to be converted
	sltu x5,x4,x7		# if result negative set x5 to indicate cannot be divided
	bnez x5,X9		# if result negative(not divisible) branch to X9
	mv x4,x8		# else move remainder to x4 for further division/subtraction
	addi x15,x15,1		# increase result by 1
	j Y9			# jump to label Y9 till not divisible
X9:
	addi x15,x15,0x30	# add ascii 0 to result to convert to ASCII char
	addi x10,x10,1		# set pointer x10 to SRAM register mem+8 to store the byte
	sb x15,0(x10)		# store byte in mem+8
	li x15,0		# clear result
	mv x15,x4
X10:
	addi x15,x15,0x30	# add ascii 0 to result to convert to ASCII char
	addi x10,x10,1		# set pointer x10 to SRAM register mem+9 to store the byte	
	sb x15,0(x10)		# store byte in mem+9

	lw t1,0(sp)		# POP
	lw x4,4(sp)		# POP
	lw x5,8(sp)		# POP
	lw x7,12(sp)		# POP
	lw x8,16(sp)		# POP
	lw x11,20(sp)		# POP
	lw x15,24(sp)		# POP
	lw ra,28(sp)		# POP
	addi sp,sp,32		# adjust stack pointer
	ret			# return to caller
##############################################################################################
##############################################################################################
# Prints 10 bytes from result1 to USART with lead 0 suppress, values to be stored in mem0-mem9
##############################################################################################
print:
	addi sp,sp,-20		# adjust stack pointer
	sw ra,16(sp)		# PUSH
	sw x11,12(sp)		# PUSH
	sw x10,8(sp)		# PUSH
	sw x8,4(sp)		# PUSH
	sw t1,0(sp)		# PUSH

	li x11,scratch		# point x11 to scratch register in SRAM
	sw zero,0(x11)		# clear scratch register
	li x10,mem		# point to address mem ,top byte stored in mem0 lowest byte in mem+9, need to print top byte 1st
	li t1,0			# byte counter loaded with 10 , total 10 bytes to be printed (0-9)
	li x8,10		# max count of 10bytes in x8

	la x15,scratchpad	# macro num_chars will store number of characters to be printed in scratchpad byte0
	lb x7,0(x15)		# load x7 with number of chars to be pprinted
	sub x8,x8,x7		# subtract total char count and number to be printed
	add x10,x10,x8		# increase address of mem pointer to diffrence of above
	mv t1,x8		# adjust the counter also to the count matching address
	add x8,x8,x7		# restore total count desired
Z1:
	lb x15,0(x10)		# load byte from mem, msb to lsb
	li x4,0x30		# load ascii 0 in x4
	beq x15,x4,supress0	# if result1 byte in x15 is equal to ascii 0 in x4 branch to suppress0 label
	li x11,scratch		# point x11 to scratch if x8 is not 0,that means we have found the 1st byte that is not 0, all leading 0s finished
	li x5,1			# load x5 with 1
	sw x5,0(x11)		# store in scratch register in sram , used as a flag to indicate all leading 0s are finished
print1:
	addi x10,x10,1		# increase the address by 1 byte
	addi t1,t1,1		# increase the byte counter once
	call select_font	# font is selected and stored in state
	call DRAW_CHAR32
	call push_cursor1
	bne t1,x8,Z1		# if t1 not equal to 10 as loaded in x8 loop back to print1 till al 10 bytes are transmitted via usart
	lw t1,0(sp)		# POP
	lw x8,4(sp)		# POP
	lw x10,8(sp)		# POP
	lw x11,12(sp)		# POP
	lw ra,16(sp)		# POP
	addi sp,sp,20		# adjust stack pointer
	ret			# return to caller
supress0:
	li x11,scratch		# point x11 to scratch	
	lw x5,0(x11)		# copy value of scratch to x5
	bnez x5,no_more_supress	# if x5 is not 0 branch to label "no_more_supress"
	li x8,0x20		# if x5 is 0 load x8 with space/blank	
	li x4,9			# load x4 with value 9, suppose the whole value is 0, we dont want to display blank space, test this is 9th byte 2nd last byte
	beq t1,x4,last0is0	# if t1 equals 9 in x4 branch to label "last0is0" which will keep last 0 as 0 on screen
no_more_supress:
	J print1		# no 0 suppression jump to print1	
last0is0:
	li x15,0x30		# load ascii 0 for last 0
	J print1		# jump to print1

#######################################################################################
show_memory:
	addi sp,sp,-20
	sw ra,0(sp)
	sw t1,4(sp)
	sw t2,8(sp)
	sw x8,12(sp)
	sw x10,16(sp)

	la x10,XYC
	li t1,4				# t1 counter = 4
readloop2:
	lb t2,3(x10)			# loads 1 byte to t2 from result
	call bin_to_ascii		# convert bin to ascii
	addi x10,x10,-1			# decrease pointer
	addi t1,t1,-1			# decrease counter
	bnez t1,readloop2		# loop till counter is 0
	li x8,0x0d			# line feed
	call USART_TX			# call uart
	li x8,0x0a			# carriage feed
	call USART_TX			# call uart

	lw x10,16(sp)
	lw x8,12(sp)
	lw t2,8(sp)
	lw t1,4(sp)
	lw ra,0(sp)
	addi sp,sp,20
	ret

show_register:
	addi sp,sp,-20
	sw ra,0(sp)
	sw t1,4(sp)
	sw t2,8(sp)
	sw x8,12(sp)
	sw x10,16(sp)


	la x10,scratch
	mv t1,sp
	sw t1,0(x10)
	li t1,4				# t1 counter = 4
readloop1:
	lb t2,3(x10)			# loads 1 byte to t2 from result
	call bin_to_ascii		# convert bin to ascii
	addi x10,x10,-1			# decrease pointer
	addi t1,t1,-1			# decrease counter
	bnez t1,readloop1		# loop till counter is 0
	li x8,0x0d			# line feed
	call USART_TX			# call uart
	li x8,0x0a			# carriage feed
	call USART_TX			# call uart

	lw x10,16(sp)
	lw x8,12(sp)
	lw t2,8(sp)
	lw t1,4(sp)
	lw ra,0(sp)
	addi sp,sp,20
	ret

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
mes1:.asciz  "adj hour "
mes2:.asciz  "adj min "
mes3:.asciz  "adj day "
mes4:.asciz  "adj month "
mes5:.asciz  "adj year "
mes6:.asciz  "adj date "
mon:.asciz "Monday"
tue:.asciz "Tuesday"
wed:.asciz "Wednesdy"
thu:.asciz "Thursday"
fri:.asciz "Friday"
sat:.asciz "Saturday"
sun:.asciz "Sunday"
.align 4
base_DF_command: .byte 0x7e,0xff,0x06,0x00,0x00,0x00,0x00,0xef








