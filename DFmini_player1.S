#riscv32-unknown-elf-as -g DFmini_player1.S -o DFmini_player1.o
#riscv32-unknown-elf-ld -T CH32V003.ld -Map=final.map DFmini_player1.O
#riscv32-unknown-elf-objcopy -O ihex a.out DFmini_player1.hex




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


#BRR = BAUD  
#13.6=38400,#4.4 = 115200,#52.1 = 9600,#8.7 =  57600
#USARTx_TX Full-duplex mode Push-pull multiplexed outputs,#USARTx_RX Full-duplex mode Floating input or pull-up input
#PD5 -tx,#PD6 -rx,#PD4 -input
.equ fclk, 24000000   		# 24Mhz RCO internal , AHB =8Mhz by default
.equ OLEDaddress,  0x78
.equ command,  0x00
.equ data_cmd,  0x40
.equ OLED_INIT_LEN,  15    
.equ font_length,  16
.equ DS1307WAD , 0xD0
.equ DS1307RAD , 0xD1
.equ read_data_len , 7


# SRAM registers
.equ buffer,0x20000004
.equ buffer1,0x20000008
.equ buffer2,0x2000000C
.equ buffer3,0x20000010
.equ clock_display,0x20000014
.equ clock_display1,0x20000018 	# stores 1 second measure window overflow for slow signals
.equ clock_display2,0x2000001C
.equ clock_display3,0x20000020
.equ result1,0x20000024
.equ result2,0x20000028 
.equ result3,0x2000002C
.equ state,0x20000030 
.equ scratch,0x20000034 
.equ mem,0x20000038
.equ mem1,0x2000003C
.equ mem2,0x20000040
.equ mem3,0x20000044
.equ mem4,x20000048
.equ mem5, 0x2000004C
.equ screen1,0x20000050		#screen_buffer of 512bytes/128 words
.equ smallbuffer,0x20000250    	#End Address: 0x20000250 + 32bytes = 0x20000270


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

    li sp, STACK # load stack pointer with stack end address



#enable periphrel clocks
	li x10,R32_RCC_APB2PCENR	# load address of APB2PCENR register to x10 ,for enabling GPIO A,D,C peripherals
	lw x11,0(x10)			# load contents from peripheral register R32_RCC_APB2PCENR pointed by x10
	li x7,((1<<2)|(1<<4)|(1<<5)|(1<<11)|(1<<14)|(1<<0))	# 1<<IOPA_EN,1<<IOPC_EN,1<<IOPD_EN,1<<USART_EN,1<<TIM1_EN,1<<AF_EN
	or x11,x11,x7			# or values 
	sw x11,0(x10)			# store modified enable values in R32_RCC_APB2PCENR
	li x10,R32_RCC_APB1PCENR
	lw x11,0(x10)
	ori x11,x11,(1<<0)		# timer2 clock enable
	sw x11,0(x10)

#configure GPIO 
	li x10,R32_GPIOD_CFGLR		# load pointer x10 with address of R32_GPIOD_CFGLR , GPIO configuration register
	lw x11,0(x10)			# load contents from register pointed by x10
	li x7,~((0xf<<20)|(0xf<<24))	# clear pd5,pd6. we need to setup PD5 & PD6 for usart tx and rx and pd4 for ETR
	and x11,x11,x7			# clear pd5,pd6 mode and cnf bits for selected pin D4,D5,D6
	li x7,((0x8<<24)|(0xB<<20))	# pd6 = input with PU/PD,pd5= multiplex pushpull output 50mhz,pd4 as floating input
	or x11,x11,x7			# OR value to register
	sw x11,0(x10)			# store in R32_GPIOD_CFGLR

#enable pull up for input	
	li x10,R32_GPIOD_OUTDR		# enable pullup resistor by setting OUTDR register
	lw x11,0(x10)			# this setting of GPIO_OUTDR for pullup resistor effects if corresonding pin is selected as input
	li x7,(1<<6)			# when PD6 is input with resistor selected 1= pullup and 0 = pulldown
	or x11,x11,x7
	sw x11,0(x10)

#configure USART baud
	li x10,R32_USART_BRR		# USART BAUD setting
	lw x11,0(x10)			# copy R32_USART_BRR to x11
	li x7,((52<<4)|(1<<0))		# 52.1 in BRR =9600
	or x11,x11,x7			# or registers
	sw x11,0(x10)			# store in R32_USART_BRR

#setup UART control and enable	
	li x10,R32_USART_CTLR1		# load x10 with R32_USART_CTLR1 address
	lw x11,0(x10)			# load to x11 contents
	li x7,(1<<13)|(1<<3)|(1<<2)	# enable USART UE, TX,RX bits		# UE 
	or x11,x11,x7
	sw x11,0(x10)			# store back new values


#main endless loop for uart transmit
example:

	la x10,name			# load address of label "name" to x10, string to be transmitted
string_loop:
	lb x8,0(x10)			# load 1 byte from 0 offset of "name"
	beqz x8,finish			# if byte in x8 null branch to label "finish"
	call USART_TX			# call subroutine USART_TX to transmit byte
	addi x10,x10,1			# increase pointer by 1 byte
	j string_loop			# jump back to label string_loop until null is encountered
finish:
	



MP3_loop:
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

	call load_DF_command
	loadPARAM CMD_PLAY_FOLDER_FILE, 0x00, 0x01, 0x00   # Play the song with folder and song name , folder 01 , song 02
	call send_DF_commands

	call delay1S

	call load_DF_command
	li x6,0x03
	loadPARAM1 CMD_PLAY_FOLDER_FILE, 0x00, 0x02, x6   # Play the song with folder and song name , folder 01 , song 02
	call send_DF_commands

	


here:
	j here







#####################################################################
#load byte in x8
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
################################################################################

#==========================================
delay10S:								
	addi sp,sp,-8		# push RA
	sw ra,0(sp)		# push RA
	sw t1,4(sp)
	li t1,20100101						# load an arbitarary value 20000000 to t1 register		
loop:
	addi t1,t1,-1						# subtract 1 from t1
	bne t1,zero,loop					# if t1 not equal to 0 branch to label loop
	lw t1,4(sp)
	lw ra,0(sp)		# POP RA
	addi sp,sp,8		# pop RA
	ret	

delay1S:								
	addi sp,sp,-8		# push RA
	sw ra,0(sp)		# push RA
	sw t1,4(sp)
	li t1,2010010						# load an arbitarary value 20000000 to t1 register		
loop1s:
	addi t1,t1,-1						# subtract 1 from t1
	bne t1,zero,loop1s					# if t1 not equal to 0 branch to label loop
	lw t1,4(sp)
	lw ra,0(sp)		# POP RA
	addi sp,sp,8		# pop RA
	ret	

delay1ms:
	addi sp,sp,-8		# push RA
	sw ra,0(sp)		# push RA								
	li t1,2010						# load an arbitarary value 20000000 to t1 register		
loop1ms:
	addi t1,t1,-1						# subtract 1 from t1
	bne t1,zero,loop1ms					# if t1 not equal to 0 branch to label loop
	lw t1,4(sp)
	lw ra,0(sp)		# POP RA
	addi sp,sp,8		# pop RA					
	ret	

delay10ms:
	addi sp,sp,-8		# push RA
	sw ra,0(sp)		# push RA
	sw t1,4(sp)								
	li t1,20100						# load an arbitarary value 20000000 to t1 register		
loop10ms:
	addi t1,t1,-1						# subtract 1 from t1
	bne t1,zero,loop10ms					# if t1 not equal to 0 branch to label loop
	lw t1,4(sp)
	lw ra,0(sp)		# POP RA
	addi sp,sp,8		# pop RA
	ret

delay50ms:
	addi sp,sp,-8		# push RA
	sw ra,0(sp)		# push RA
	sw t1,4(sp)								
	li t1,100500						# load an arbitarary value 20000000 to t1 register		
loop50ms:
	addi t1,t1,-1						# subtract 1 from t1
	bne t1,zero,loop50ms					# if t1 not equal to 0 branch to label loop
	lw t1,4(sp)
	lw ra,0(sp)		# POP RA
	addi sp,sp,8		# pop RA
	ret		
#################################################################################


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

send_DF_commands1:		# sends DF command , call with loop count of 8 loaded in t0 , li t0,8 , call send_DF_commands
	addi sp,sp,-20
	sw ra,0(sp)
	sw x8,4(sp)
	sw a1,8(sp)
	sw x3,12(sp)
	sw t0,16(sp)
	lw x3,16(sp)		# x3 loaded with loop count , load loop count via t0 before calling function	
	la a1,result1
Uloop1:
	lb x8,0(a1)		# uart takes argument in x8
	call USART_TX
	addi a1,a1,1
	addi x3,x3,-1
	bnez x3,Uloop1
	lw t0,16(sp)
	lw x3,12(sp)
	lw a1,8(sp)
	lw x8,4(sp)
	lw ra,0(sp)
	addi sp,sp,20
	ret

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




.align 4

.section .rodata




base_DF_command: .byte 0x7e,0xff,0x06,0x00,0x00,0x00,0x00,0xef

sdcard: 	 .byte 0x7e,0xff,0x06,0x09,0x00,0x00,0x02,0xef

name: .asciz "sajeev"
# 100 track in 11th folder = 0x7e,0xff,0x06,0x0F,0x00,0x0B,0x64,0xef ,--0x0b = 11 folder --0x64 is 100th track



