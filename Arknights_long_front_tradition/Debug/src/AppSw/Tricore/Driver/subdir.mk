################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/AppSw/Tricore/Driver/LQ_ADC.c \
../src/AppSw/Tricore/Driver/LQ_CCU6.c \
../src/AppSw/Tricore/Driver/LQ_DMA.c \
../src/AppSw/Tricore/Driver/LQ_EEPROM.c \
../src/AppSw/Tricore/Driver/LQ_EMEM.c \
../src/AppSw/Tricore/Driver/LQ_FFT.c \
../src/AppSw/Tricore/Driver/LQ_GPIO.c \
../src/AppSw/Tricore/Driver/LQ_GPSR.c \
../src/AppSw/Tricore/Driver/LQ_GPT12_ENC.c \
../src/AppSw/Tricore/Driver/LQ_GTM.c \
../src/AppSw/Tricore/Driver/LQ_QSPI.c \
../src/AppSw/Tricore/Driver/LQ_SOFTI2C.c \
../src/AppSw/Tricore/Driver/LQ_SPI.c \
../src/AppSw/Tricore/Driver/LQ_STM.c \
../src/AppSw/Tricore/Driver/LQ_UART.c 

OBJS += \
./src/AppSw/Tricore/Driver/LQ_ADC.o \
./src/AppSw/Tricore/Driver/LQ_CCU6.o \
./src/AppSw/Tricore/Driver/LQ_DMA.o \
./src/AppSw/Tricore/Driver/LQ_EEPROM.o \
./src/AppSw/Tricore/Driver/LQ_EMEM.o \
./src/AppSw/Tricore/Driver/LQ_FFT.o \
./src/AppSw/Tricore/Driver/LQ_GPIO.o \
./src/AppSw/Tricore/Driver/LQ_GPSR.o \
./src/AppSw/Tricore/Driver/LQ_GPT12_ENC.o \
./src/AppSw/Tricore/Driver/LQ_GTM.o \
./src/AppSw/Tricore/Driver/LQ_QSPI.o \
./src/AppSw/Tricore/Driver/LQ_SOFTI2C.o \
./src/AppSw/Tricore/Driver/LQ_SPI.o \
./src/AppSw/Tricore/Driver/LQ_STM.o \
./src/AppSw/Tricore/Driver/LQ_UART.o 

COMPILED_SRCS += \
./src/AppSw/Tricore/Driver/LQ_ADC.src \
./src/AppSw/Tricore/Driver/LQ_CCU6.src \
./src/AppSw/Tricore/Driver/LQ_DMA.src \
./src/AppSw/Tricore/Driver/LQ_EEPROM.src \
./src/AppSw/Tricore/Driver/LQ_EMEM.src \
./src/AppSw/Tricore/Driver/LQ_FFT.src \
./src/AppSw/Tricore/Driver/LQ_GPIO.src \
./src/AppSw/Tricore/Driver/LQ_GPSR.src \
./src/AppSw/Tricore/Driver/LQ_GPT12_ENC.src \
./src/AppSw/Tricore/Driver/LQ_GTM.src \
./src/AppSw/Tricore/Driver/LQ_QSPI.src \
./src/AppSw/Tricore/Driver/LQ_SOFTI2C.src \
./src/AppSw/Tricore/Driver/LQ_SPI.src \
./src/AppSw/Tricore/Driver/LQ_STM.src \
./src/AppSw/Tricore/Driver/LQ_UART.src 

C_DEPS += \
./src/AppSw/Tricore/Driver/LQ_ADC.d \
./src/AppSw/Tricore/Driver/LQ_CCU6.d \
./src/AppSw/Tricore/Driver/LQ_DMA.d \
./src/AppSw/Tricore/Driver/LQ_EEPROM.d \
./src/AppSw/Tricore/Driver/LQ_EMEM.d \
./src/AppSw/Tricore/Driver/LQ_FFT.d \
./src/AppSw/Tricore/Driver/LQ_GPIO.d \
./src/AppSw/Tricore/Driver/LQ_GPSR.d \
./src/AppSw/Tricore/Driver/LQ_GPT12_ENC.d \
./src/AppSw/Tricore/Driver/LQ_GTM.d \
./src/AppSw/Tricore/Driver/LQ_QSPI.d \
./src/AppSw/Tricore/Driver/LQ_SOFTI2C.d \
./src/AppSw/Tricore/Driver/LQ_SPI.d \
./src/AppSw/Tricore/Driver/LQ_STM.d \
./src/AppSw/Tricore/Driver/LQ_UART.d 


# Each subdirectory must supply rules for building sources it contributes
src/AppSw/Tricore/Driver/%.src: ../src/AppSw/Tricore/Driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING C/C++ Compiler'
	cctc -D__CPU__=tc26xb -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gpt12" -I"E:/tempp/Arknights_long_front_tradition/src/AppSw/Tricore/Driver" -I"E:/tempp/Arknights_long_front_tradition/src/AppSw/Tricore/Main" -I"E:/tempp/Arknights_long_front_tradition/src/AppSw/Tricore/User" -I"E:/tempp/Arknights_long_front_tradition/src/AppSw/Tricore/APP" -I"E:/tempp/Arknights_long_front_tradition/src/AppSw" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Infra/Platform/Tricore/Compilers" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Multican/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Infra/Platform" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Cif/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Hssl/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Cpu/Trap" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Service/CpuGeneric/If/Ccu6If" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Dsadc/Dsadc" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Port" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Stm/Timer" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Dts/Dts" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Eth" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Flash" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Vadc" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Msc" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Qspi/SpiMaster" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Scu/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Service/CpuGeneric/SysSe/Comm" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Service/CpuGeneric/SysSe/Math" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Infra/Platform/Tricore" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm/Trig" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm/Tim" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Ccu6/TimerWithTrigger" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Emem" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Mtu" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Infra" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Fft" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/I2c/I2c" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Asclin/Asc" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Service/CpuGeneric/SysSe" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Flash/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Service/CpuGeneric/If" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Psi5" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Cpu" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Fce/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Stm/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Msc/Msc" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Vadc/Adc" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Asclin" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm/Tom/Pwm" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm/Atom" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Port/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Psi5/Psi5" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Eray" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Qspi/SpiSlave" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Ccu6/Icu" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Cpu/CStart" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Hssl" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Cif" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Eth/Phy_Pef7071" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Hssl/Hssl" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Iom/Driver" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Multican/Can" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Psi5s/Psi5s" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Fft/Fft" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Ccu6/PwmHl" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Iom/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/_Lib" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm/Tom/Timer" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Sent" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Eray/Eray" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gpt12/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Dma" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Fce/Crc" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Qspi" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Infra/Sfr" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Infra/Sfr/TC26B" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Service/CpuGeneric/SysSe/Bsp" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Service/CpuGeneric/SysSe/General" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Cpu/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Dts" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Src" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Dma/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Cif/Cam" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Src/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Asclin/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/I2c/Std" -I"E:/tempp/Arknights_long_front_tradition/Configurations" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/_Lib/DataHandling" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Sent/Sent" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Ccu6/Timer" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Psi5/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Psi5s" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Emem/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Ccu6/PwmBc" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Iom" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Ccu6/TPwm" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Service/CpuGeneric" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Multican" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Mtu/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Infra/Sfr/TC26B/_Reg" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm/Tom/PwmHl" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Dma/Dma" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm/Atom/Timer" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Ccu6/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Service/CpuGeneric/SysSe/Time" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Dsadc/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Cpu/Irq" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Ccu6" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gpt12/IncrEnc" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Psi5s/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Scu" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/_Lib/InternalMux" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Stm" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Dsadc/Rdc" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Vadc/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Dts/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Service" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Eth/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Smu" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/_PinMap" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Asclin/Lin" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Service/CpuGeneric/StdIf" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Dsadc" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Fce" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm/Atom/PwmHl" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Qspi/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm/Tom" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm/Tim/In" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Msc/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Fft/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm/Atom/Pwm" -I"E:/tempp/Arknights_long_front_tradition/Libraries/Service/CpuGeneric/_Utilities" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Gtm/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Smu/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/I2c" -I"E:/tempp/Arknights_long_front_tradition/Libraries" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Asclin/Spi" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Eray/Std" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Port/Io" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/_Impl" -I"E:/tempp/Arknights_long_front_tradition/Libraries/iLLD/TC26B/Tricore/Sent/Std" --iso=99 --c++14 --language=+volatile --anachronisms --fp-model=3 --fp-model=c --fp-model=f --fp-model=l --fp-model=n --fp-model=r --fp-model=z -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc26xb -o "$@"  "$<"  -cs --dep-file=$(@:.src=.d) --misrac-version=2012 -N0 -Z0 -Y0 2>&1; sed -i -e '/ctc\\include/d' -e '/Libraries\\iLLD/d' -e '/Libraries\\Infra/d' -e 's/\(.*\)".*\\Arknights_long_front_tradition\(\\.*\)"/\1\.\.\2/g' -e 's/\\/\//g' $(@:.src=.d) && \
	echo $(@:.src=.d) generated
	@echo 'Finished building: $<'
	@echo ' '

src/AppSw/Tricore/Driver/%.o: ./src/AppSw/Tricore/Driver/%.src
	@echo 'Building file: $<'
	@echo 'Invoking: TASKING Assembler'
	astc -o  "$@" "$<" --list-format=L1 --optimize=gs
	@echo 'Finished building: $<'
	@echo ' '


