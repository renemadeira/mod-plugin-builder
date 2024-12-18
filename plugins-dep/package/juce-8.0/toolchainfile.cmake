# Aide juceaide in MOD builds

set(HOST_DIR "$ENV{HOST_DIR}")
get_filename_component(TARGET_DIR "${HOST_DIR}/../target" REALPATH)

include("${HOST_DIR}/usr/share/buildroot/toolchainfile.cmake")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DJUCE_USE_CURL=0")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DJUCE_USE_XCURSOR=0")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DJUCE_USE_XINERAMA=0")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DJUCE_USE_XRANDR=0")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DJUCE_USE_XSHM=0")

if(CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
  set(CROSSCOMPILING TRUE)
  set(CROSSCOMPILING_EMULATOR qemu-aarch64-static -L "${TARGET_DIR}")
  separate_arguments(CMAKE_CROSSCOMPILING_EMULATOR)
elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "armv7l")
  set(CROSSCOMPILING TRUE)
  set(CROSSCOMPILING_EMULATOR qemu-arm-static -L "${TARGET_DIR}")
  separate_arguments(CMAKE_CROSSCOMPILING_EMULATOR)
endif()

set(JUCE_MOD_BUILD TRUE)
