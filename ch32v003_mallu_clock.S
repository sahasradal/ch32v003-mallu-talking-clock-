#include ch32v003_reg1.asm
#system clock is internal RC oscillator 24mhz, default PCLK - 24/3 = 8 Mhz
#=======================================================================================    
#I2C_SCL 		= PC2 # I2C  clock on PC2 (reccomended external pullup 4.7k)
#I2C_SDA 		= PC1 # I2C  data on PC1 (reccomended external pullup 4.7k)
#UART_TX		= PD5
#UART_RX                = PD6
#save switch  		= PD3
#next switch  		= PD4
#adjust switch  	= PD0
#show_date switch  	= PD1
#voice_switch           = PD2
#========================================================================================
#riscv32-unknown-elf-as -g ch32v003_mallu_clock.S -o ch32v003_mallu_clock.o
#riscv32-unknown-elf-ld -T CH32V003.ld -Map=final.map ch32v003_mallu_clock.O
#riscv32-unknown-elf-objcopy -O ihex a.out ch32v003_mallu_clock.hex




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


.equ R32_PWR_CTLR, 0x40007000 #Power control register
.equ R32_PWR_CSR, 0x40007004 #Power control/status register
.equ R32_PWR_AWUCSR, 0x40007008 #Auto-wakeup control/status register
.equ R32_PWR_AWUWR, 0x4000700C #Auto-wakeup window comparison value register
.equ R32_PWR_AWUPSC, 0x40007010 #Auto-wakeup crossover factor register
.equ R32_RCC_CTLR, 0x40021000 #Clock control register 0x0000xx83
.equ R32_RCC_CFGR0, 0x40021004 #Clock configuration register 0 0x00000000
.equ R32_RCC_INTR, 0x40021008 #Clock interrupt register 0x00000000
.equ R32_RCC_APB2PRSTR, 0x4002100C #APB2 peripheral reset register 0x00000000
.equ R32_RCC_APB1PRSTR, 0x40021010 # APB1 peripheral reset register 0x00000000
.equ R32_RCC_AHBPCENR, 0x40021014 #AHB peripheral clock enable register 0x00000014
.equ R32_RCC_APB2PCENR, 0x40021018 #APB2 peripheral clock enable register 0x00000000
.equ R32_RCC_APB1PCENR, 0x4002101C #APB1 peripheral clock enable register 0x00000000
.equ R32_RCC_RSTSCKR, 0x40021024   #Control/status register

.equ R16_IWDG_CTLR, 0x40003000 #Control register 0x0000
.equ R16_IWDG_PSCR, 0x40003004 #Prescaler register 0x0000
.equ R16_IWDG_RLDR, 0x40003008 #Reload register 0x0FFF
.equ R16_IWDG_STATR, 0x4000300C #Status register

.equ R16_WWDG_CTLR, 0x40002C00 #Control register 0x007F
.equ R16_WWDG_CFGR, 0x40002C04 #Configuration Register 0x007F
.equ R16_WWDG_STATR, 0x40002C08 #Status Register

.equ R32_EXTI_INTENR, 0x40010400 #Interrupt enable register 0x00000000
.equ R32_EXTI_EVENR,  0x40010404 #Event enable register 0x00000000
.equ R32_EXTI_RTENR, 0x40010408 #Rising edge trigger enable register 0x00000000
.equ R32_EXTI_FTENR, 0x4001040C #Falling edge trigger enable register 0x00000000
.equ R32_EXTI_SWIEVR, 0x40010410 #Soft interrupt event register 0x00000000
.equ R32_EXTI_INTFR, 0x40010414 #Interrupt flag register

.equ R32_PFIC_ISR1, 0xE000E000 #PFIC interrupt enable status register 1
.equ R32_PFIC_ISR2, 0xE000E004 #PFIC interrupt enable status register 2 
.equ R32_PFIC_IPR1, 0xE000E020 #PFIC interrupt pending status register 1 
.equ R32_PFIC_IPR2, 0xE000E024 #PFIC interrupt pending status register 2 
.equ R32_PFIC_ITHRESDR, 0xE000E040 #PFIC interrupt priority threshold configuration register
.equ R32_PFIC_CFGR, 0xE000E048 #PFIC interrupt configuration register
.equ R32_PFIC_GISR, 0xE000E04C #PFIC interrupt global status register 
.equ R32_PFIC_VTFIDR, 0xE000E050 #PFIC VTF interrupt ID configuration register
.equ R32_PFIC_VTFADDRR0, 0xE000E060 #PFIC VTF interrupt 0 offset address register
.equ R32_PFIC_VTFADDRR1, 0xE000E064 #PFIC VTF interrupt 1 offset address register
.equ R32_PFIC_IENR1, 0xE000E100 #PFIC interrupt enable setting register 1 
.equ R32_PFIC_IENR2, 0xE000E104 #PFIC interrupt enable setting register 2 
.equ R32_PFIC_IRER1, 0xE000E180 #PFIC interrupt enable clear register 1 
.equ R32_PFIC_IRER2, 0xE000E184 #PFIC interrupt enable clear register 2 
.equ R32_PFIC_IPSR1, 0xE000E200 #PFIC interrupt pending setting register 1 
.equ R32_PFIC_IPSR2, 0xE000E204 #PFIC interrupt pending setting register 2 
.equ R32_PFIC_IPRR1, 0xE000E280 #PFIC interrupt hang clear register 1 
.equ R32_PFIC_IPRR2, 0xE000E284 #PFIC interrupt hang clear register 2 
.equ R32_PFIC_IACTR1, 0xE000E300 #PFIC interrupt activation status register1
.equ R32_PFIC_IACTR2, 0xE000E304 #PFIC interrupt activation status register2
.equ R32_PFIC_IPRIOR1, 0xE000E400 #PFIC interrupt priority configuration register
.equ R32_PFIC_IPRIOR2, 0xE000E401 #PFIC interrupt priority configuration register
.equ R32_PFIC_SCTLR, 0xE000ED10 #PFIC system control register

.equ INTSYSCR, 0x804 #Interrupt System Control Register
.equ MTVEC, 0x305 #Exception Entry Base Address Register
.equ DBGMCU_CR, 0x7C0   #Debug MCU Configuration Register (CSR)
 
.equ R32_STK_CTLR, 0xE000F000 #System count control register 
.equ R32_STK_SR, 0xE000F004 #System count status register 
.equ R32_STK_CNTR, 0xE000F008 # System counter low register 
.equ R32_STK_CMPR, 0xE000F010 #Counting comparison low register


.equ R32_GPIOA_CFGLR, 0x40010800 #PA port configuration register low 0x44444444
.equ R32_GPIOC_CFGLR, 0x40011000 #PC port configuration register low 0x44444444
.equ R32_GPIOD_CFGLR, 0x40011400 #PD port configuration register low 0x44444444
.equ R32_GPIOA_INDR, 0x40010808 #PA port input data register 0x0000XXXX
.equ R32_GPIOC_INDR, 0x40011008 #PC port input data register 0x0000XXXX
.equ R32_GPIOD_INDR, 0x40011408 #PD port input data register 0x0000XXXX
.equ R32_GPIOA_OUTDR, 0x4001080C #PA port output data register 0x00000000
.equ R32_GPIOC_OUTDR, 0x4001100C #PC port output data register 0x00000000
.equ R32_GPIOD_OUTDR, 0x4001140C #PD port output data register 0x00000000
.equ R32_GPIOA_BSHR, 0x40010810 #PA port set/reset register 0x00000000
.equ R32_GPIOC_BSHR, 0x40011010 #PC port set/reset register 0x00000000
.equ R32_GPIOD_BSHR, 0x40011410 #PD port set/reset register 0x00000000
.equ R32_GPIOA_BCR, 0x40010814 #PA port reset register 0x00000000
.equ R32_GPIOC_BCR, 0x40011014 #PC port reset register
.equ R32_GPIOD_BCR, 0x40011414 #PD port reset register 0x00000000
.equ R32_GPIOA_LCKR, 0x40010818 #PA port configuration lock register 0x00000000
.equ R32_GPIOC_LCKR, 0x40011018 #PC port configuration lock register 0x00000000
.equ R32_GPIOD_LCKR, 0x40011418 #PD port configuration lock register 
.equ R32_AFIO_PCFR1, 0x40010004 #AFIO Remap Register 1
.equ R32_AFIO_EXTICR, 0x40010008 #External interrupt configuration register 1

.equ R32_DMA_INTFR, 0x40020000 #DMA interrupt status register 0x00000000
.equ R32_DMA_INTFCR, 0x40020004 #DMA interrupt flag clear register 0x00000000
.equ R32_DMA_CFGR1, 0x40020008 #DMA channel 1 configuration register 0x00000000
.equ R32_DMA_CNTR1, 0x4002000C #DMA channel 1 number of data register
.equ R32_DMA_PADDR1, 0x40020010 #DMA channel 1 peripheral address register 0x00000000
.equ R32_DMA_MADDR1, 0x40020014 #DMA channel 1 memory address register 0x00000000
.equ R32_DMA_CFGR2, 0x4002001C #DMA channel 2 configuration register 0x00000000
.equ R32_DMA_CNTR2, 0x40020020 #DMA channel 2 number of data register 0x00000000
.equ R32_DMA_PADDR2, 0x40020024 #DMA channel 2 peripheral address register 0x00000000
.equ R32_DMA_MADDR2, 0x40020028 #DMA channel 2 memory address register 0x00000000
.equ R32_DMA_CFGR3, 0x40020030 #DMA channel 3 configuration register 0x00000000
.equ R32_DMA_CNTR3, 0x40020034 #DMA channel 3 number of data register 0x00000000
.equ R32_DMA_PADDR3, 0x40020038 #DMA channel 3 peripheral address register 0x00000000
.equ R32_DMA_MADDR3, 0x4002003C #DMA channel 3 memory address register 0x00000000
.equ R32_DMA_CFGR4, 0x40020044 #DMA channel 4 configuration register 0x00000000
.equ R32_DMA_CNTR4, 0x40020048 #DMA channel 4 number of data register 0x00000000
.equ R32_DMA_PADDR4, 0x4002004C #DMA channel 4 peripheral address register 0x00000000
.equ R32_DMA_MADDR4, 0x40020050 #DMA channel 4 memory address register 0x00000000
.equ R32_DMA_CFGR5, 0x40020058 #DMA channel 5 configuration register 0x00000000
.equ R32_DMA_CNTR5, 0x4002005C #DMA channel 5 number of data register 0x00000000
.equ R32_DMA_PADDR5, 0x40020060 #DMA channel 5 peripheral address register 0x00000000
.equ R32_DMA_MADDR5, 0x40020064 #DMA channel 5 memory address register 0x00000000
.equ R32_DMA_CFGR6, 0x4002006C #DMA channel 6 configuration register 0x00000000
.equ R32_DMA_CNTR6, 0x40020070 #DMA channel 6 number of data register 0x00000000
.equ R32_DMA_PADDR6, 0x40020074 #DMA channel 6 peripheral address register 0x00000000
.equ R32_DMA_MADDR6, 0x40020078 #DMA channel 6 memory address register 0x00000000
.equ R32_DMA_CFGR7, 0x40020080 #DMA channel 7 configuration register 0x00000000
.equ R32_DMA_CNTR7, 0x40020084 #DMA channel 7 number of data register 0x00000000
.equ R32_DMA_PADDR7, 0x40020088 #DMA channel 7 peripheral address register 0x00000000
.equ R32_DMA_MADDR7, 0x4002008C #DMA channel 7 memory address register


.equ R32_ADC_STATR, 0x40012400 #ADC status register 0x00000000
.equ R32_ADC_CTLR1, 0x40012404 #ADC control register 1 0x00000000
.equ R32_ADC_CTLR2, 0x40012408 #ADC control register 2 0x00000000
.equ R32_ADC_SAMPTR1, 0x4001240C #ADC sample time register 1 0x00000000
.equ R32_ADC_SAMPTR2, 0x40012410 #ADC sample time register 2 0x00000000
.equ R32_ADC_IOFR1, 0x40012414 #ADC injected channel data offset register 1 0x00000000
.equ R32_ADC_IOFR2, 0x40012418 #ADC injected channel data offset register 2 0x00000000
.equ R32_ADC_IOFR3, 0x4001241C #ADC injected channel data offset register 3 0x00000000
.equ R32_ADC_IOFR4, 0x40012420 #ADC injected channel data offset register 4 0x00000000
.equ R32_ADC_WDHTR, 0x40012424 #ADC watchdog high threshold register 0x00000000
.equ R32_ADC_WDLTR, 0x40012428 #ADC watchdog low threshold register 0x00000000
.equ R32_ADC_RSQR1, 0x4001242C #ADC regular sequence register 1 0x00000000
.equ R32_ADC_RSQR2, 0x40012430 #ADC regular sequence register 2 0x00000000
.equ R32_ADC_RSQR3, 0x40012434 #ADC regular sequence register 3 0x00000000
.equ R32_ADC_ISQR, 0x40012438 #ADC injected sequence register 0x00000000
.equ R32_ADC_IDATAR1, 0x4001243C #ADC injected data register 1 0x00000000
.equ R32_ADC_IDATAR2, 0x40012440 #ADC injected data register 2 0x00000000
.equ R32_ADC_IDATAR3, 0x40012444 #ADC injected data register 3 0x00000000
.equ R32_ADC_IDATAR4, 0x40012448 #ADC injected data register 4 0x00000000
.equ R32_ADC_RDATAR, 0x4001244C #ADC regular data register 0x00000000
.equ R32_ADC_DLYR, 0x40012450 #ADC delayed data register


.equ R16_TIM1_CTLR1, 0x40012C00 #Control register 1 0x0000
.equ R16_TIM1_CTLR2, 0x40012C04 #Control register 2 0x0000
.equ R16_TIM1_SMCFGR, 0x40012C08 #Slave mode control register 0x0000
.equ R16_TIM1_DMAINTENR, 0x40012C0C #DMA/interrupt enable register 0x0000
.equ R16_TIM1_INTFR, 0x40012C10 #Interrupt status register 0x0000
.equ R16_TIM1_SWEVGR, 0x40012C14 #Event generation register 0x0000
.equ R16_TIM1_CHCTLR1, 0x40012C18 #Compare/capture control register 1 0x0000
.equ R16_TIM1_CHCTLR2, 0x40012C1C #Compare/capture control register 2 0x0000
.equ R16_TIM1_CCER, 0x40012C20 #Compare/capture enable register 0x0000
.equ R16_TIM1_CNT, 0x40012C24 #Counters 0x0000
.equ R16_TIM1_PSC, 0x40012C28 #Counting clock prescaler 0x0000
.equ R16_TIM1_ATRLR, 0x40012C2C #Auto-reload value register 0x0000
.equ R16_TIM1_RPTCR, 0x40012C30 #Recurring count value register 0x0000
.equ R16_TIM1_CH1CVR, 0x40012C34 #Compare/capture register 1 0x0000
.equ R16_TIM1_CH2CVR, 0x40012C38 #Compare/capture register 2 0x0000
.equ R16_TIM1_CH3CVR, 0x40012C3C #Compare/capture register 3 0x0000
.equ R16_TIM1_CH4CVR, 0x40012C40 #Compare/capture register 4 0x0000
.equ R16_TIM1_BDTR, 0x40012C44 #Brake and deadband registers 0x0000
.equ R16_TIM1_DMACFGR, 0x40012C48 #DMA control register 0x0000
.equ R16_TIM1_DMAADR, 0x40012C4C #DMA address register for continuous mode


.equ R16_TIM2_CTLR1, 0x40000000 #TIM2 control register1 0x0000
.equ R16_TIM2_CTLR2, 0x40000004 #TIM2 control register2 0x0000
.equ R16_TIM2_SMCFGR, 0x40000008 #TIM2 Slave mode control register 0x0000
.equ R16_TIM2_DMAINTENR, 0x4000000C #TIM2 DMA/interrupt enable register
.equ R16_TIM2_INTFR, 0x40000010 #TIM2 interrupt status register 0x0000
.equ R16_TIM2_SWEVGR, 0x40000014 #TIM2 event generation register 0x0000
.equ R16_TIM2_CHCTLR1, 0x40000018 #TIM2 compare/capture control register1 0x0000
.equ R16_TIM2_CHCTLR2, 0x4000001C #TIM2 compare/capture control register2 0x0000
.equ R16_TIM2_CCER, 0x40000020 #TIM2 compare/capture enable register 0x0000
.equ R16_TIM2_CNT, 0x40000024 #TIM2 counter 0x0000
.equ R16_TIM2_PSC, 0x40000028 #TIM2 count clock prescaler 0x0000
.equ R16_TIM2_ATRLR, 0x4000002C #TIM2 auto-reload register 0x0000
.equ R16_TIM2_CH1CVR, 0x40000034 #TIM2 compare/capture register1 0x0000
.equ R16_TIM2_CH2CVR, 0x40000038 #TIM2 compare/capture register2 0x0000
.equ R16_TIM2_CH3CVR, 0x4000003C #TIM2 compare/capture register3 0x0000
.equ R16_TIM2_CH4CVR, 0x40000040 #TIM2 compare/capture register4 0x0000
.equ R16_TIM2_DMACFGR, 0x40000048 #TIM2 DMA control register 0x0000
.equ R16_TIM2_DMAADR, 0x4000004C #TIM2 DMA address register in continuous mode
  

.equ R32_USART_STATR, 0x40013800 #UASRT status register 0x000000C0
.equ R32_USART_DATAR, 0x40013804 #UASRT data register 0x000000XX
.equ R32_USART_BRR, 0x40013808 #UASRT baud rate register 0x00000000
.equ R32_USART_CTLR1, 0x4001380C #UASRT control register 1 0x00000000
.equ R32_USART_CTLR2, 0x40013810 #UASRT control register 2 0x00000000
.equ R32_USART_CTLR3, 0x40013814 #UASRT control register 3 0x00000000
.equ R32_USART_GPR, 0x40013818 #UASRT protection time and prescaler register


.equ R16_I2C_CTLR1, 0x40005400 #I2C control register 1 0x0000
.equ R16_I2C_CTLR2, 0x40005404 #I2C control register 2 0x0000
.equ R16_I2C_OADDR1, 0x40005408 #I2C address register 1 0x0000
.equ R16_I2C_OADDR2, 0x4000540C #I2C address register 2 0x0000
.equ R16_I2C_DATAR,  0x40005410 #I2C data register 0x0000
.equ R16_I2C_STAR1,  0x40005414 #I2C status register 1 0x0000
.equ R16_I2C_STAR2,  0x40005418 #I2C status register 2 0x0000
.equ R16_I2C_CKCFGR, 0x4000541C #I2C clock register

.equ R16_SPI_CTLR1, 0x40013000 #SPI Control register1 0x0000
.equ R16_SPI_CTLR2, 0x40013004 #SPI Control register2 0x0000
.equ R16_SPI_STATR, 0x40013008 #SPI Status register 0x0002
.equ R16_SPI_DATAR, 0x4001300C #SPI Data register 0x0000
.equ R16_SPI_CRCR,  0x40013010 #SPI Polynomial register 0x0007
.equ R16_SPI_RCRCR, 0x40013014 #SPI Receive CRC register 0x0000
.equ R16_SPI_TCRCR, 0x40013018 #SPI Transmit CRC register 0x0000
.equ R16_SPI_HSCR,  0x40013024 #SPI High-speed control register

.equ R16_ESIG_FLACAP, 0x1FFFF7E0 #Flash capacity register 0xXXXX
.equ R32_ESIG_UNIID1, 0x1FFFF7E8 #UID register 1 0xXXXXXXXX
.equ R32_ESIG_UNIID2, 0x1FFFF7EC #UID register 2 0xXXXXXXXX
.equ R32_ESIG_UNIID3,  0x1FFFF7F0 #UID register 3 

.equ R32_FLASH_ACTLR, 0x40022000 #Control register
.equ R32_FLASH_KEYR,  0x40022004 #FPEC key register X
.equ R32_FLASH_OBKEYR, 0x40022008 #OBKEY register X
.equ R32_FLASH_STATR, 0x4002200C #Status register 0x00008000
.equ R32_FLASH_CTLR,  0x40022010 #Configuration register 0x00008080
.equ R32_FLASH_ADDR, 0x40022014 #Address register X
.equ R32_FLASH_OBR,  0x4002201C #Select word register 0x03FFFFFE
.equ R32_FLASH_WPR,  0x40022020 #Write protection register 0xFFFFFFF
.equ R32_FLASH_MODEKEYR,0x40022024 #Extended key register X
.equ R32_FLASH_BOOT_MODEKEYR,0x40022028 #Unlock BOOT key register

.equ R32_EXTEN_CTR, 0x40023800 #Configure extended control registers

.equ PFIC_KEY1, 0xFA050000
.equ PFIC_KEY2, 0xBCAF0000
.equ PFIC_KEY3, 0xBEEF0000
.equ mstatus, 0x300
.equ mtvec, 0x305
.equ intsyscr, 0x804
.equ mepc, 0x341

.equ  SYSTICK_SR_CNTIF, (1<<0)
.equ  SYSTICK_CTLR_STE , (1<<0)
.equ  SYSTICK_CTLR_STIE, (1<<1)
.equ  SYSTICK_CTLR_STCLK, (1<<2)
.equ  SYSTICK_CTLR_STRE,  (1<<3)
.equ  SYSTICK_CTLR_SWIE, (1<<31) 

##/*--------------Control Command DF MP3 player--------------*/
.equ CMD_NEXT,              0x01 # Next song
.equ CMD_PERVIOUS,          0x02 #Previous song
.equ CMD_PLAY_INDEX,        0x03 # Play with i song (i: 1 -> 255)
.equ CMD_VOLUME_UP,         0x04 # Volume up
.equ CMD_VOLUME_DOWN,       0x05 # Volume down
.equ CMD_SET_VOLUME,        0x06 # Set volume (0 -> 30)
.equ CMD_SINGLE_CYCLE_PLAY, 0x08 # Single cycle play
.equ CMD_SELECT_DEVICE,     0x09 # Select storage device (microSD: 2)
.equ CMD_SLEEP_MODE,        0x0A # Chip enters sleep mode
.equ CMD_WAKE_UP,           0x0B # Chip wakes up
.equ CMD_RESET,             0x0C # Chip reset
.equ CMD_PLAY,              0x0D # Play
.equ CMD_PAUSE,             0x0E # Pause
.equ CMD_PLAY_FOLDER_FILE,  0x0F # Play the song with folder and song name
.equ CMD_STOP,              0x16 # Stop
.equ CMD_CYCLE_FOLDER,      0x17 # Cycle play with folder name
.equ CMD_SHUFFLE_PLAY,      0X18 # Shuffle Play
.equ CMD_SET_SINGLE_CYCLE,  0x19 # Set single cycle play
.equ CMD_PLAY_VOLUME,       0x22 # Set the volume and play the second
##/*---------------Query Command DF MP3 player---------------*/
.equ CMD_QUERY_STATUS,            0x42 # Query current state
.equ CMD_QUERY_VOLUME,            0x43 # Query volume
.equ CMD_QUERY_TOTAL_SONG,        0x48 # Query the total number of songs
.equ CMD_QUERY_SONG,              0x4C # Query the current song
.equ CMD_QUERY_TOTAL_SONG_FOLDER, 0x4E # Query the total number of songs in the current folder
.equ CMD_QUERY_TOTAL_FOLDER,      0x4F # Query the total number of folder

.equ fclk,  24000000
.equ OLEDaddress,  0x78
.equ command,  0x00
.equ data_cmd,  0x40
.equ OLED_INIT_LEN,  15    
.equ font_length,  16
.equ DS1307WAD , 0xD0
.equ DS1307RAD , 0xD1
.equ read_data_len , 7


.equ buffer,   0x20000004
.equ buffer1,  0x20000008
.equ buffer2,  0x2000000C
.equ buffer3,  0x20000010
.equ clock_display,   0x20000014
.equ clock_display1,  0x20000018 # stores 1 second measure window overflow for slow signals
.equ clock_display2,  0x2000001C
.equ clock_display3,  0x20000020
.equ result1,  0x20000024
.equ result2,  0x20000028 
.equ result3,  0x2000002C
.equ mem,  0x20000030 # 10 bytes used by print function from 0(mem)
.equ mem1,  0x20000034 # till 9(mem) , 2 bytes in mem1
.equ tthousand, 0x20000038
.equ thousand, 0x2000003C
.equ hundred, 0x20000040
.equ ten, 0x20000044
.equ point,  0x20000048
.equ one, 0x2000004C
.equ m , 0x20000050




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


.align 2
.text
.global start
start:

    li sp, STACK 			# load stack pointer with stack end address

        

I2C_INIT:

#Enable GPIO clocks & AFIO in APB2 clock register
        
    	la x10,R32_RCC_APB2PCENR 	# load address of APB2PCENR register to x10 ,for enabling GPIO A,D,C peripherals
	lw x11,0(x10) 			# load contents from peripheral register R32_RCC_APB2PCENR pointed by x10
	li x7,((1<<2)|(1<<4)|(1<<5)|(1<<0)|(1<<11)|(1<<14)) # 1<<IOPA_EN,1<<IOPC_EN,1<<IOPD_EN,1<<USART_EN,1<<TIM1_EN,1<<AFIOEN, enable port A,C,D and AFIO functions
	or x11,x11,x7 			# or values 
	sw x11,0(x10) 			# store modified enable values in R32_RCC_APB2PCENR

#Enable I2C clock in  APB1 register
    
    	la x10,R32_RCC_APB1PCENR 	# load address of APB1PCENR register to x10 ,for enabling I2C peripheral
	lw x11,0(x10) 			# load contents from peripheral register R32_RCC_APB1PCENR pointed by x10
	li x7,(1<<21) 			# 1<<I2C1_EN, = 1<<21 for I2C functions
	or x11,x11,x7 			# or values 
	sw x11,0(x10) 
###########
 
#configure GPIO PortC as multiplex open drain output for I2C
	la x10,R32_GPIOC_CFGLR 		# load pointer x10 with address of R32_GPIOC_CFGLR , I2C SDA & SCL is on portC PC1,PC2
	lw x11,0(x10) 			# load contents from register pointed by x10
	li x7,~((0xf<<4)|(0xf<<8)) 	# clear pc1,pc2. we need to setup PC1 & PC2 for I2C
	and x11,x11,x7 			# clear  mode and cnf bits for selected pin C1,C2
	li x7,((13<<4)|(13<<8)) 	# PC1 = multiplex open drain output 10mhz ,PC2= multiplex open drain output 10mhz, 0b1101
	or x11,x11,x7 			# OR value to register
	sw x11,0(x10) 			# store in R32_GPIOD_CFGLR
######################
#configure GPIO D 5,6 for UART
	la x10,R32_GPIOD_CFGLR		# load pointer x10 with address of R32_GPIOD_CFGLR , GPIO configuration register
	lw x11,0(x10)			# load contents from register pointed by x10
	li x7,~((0xf<<20)|(0xf<<24))	# clear pd5,pd6. we need to setup PD5 & PD6 for usart tx and rx and pd4 for ETR
	and x11,x11,x7			# clear pd5,pd6 mode and cnf bits for selected pin D4,D5,D6
	li x7,((0x8<<24)|(0xB<<20))	# pd6 = input with PU/PD,pd5= multiplex pushpull output 50mhz,pd4 as floating input
	or x11,x11,x7			# OR value to register
	sw x11,0(x10)			# store in R32_GPIOD_CFGLR

######################

#configure GPIO PortD as pullup input for switches on 0,1,2,3,4
	la x10,R32_GPIOD_CFGLR		# load pointer x10 with address of R32_GPIOC_CFGLR , I2C SDA & SCL is on portC PC1,PC2
	lw x11,0(x10)			# load contents from register pointed by x10
	li x7,0xfff00000		# PD4,3,2,1 ,0 as pullup , 7,5,6, remains same
	and x11,x11,x7			# clear  mode and cnf bits for selected pin PD4,3,2,1 ,0
	li x7,0x00088888 		# PD4,3,2,1 ,0 as pullup ,7,6,5 remains same
	or x11,x11,x7			# OR value to register
	sw x11,0(x10)			# store in R32_GPIOD_CFGLR

	la x10,R32_GPIOD_OUTDR		# output register D, enable 1 in ODR for pUllup with input in pullup/down MODE
	lw x11,0(x10)			# we need 4,3,2,1,0 as pullup 
	li x7,0x0000005f		# write 1 in GPIOD_OUTDR to enable pull up resistor while GPIOD 4,3,2,1,0 are in pull input mode, RX pin 6 also pull up
	or x11,x11,x7
	sw x11,0(x10)

############
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

DFINIT:
example:

	la x10,mes6			# load address of label "name" to x10, string to be transmitted
string_loop:
	lb x8,0(x10)			# load 1 byte from 0 offset of "name"
	beqz x8,finish			# if byte in x8 null branch to label "finish"
	call USART_TX			# call subroutine USART_TX to transmit byte
	addi x10,x10,1			# increase pointer by 1 byte
	j string_loop			# jump back to label string_loop until null is encountered
finish:
	call load_DF_command
	loadPARAM CMD_RESET, 0x00, 0x00, 0x00   # initialize DF player
	call send_DF_commands

	call delay1S
	call delay1S
	call delay1S

	call load_DF_command
	loadPARAM CMD_SELECT_DEVICE, 0x00, 0x00, 0x02   # select SD card
	call send_DF_commands

	call delay1S

	call load_DF_command
	loadPARAM CMD_SET_VOLUME, 0x00, 0x00, 0x14   #Select device volume 20 = 0x14
	call send_DF_commands

	call delay1S


main_loop:
################################
# OLED initialization 	       #
################################	
	call I2C_BUSY		# check weather I2C is busy ,wait till free
	call I2C_START		# send start condition on I2C bus
	li a5,OLEDaddress
	call SEND_ADDRESS	# call subroutine to send address
	li a5, command	        # load register a5 with slave address (write), data to be sent is loaded in a0
	call I2C_WRITE		# call subroutine to transmit value loaded in a0
	la t0,OLED_INIT_BYTES	# load address of O_LED init values
	li t1,OLED_INIT_LEN	# load number of init bytes in the array
initloop0:
	lbu  x3,0(t0)		# lsb loaded in x4 , t0 has the array address and used as pointer
	addi t0,t0,1		# increase pointer 1 byte
	lbu x4,0(t0)		# msb loaded in x5
	addi t0,t0,1		# increase pointer 1 byte
	mv a5,x3		# move value in t5 to a0,lsb
	call I2C_WRITE		# call subroutine to transmit value loaded in a0
	addi t1,t1,-1		# decrease message/array counter
	beqz t1,loopexit0	# if init length becomes 0 exit loop by jumping to label "loopexit0"
	mv a5,x4		# move value in t4 to a0,msb
	call I2C_WRITE		# call subroutine to transmit value loaded in a0
	addi t1,t1,-1		# decrease message/array counter
	bnez t1,initloop0	# loop till t1 is 0 , all bytes will be transmitted when 0
loopexit0:
	call I2C_TX_COMPLETE	# call subroutine that checks all transmission is completed
	call I2C_STOP		# call subroutine to terminate I2C operation
	call delay10ms		# approx 10ms delay
	call clear_OLED		# clears OLED screen
	la a2,welcome		# display welcome message "Hello World!"
	call string_reader	# display routine
	call delay1S		# 1 second delay
	call delay1S		# 1 second delay
	call clear_OLED		# clears OLED screen
#####################################
check_sw:
	la a4,R32_GPIOD_INDR	# load a4 with PortD base address
	lw a3,0(a4)		# load a3 with contents of portD Istatus
	andi a3,a3,0x00000001	# and with 0x01 to isolate PD0 status
	bnez a3,date_sw		# if 1 branch to label no menu. If PD0 pressed time set menu is called else go to time display/update
	call menu		# calls routine to 
date_sw:
	la a4,R32_GPIOD_INDR	# load a4 with PortD base address
	lw a3,0(a4)		# load a3 with contents of portD Istatus
	andi a3,a3,0x00000002	# and with 0x02 to isolate PD1 status
	bnez a3,voice_sw	# if 1 branch to label no menu. If PD1 pressed time set menu is called else go to time display/update
	call show_date		# calls routine to 
voice_sw:
	la a4,R32_GPIOD_INDR	# load a4 with PortD base address
	lw a3,0(a4)		# load a3 with contents of portD Istatus
	andi a3,a3,0x00000004	# and with 0x04 to isolate PD2 status
	bnez a3,show_time	# if 1 branch to label no menu. If PD2 pressed time set menu is called else go to time display/update
	call start_audio		# calls routine to
############
# Clock#####
############
show_time:
	call I2C_START 		# send start condition on I2C bus
	li a5,DS1307WAD 	# radio random read address
	call SEND_ADDRESS 	# call subroutine to send address
	li a5,0x00 		# clock register 0x00 is set as pointer
	call I2C_WRITE 		# call subroutine to transmit value loaded in a0
	call clock_read 	# reads 7 bytes from clock register 
	call BCD_ASCII		# converts BCD to ASCII values
	call time_buffer_for_OLED# rearranges converted ASCII characters in HR:MIN:SEC format, address clock display , 8 bytes for time 
	call set_cursor		# OLED cursor 00
	la s1,buffer		# time in buffer
	addi s1,s1,7		# 8 bytes stored in buffer in sequence sec:min:hr , print in reverse from high to low
	li x4,8			# counter 8 , 8 bytes to be printed on OLED
printloop0:
	call printchar
	addi x4,x4,-1		# reduce counter by 1 for each write
	addi s1,s1,-1           # decrease address by 1 for next byte
	bnez x4,printloop0	# loop till all time is written
	call delay1S		# wait for the next secondd to update in RTC
	j check_sw		# repeat the loop , checks whetehr adjust switch is pressed, date switch is pressed , then updates time in OLED

show_date:
	call display_date	# routine to transfer day,date,month and year to buffer from clock_display in proper screen order
	call set_cursor		# set cursor to coordinates 00
	la s1,buffer		# set print pointer to begining of buffer, print takes arguments for printing from buffer
	li x4,11		# counter 11 , 11 bytes to be printed on OLED
printloop1:
	call printchar		# call printing routine that sents foonts to OLED
	addi x4,x4,-1		# reduce counter by 1 for each write
	addi s1,s1, 1           # increase address by 1 for next byte
	bnez x4,printloop1	# loop till 11 bytes are transmitted
	call delay1S		# 5 second delay for displaying date and week day in screen.
	call delay1S
	call delay1S
	call delay1S
	call delay1S
	call clear_OLED		# clear OLED
	j check_sw		# repeat loop by displaying time and polling switches ,D5 , D4

# end of main loop
#####################


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
##########################################################################################################
# converts 1 byte into ASCII represented hexadecimal value , value in t2 for UART , not used in this clock
##########################################################################################################
bin_to_hexascii:
	addi sp,sp,-20
	sw ra,0(sp)
	sw a0,4(sp)
	sw a3,8(sp)
	sw a4,12(sp)
	sw x8,16(sp)
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
	j exit_bin_to_hexascii
letter2:
	addi a3,a3,0x37
	#mv a0,a3
	mv x8,a3
	call USART_TX
exit_bin_to_hexascii:
	lw x8,16(sp)
	lw a4,12(sp)
	lw a3,8(sp)
	lw a0,4(sp)
	lw ra,0(sp)
	addi sp,sp,20
	ret
########################################################################################################################################################
# OLED proc to send data or command
#############################################################

oled_command_write:
	addi sp,sp,-4		# push RA
	sw ra,0(sp)		# push RA
	call I2C_BUSY		# check weather I2C is busy ,wait till free
	call I2C_START		# send start condition on I2C bus
	li a5,OLEDaddress
	call SEND_ADDRESS	# call subroutine to send address
	li a5, command	        # load register a0 with slave address (write), data to be sent is loaded in a0
	call I2C_WRITE		# call subroutine to transmit value loaded in a0
	lw ra,0(sp)		# POP RA
	addi sp,sp,4		# pop RA
	ret
oled_datacmd_write:
	addi sp,sp,-4		# push RA
	sw ra,0(sp)		# push RA
	call I2C_BUSY		# check weather I2C is busy ,wait till free
	call I2C_START		# send start condition on I2C bus
	li a5,OLEDaddress
	call SEND_ADDRESS	# call subroutine to send address
	li a5,data_cmd	        # load register a0 with slave address (write), data to be sent is loaded in a0
	call I2C_WRITE		# call subroutine to transmit value loaded in a0
	lw ra,0(sp)		# POP RA
	addi sp,sp,4		# pop RA
	ret

#####################################################################
##############################################################################
# OLED setting cursor to address00
##############################################################################

set_cursor:
	addi sp,sp,-4		# push RA
	sw ra,0(sp)		# push RA
	call oled_command_write
	li a5,0x22
	call I2C_WRITE
	mv a5,zero		#position y
	call I2C_WRITE
	li a5,3
	call I2C_WRITE

	li a5,0x21
	call I2C_WRITE
	mv a5,zero		#position x
	call I2C_WRITE
	li a5,0x7f
	call I2C_WRITE
	call I2C_TX_COMPLETE
	call I2C_STOP
	lw ra,0(sp)		# POP RA
	addi sp,sp,4		# pop RA
	ret



#########################################################################
######################################################
# OLED clears display
#######################################################

clear_OLED:
	addi sp,sp,-4		# push RA
	sw ra,0(sp)		# push RA
	li t2,4			# page OLED
#	call oled_datacmd_write
	call I2C_BUSY		# check weather I2C is busy ,wait till free
	call I2C_START		# send start condition on I2C bus
	li a5,OLEDaddress
	call SEND_ADDRESS	# call subroutine to send address
	li a5,data_cmd	        # load register a5 with slave address (write), data to be sent is loaded in a5
	call I2C_WRITE		# call subroutine to transmit value loaded in a5
loop3:
	li x3,128		# length OLED
loop4:
	andi a5,a5,0		# clear a5
	call I2C_WRITE
	addi x3,x3,-1		# decrease oled length
	bnez x3,loop4		# if t3 not 0 continue to loop4
loop5:
	addi t2,t2,-1		# decrease page counter
	bnez t2,loop3
	call I2C_TX_COMPLETE
	call I2C_STOP
	lw ra,0(sp)		# POP RA
	addi sp,sp,4		# pop RA
	ret

####################################################################################
# prints characters in SRAM pointed by register s1
###################################################################################
	
printchar:
	addi sp,sp,-16		# push RA
	sw ra,0(sp)		# push RA

	sw a2,4(sp)
	sw a3,8(sp)
	sw t1,12(sp)

	la a2,FONTS
	lbu a3,0(s1)
	li t1,0x20
	beq a3,t1,ASCII0
multiply:
	addi a2,a2,16		# increase address by 16 , one char array
	addi t1,t1,1		# increase t1 counter 1
	bne a3,t1,multiply	# if a3 is not equal to t1 loop
ASCII0:
	call I2C_BUSY		# check weather I2C is busy ,wait till free
	call I2C_START		# send start condition on I2C bus
	li a5,OLEDaddress
	call SEND_ADDRESS	# call subroutine to send address
	li a5,data_cmd	        # load register a0 with slave address (write), data to be sent is loaded in a5
	call I2C_WRITE		# call subroutine to transmit value loaded in a5
				# call oled_datacmd_write
	li x3,16		# length of character font array
	call array_read2
	call I2C_TX_COMPLETE	# call subroutine that checks all transmission is completed
	call I2C_STOP		# call subroutine to terminate I2C operation

	lw t1,12(sp)
	lw a3,8(sp)
	lw a2,4(sp)

	lw ra,0(sp)		# POP RA
	addi sp,sp,16		# pop RA
	ret

array_read2:
	addi sp,sp,-4		# push RA
	sw ra,0(sp)		# push RA
ar2loop:
	lbu t2,0(a2)		# a2 points to font array set in printchar routine
	addi a2,a2,1		# increase address pointer
	call double
	mv a5,t2		# copy stretched value to a5
	andi a5,a5,0xff		# keep only lsb
	call I2C_WRITE
	mv a5,t2
	srli a5,a5,8
	call I2C_WRITE
	addi x3,x3,-1		# array length counter is decreased
	bnez x3,ar2loop
	lw ra,0(sp)		# POP RA
	addi sp,sp,4		# pop RA
	ret


double:
	addi sp,sp,-20
	sw x3,16(sp)
	sw x4,12(sp)
	sw t1,8(sp)
	sw t0,4(sp)
	sw ra,0(sp)
	andi x4,x4,0		# stretched value will be in x4
	li x3,8			# number of bits to be doubled in x3
	add t1,t2,zero
shiftloop:	
	andi t0,t1,0x80		# 7th bit is tested
	bnez t0,bit1
	slli x4,x4,2		# shift 2 0 in x4
	slli t1,t1,1		# shift t1 by 1 position to left
	addi x3,x3,-1		# decrease counter
	bnez x3,shiftloop
	mv t2,x4		# move stretched value in x4 to t2 as x4 will be restored
	lw ra,0(sp)
	lw t0,4(sp)
	lw t1,8(sp)
	lw x4,12(sp)
	lw x3,16(sp)
	addi sp,sp,20
	ret
bit1:
	slli x4,x4,2		# shift left 2 current value to make space for 2 1s
	li t0,3			# load 00000011 in t0
	or x4,x4,t0		# or x4 wit to to place 2 bits at lsb
	slli t1,t1,1		# shift t1 by 1 position to left
	addi x3,x3,-1		# decrease counter
	bnez x3,shiftloop	# if counter not 0 repeat
	mv t2,x4		# move stretched value in x4 to t2 as x4 will be restored
	lw ra,0(sp)
	lw t0,4(sp)
	lw t1,8(sp)
	lw x4,12(sp)
	lw x3,16(sp)
	addi sp,sp,20
	ret
		
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
	addi sp,sp,-16
	sw ra,0(sp)
	sw a2,4(sp)
	sw x3,8(sp)
	sw a3,12(sp)
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

	#lb x3,0(a2)
	#andi x3,x3,0x07 	# bit2,bit1,bit0
	#ori x3,x3,0x30
	#sb x3,0(a3) 		# day = 1-7 , sunday to saturday
	#addi a3,a3,1

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
	andi x3,x3,0xf0 
	srli x3,x3,4
	ori x3,x3,0x30
	sb x3,0(a3) 		# 2nd month, 1
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

	lw a3,12(sp)
	lw x3,8(sp)
	lw a2,4(sp)
	lw ra,0(sp)
	addi sp,sp,16
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


#################################################################################
# reads a string with address loaded in s1,    la s1, my_string , uses s1 and x3 
####################################################################################
string_reader:
	addi sp,sp,-4
	sw ra,0(sp)
sr_loop:
    	lb x3, 0(a2)             	# Load the current byte (character) into a1
    	beq x3, zero, end_loop   	# If character is null (0), exit the loop
	la s1,buffer
	sb x3,0(s1)
    	call printchar
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
	call clear_OLED		# clear OLED
	call set_cursor		# set OLED cursor to 0,0
	la a2,mes2		# " adj minutes",0
	call string_reader	# send above sring to OLED
	call delay1S		#  second delay for display message
	call delay1S
	call clear_OLED		# clear screen
	call set_cursor		# set cursor to 00
min_start:
	li x4,59		# counter 59 for 60 minutes
	la a2,number		# point a2 to label number in ROM
	la s1,buffer		# point s1 to buffer in sram
min_loop:
	call set_cursor		# set cursor to 00
	lb x3,0(a2)		# load byte from BCD number array 0x00-0x99
	andi x3,x3,0xf0		# extract the top nibble
	srli x3,x3,4		# right shift 4 to get the nibble in the lower side
	ori x3,x3,0x30		# OR with 0x30(ascii0)to convert the nibble to ASCII char
	sb x3,0(s1)		# store in buffer
	call printchar		# call print cahar routine to display the 10th position of the number in OLED
	lb x3,0(a2)		# load the sane BCD again to process the lower nibble
	andi x3,x3,0x0f		# extract the lower nibble by AND ing with 0x0f
	ori x3,x3,0x30		# OR with ASCII 0 to convert it to ascii char
	sb x3,0(s1)		# store the unit portion of the number in buffer
	call printchar		# call print char  sub routine to display the 2nd digit
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



	call clear_OLED
	call set_cursor
	la a2,mes1
	call string_reader
	call delay1S
	call delay1S
	call clear_OLED
	call set_cursor
hour_start:
	li x4,24				# counter 24 for 24 hour
	la a2,number
	la s1,buffer
hour_loop:
	call set_cursor
	lb x3,0(a2)
	andi x3,x3,0xf0
	srli x3,x3,4
	ori x3,x3,0x30
	sb x3,0(s1)
	call printchar
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	sb x3,0(s1)
	call printchar
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



	call clear_OLED
	call set_cursor
	la a2,mes3				# save day
	call string_reader
	call delay1S
	call delay1S
	call clear_OLED
	call set_cursor
day_start:
	li x4,7					# counter 24 for 24 hour
	la a2,number
	la s1,buffer
day_loop:
	call set_cursor
	lb x3,0(a2)
	andi x3,x3,0xf0
	srli x3,x3,4
	ori x3,x3,0x30
	sb x3,0(s1)
	call printchar
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	sb x3,0(s1)
	call printchar
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



	call clear_OLED
	call set_cursor
	la a2,mes6				# "adj date ",0
	call string_reader
	call delay1S
	call delay1S
	call clear_OLED
	call set_cursor
date_start:
	li x4,31				# counter 12 for 12 month
	la a2,number
	la s1,buffer
date_loop:
	call set_cursor
	lb x3,0(a2)
	andi x3,x3,0xf0
	srli x3,x3,4
	ori x3,x3,0x30
	sb x3,0(s1)
	call printchar
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	sb x3,0(s1)
	call printchar
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




	call clear_OLED				# clear OLED screen
	call set_cursor				# set cursor 00
	la a2,mes4				# "adj month ",0
	call string_reader			# display message in oled
	call delay1S				# delay 2 seconds for user
	call delay1S
	call clear_OLED				# clear message in oled
	call set_cursor				# set cursor to 00
month_start:
	li x4,12				# counter 12 for 12 month
	la a2,number				# load address of number array to be displayed from which user will select
	la s1,buffer				# load address of buffer
month_loop:
	call set_cursor				# cursor at 00
	lb x3,0(a2)				# load a BCD number from array
	andi x3,x3,0xf0				# as BCD has 2digits encoded in byte ,and with 0xf0 to extract MSB
	srli x3,x3,4				# shift 4 right to isolate MSB into lower nibble
	ori x3,x3,0x30				# or with ascii 0 (0x30) to convert BCD to ASCII char
	sb x3,0(s1)				# store msb in buffer to call print routine
	call printchar				# call print routine to print msb on screen
	lb x3,0(a2)				# load same BCD again to process the lower byte of the number
	andi x3,x3,0x0f				# extract LSB by anding with 0x0f
	ori x3,x3,0x30				# convert to ascii by OR ing with 0x30
	sb x3,0(s1)				# store in buffer 0 , requirement for printing
	call printchar				# print lsb of number to OLED
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




	call clear_OLED
	call set_cursor
	la a2,mes5				# "adj year ",0
	call string_reader
	call delay1S
	call delay1S
	call clear_OLED
	call set_cursor
year_start:
	li x4,99				# counter 12 for 12 month
	la a2,number
	la s1,buffer
year_loop:
	call set_cursor
	lb x3,0(a2)
	andi x3,x3,0xf0
	srli x3,x3,4
	ori x3,x3,0x30
	sb x3,0(s1)
	call printchar
	lb x3,0(a2)
	andi x3,x3,0x0f
	ori x3,x3,0x30
	sb x3,0(s1)
	call printchar
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
#display_date , assembles date and day in buffer - day,date,month,year
#################################################################################
 display_date:
	addi sp,sp,-16
	sw ra,0(sp)
	sw x4,4(sp)
	sw a2,8(sp)
	sw a3,12(sp)
	la a2,clock_display		# point address of clock display with a2
	addi a2,a2,6			# clock_display+6=day1 sec2byte,minute2byte,hour2byte,day1byte,date2byte,month2byte,year2byte
	la a3,buffer			# point buffer with a3
	lb x4,0(a2)			# load byte from 7th byte of clockdisplay first char of day
	sb x4,0(a3) # 1st day		# store in start of buffer first char of day
	addi a2,a2,1			# increase clock display address
	addi a3,a3,1			# increase buffer address
	lb x4,0(a2)			# load 2nd char of day
	sb x4,0(a3) # 2nd day		# store 2nd char of day
	addi a3,a3,1			# increase bufffer 1 byte
	li x4,' '			# load space char in x4
	sb x4,0(a3) # space		# store space char in buffer
	addi a2,a2,1			# increase clock display address
	addi a3,a3,1			# increase bufffer 1 byte
	lb x4,0(a2)			# load 1st char of date
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
	addi sp,sp,-24
	sw ra,0(sp)
	sw a1,4(sp)
	sw x6,8(sp)
	sw x5,12(sp)
	sw x4,16(sp)
	sw x3,20(sp)

	call I2C_START 		# send start condition on I2C bus
	li a5,DS1307WAD 	# radio random read address
	call SEND_ADDRESS 	# call subroutine to send address
	li a5,0x00 		# clock register 0x00 is set as pointer
	call I2C_WRITE 		# call subroutine to transmit value loaded in a0
	call clock_read 	# reads 7 bytes from clock register read into buffer (second,minute,hour,day,date,month,year)
	
	
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

	lw x3,20(sp)
	lw x4,16(sp)
	lw x5,12(sp)
	lw x6,8(sp)
	lw a1,4(sp)
	lw ra,0(sp)
	addi sp,sp,24
	ret


#########################################################################
.section .rodata
.global CONSTANTS
.align 4



init_RDA: 
.byte 0xC1,0x03
.byte 0x00,0x00
.byte 0x0A,0x00
.byte 0x88,0x0f
.byte 0x00,0x00
.byte 0x42,0x02



OLED_INIT_BYTES:
.byte 0xa8,0x1f
.byte 0x20,0x01
.byte 0x21,0x00
.byte 0x7f,0x22
.byte 0x00,0x03
.byte 0xda,0x02
.byte 0x8d,0x14
.byte 0xaf,0x00

.align 4

.section .rodata
.global font



FONTS:
.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00    #space 0x21
.byte 0, 0, 0, 51, 0, 0, 0, 0, 0, 0, 0, 0, 248, 0, 48, 0 # !
.byte 0, 16, 0, 0, 16, 12, 0, 0, 12, 6, 0, 0, 6, 0, 0, 0 # "
.byte 64, 192, 0, 4, 192, 120, 4, 4, 120, 64, 4, 63, 64, 0, 63, 4 # #
.byte 0, 8, 0, 255, 112, 48, 0, 32, 136, 0, 30, 24, 252, 0, 33, 0 # $
.byte 240, 224, 0, 3, 8, 24, 30, 28, 240, 0, 33, 33, 0, 0, 30, 0 # %
.byte 0, 112, 16, 36, 240, 0, 33, 35, 8, 0, 39, 33, 136, 0, 25, 30 # &
.byte 16, 0, 22, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # '
.byte 0, 0, 0, 0, 0, 0, 224, 7, 24, 24, 4, 32, 2, 64, 0, 0 # (
.byte 0, 0, 2, 64, 4, 32, 24, 24, 224, 7, 0, 0, 0, 0, 0, 0 # )
.byte 64, 2, 64, 2, 128, 1, 240, 15, 128, 1, 64, 2, 64, 2, 0, 0 # *
.byte 0, 1, 0, 1, 0, 1, 240, 31, 0, 1, 0, 1, 0, 1, 0, 0 # +
.byte 0, 128, 0, 176, 0, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # ,
.byte 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 # -
.byte 0, 0, 0, 48, 0, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # .
.byte 0, 0, 0, 96, 0, 24, 0, 6, 128, 1, 96, 0, 24, 0, 4, 0 # /
.byte 0, 0, 224, 15, 16, 16, 8, 32, 8, 32, 16, 16, 224, 15, 0, 0 # 0
.byte 0, 0, 16, 32, 16, 32, 248, 63, 0, 32, 0, 32, 0, 0, 0, 0 # 1
.byte 0, 0, 112, 48, 8, 40, 8, 36, 8, 34, 136, 33, 112, 48, 0, 0 # 2
.byte 0, 0, 48, 24, 8, 32, 136, 32, 136, 32, 72, 17, 48, 14, 0, 0 # 3
.byte 0, 0, 0, 7, 192, 4, 32, 36, 16, 36, 248, 63, 0, 36, 0, 0 # 4
.byte 0, 0, 248, 25, 8, 33, 136, 32, 136, 32, 8, 17, 8, 14, 0, 0 # 5
.byte 0, 0, 224, 15, 16, 17, 136, 32, 136, 32, 24, 17, 0, 14, 0, 0 # 6
.byte 0, 0, 56, 0, 8, 0, 8, 63, 200, 0, 56, 0, 8, 0, 0, 0 # 7
.byte 0, 0, 112, 28, 136, 34, 8, 33, 8, 33, 136, 34, 112, 28, 0, 0 # 8
.byte 0, 0, 224, 0, 16, 49, 8, 34, 8, 34, 16, 17, 224, 15, 0, 0 # 9
.byte 0, 0, 0, 0, 0, 0, 192, 48, 192, 48, 0, 0, 0, 0, 0, 0 # :
.byte 0, 0, 0, 0, 0, 128, 128, 96, 0, 0, 0, 0, 0, 0, 0, 0 # ;
.byte 0, 0, 0, 1, 128, 2, 64, 4, 32, 8, 16, 16, 8, 32, 0, 0 # <
.byte 64, 4, 64, 4, 64, 4, 64, 4, 64, 4, 64, 4, 64, 4, 0, 0 # =
.byte 0, 0, 8, 32, 16, 16, 32, 8, 64, 4, 128, 2, 0, 1, 0, 0 # >
.byte 0, 0, 112, 0, 72, 0, 8, 48, 8, 54, 8, 1, 240, 0, 0, 0 # ?
.byte 192, 7, 48, 24, 200, 39, 40, 36, 232, 35, 16, 20, 224, 11, 0, 0 # @
.byte 0, 32, 0, 60, 192, 35, 56, 2, 224, 2, 0, 39, 0, 56, 0, 32 # A
.byte 8, 32, 248, 63, 136, 32, 136, 32, 136, 32, 112, 17, 0, 14, 0, 0 # B
.byte 192, 7, 48, 24, 8, 32, 8, 32, 8, 32, 8, 16, 56, 8, 0, 0 # C
.byte 8, 32, 248, 63, 8, 32, 8, 32, 8, 32, 16, 16, 224, 15, 0, 0 # D
.byte 8, 32, 248, 63, 136, 32, 136, 32, 232, 35, 8, 32, 16, 24, 0, 0 # E
.byte 8, 32, 248, 63, 136, 32, 136, 0, 232, 3, 8, 0, 16, 0, 0, 0 # F
.byte 192, 7, 48, 24, 8, 32, 8, 32, 8, 34, 56, 30, 0, 2, 0, 0 # G
.byte 8, 32, 248, 63, 8, 33, 0, 1, 0, 1, 8, 33, 248, 63, 8, 32 # H
.byte 0, 0, 8, 32, 8, 32, 248, 63, 8, 32, 8, 32, 0, 0, 0, 0 # I
.byte 0, 192, 0, 128, 8, 128, 8, 128, 248, 127, 8, 0, 8, 0, 0, 0 # J
.byte 8, 32, 248, 63, 136, 32, 192, 1, 40, 38, 24, 56, 8, 32, 0, 0 # K
.byte 8, 32, 248, 63, 8, 32, 0, 32, 0, 32, 0, 32, 0, 48, 0, 0 # L
.byte 8, 32, 248, 63, 248, 0, 0, 63, 248, 0, 248, 63, 8, 32, 0, 0 # M
.byte 8, 32, 248, 63, 48, 32, 192, 0, 0, 7, 8, 24, 248, 63, 8, 0 # N
.byte 224, 15, 16, 16, 8, 32, 8, 32, 8, 32, 16, 16, 224, 15, 0, 0 # O
.byte 8, 32, 248, 63, 8, 33, 8, 1, 8, 1, 8, 1, 240, 0, 0, 0 # P
.byte 224, 15, 16, 24, 8, 36, 8, 36, 8, 56, 16, 80, 224, 79, 0, 0 # Q
.byte 8, 32, 248, 63, 136, 32, 136, 0, 136, 3, 136, 12, 112, 48, 0, 32 # R
.byte 0, 0, 112, 56, 136, 32, 8, 33, 8, 33, 8, 34, 56, 28, 0, 0 # S
.byte 24, 0, 8, 0, 8, 32, 248, 63, 8, 32, 8, 0, 24, 0, 0, 0 # T
.byte 8, 0, 248, 31, 8, 32, 0, 32, 0, 32, 8, 32, 248, 31, 8, 0 # U
.byte 8, 0, 120, 0, 136, 7, 0, 56, 0, 14, 200, 1, 56, 0, 8, 0 # V
.byte 248, 3, 8, 60, 0, 7, 248, 0, 0, 7, 8, 60, 248, 3, 0, 0 # W
.byte 8, 32, 24, 48, 104, 44, 128, 3, 128, 3, 104, 44, 24, 48, 8, 32 # X
.byte 8, 0, 56, 0, 200, 32, 0, 63, 200, 32, 56, 0, 8, 0, 0, 0 # Y
.byte 16, 32, 8, 56, 8, 38, 8, 33, 200, 32, 56, 32, 8, 24, 0, 0 # Z
.byte 0, 0, 0, 0, 0, 0, 254, 127, 2, 64, 2, 64, 2, 64, 0, 0 # [
.byte 0, 0, 12, 0, 48, 0, 192, 1, 0, 6, 0, 56, 0, 192, 0, 0 # \
.byte 0, 0, 2, 64, 2, 64, 2, 64, 254, 127, 0, 0, 0, 0, 0, 0 # ]
.byte 0, 0, 0, 0, 4, 0, 2, 0, 2, 0, 2, 0, 4, 0, 0, 0 # ^
.byte 0, 128, 0, 128, 0, 128, 0, 128, 0, 128, 0, 128, 0, 128, 0, 128 # _
.byte 0, 0, 2, 0, 2, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0 # `
.byte 0, 0, 0, 25, 128, 36, 128, 34, 128, 34, 128, 34, 0, 63, 0, 32 # a
.byte 8, 0, 248, 63, 0, 17, 128, 32, 128, 32, 0, 17, 0, 14, 0, 0 # b
.byte 0, 0, 0, 14, 0, 17, 128, 32, 128, 32, 128, 32, 0, 17, 0, 0 # c
.byte 0, 0, 0, 14, 0, 17, 128, 32, 128, 32, 136, 16, 248, 63, 0, 32 # d
.byte 0, 0, 0, 31, 128, 34, 128, 34, 128, 34, 128, 34, 0, 19, 0, 0 # e
.byte 0, 0, 128, 32, 128, 32, 240, 63, 136, 32, 136, 32, 136, 0, 24, 0 # f
.byte 0, 0, 0, 107, 128, 148, 128, 148, 128, 148, 128, 147, 128, 96, 0, 0 # g
.byte 8, 32, 248, 63, 0, 33, 128, 0, 128, 0, 128, 32, 0, 63, 0, 32 # h
.byte 0, 0, 128, 32, 152, 32, 152, 63, 0, 32, 0, 32, 0, 0, 0, 0 # i
.byte 0, 0, 0, 192, 0, 128, 128, 128, 152, 128, 152, 127, 0, 0, 0, 0 # j
.byte 8, 32, 248, 63, 0, 36, 0, 2, 128, 45, 128, 48, 128, 32, 0, 0 # k
.byte 0, 0, 8, 32, 8, 32, 248, 63, 0, 32, 0, 32, 0, 0, 0, 0 # l
.byte 128, 32, 128, 63, 128, 32, 128, 0, 128, 63, 128, 32, 128, 0, 0, 63 # m
.byte 128, 32, 128, 63, 0, 33, 128, 0, 128, 0, 128, 32, 0, 63, 0, 32 # n
.byte 0, 0, 0, 31, 128, 32, 128, 32, 128, 32, 128, 32, 0, 31, 0, 0 # o
.byte 128, 128, 128, 255, 0, 161, 128, 32, 128, 32, 0, 17, 0, 14, 0, 0 # p
.byte 0, 0, 0, 14, 0, 17, 128, 32, 128, 32, 128, 160, 128, 255, 0, 128 # q
.byte 128, 32, 128, 32, 128, 63, 0, 33, 128, 32, 128, 0, 128, 1, 0, 0 # r
.byte 0, 0, 0, 51, 128, 36, 128, 36, 128, 36, 128, 36, 128, 25, 0, 0 # s
.byte 0, 0, 128, 0, 128, 0, 224, 31, 128, 32, 128, 32, 0, 0, 0, 0 # t
.byte 128, 0, 128, 31, 0, 32, 0, 32, 0, 32, 128, 16, 128, 63, 0, 32 # u
.byte 128, 0, 128, 1, 128, 14, 0, 48, 0, 8, 128, 6, 128, 1, 128, 0 # v
.byte 128, 15, 128, 48, 0, 12, 128, 3, 0, 12, 128, 48, 128, 15, 128, 0 # w
.byte 0, 0, 128, 32, 128, 49, 0, 46, 128, 14, 128, 49, 128, 32, 0, 0 # x
.byte 128, 128, 128, 129, 128, 142, 0, 112, 0, 24, 128, 6, 128, 1, 128, 0 # y
.byte 0, 0, 128, 33, 128, 48, 128, 44, 128, 34, 128, 33, 128, 48, 0, 0 # z
.byte 0, 0, 0, 0, 0, 0, 0, 0, 128, 0, 124, 63, 2, 64, 2, 64 # {
.byte 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 0, 0, 0, 0, 0, 0 # |
.byte 0, 0, 2, 64, 2, 64, 124, 63, 128, 0, 0, 0, 0, 0, 0, 0 # }
.byte 0, 0, 6, 0, 1, 0, 1, 0, 2, 0, 2, 0, 4, 0, 4, 0 # ~


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
.align 4
base_DF_command: .byte 0x7e,0xff,0x06,0x00,0x00,0x00,0x00,0xef







