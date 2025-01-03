# arm-linux-gnueabihf-gcc toolchain

set(triple aarch64-linux-gnu)

set(CMAKE_LIBRARY_ARCHITECTURE ${ARM_CROSS_GCC_ROOT}/bin/${triple})
set(TOOLCHAIN_PREFIX ${ARM_CROSS_GCC_ROOT}/bin/${triple})
set(ARM_CROSS_GCC_ROOT $ENV{ARM_CROSS_GCC_ROOT})
set(HEXAGON_ARM_SYSROOT $ENV{HEXAGON_ARM_SYSROOT})
set(CMAKE_EXE_LINKER_FLAGS "-Wl,-gc-sections -Wl,-rpath-link,${HEXAGON_ARM_SYSROOT}/usr/lib/aarch64-linux-gnu -Wl,-rpath-link,${HEXAGON_ARM_SYSROOT}/lib/aarch64-linux-gnu")
set(CMAKE_CXX_COMPILER /home/4.1.0.4/tools/linaro64/bin/aarch64-linux-gnu-g++)
set(CMAKE_C_COMPILER /home/4.1.0.4/tools/linaro64/bin/aarch64-linux-gnu-gcc)

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_SYSTEM_VERSION 1)

set(CMAKE_C_COMPILER_TARGET ${triple})
set(CMAKE_CXX_COMPILER_TARGET ${triple})

set(CMAKE_ASM_COMPILER ${TOOLCHAIN_PREFIX}-gcc)

# compiler tools
find_program(CMAKE_AR ${TOOLCHAIN_PREFIX}-gcc-ar)
find_program(CMAKE_GDB ${TOOLCHAIN_PREFIX}-gdb)
find_program(CMAKE_LD ${TOOLCHAIN_PREFIX}-ld)
find_program(CMAKE_LINKER ${TOOLCHAIN_PREFIX}-ld)
find_program(CMAKE_NM ${TOOLCHAIN_PREFIX}-gcc-nm)
find_program(CMAKE_OBJCOPY ${TOOLCHAIN_PREFIX}-objcopy)
find_program(CMAKE_OBJDUMP ${TOOLCHAIN_PREFIX}-objdump)
find_program(CMAKE_RANLIB ${TOOLCHAIN_PREFIX}-gcc-ranlib)
find_program(CMAKE_STRIP ${TOOLCHAIN_PREFIX}-strip)

set(CMAKE_FIND_ROOT_PATH get_file_component(${CMAKE_C_COMPILER} PATH))
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# os tools
foreach(tool grep make)
	string(TOUPPER ${tool} TOOL)
	find_program(${TOOL} ${tool})
	if(NOT ${TOOL})
		message(FATAL_ERROR "could not find ${tool}")
	endif()
endforeach()
