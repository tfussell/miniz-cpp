cmake_minimum_required(VERSION 3.2)
project(miniz-cpp VERSION 1.0)

if(NOT CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD 14)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

option(MINIZ_BUILD_TESTS "Build tests" OFF)
option(MINIZ_BUILD_EXAMPLES "Build examples" OFF)

if(${MINIZ_BUILD_TESTS})
    enable_testing()
endif()

set(include_dest "include/miniz-cpp-${miniz-cpp_VERSION}")
set(lib_dest "lib/mini-cpp-${miniz-cpp_VERSION}")

add_library(miniz-cpp INTERFACE)
set_target_properties(miniz-cpp PROPERTIES LINKER_LANGUAGE CXX) 
target_include_directories(
    miniz-cpp
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${include_dest}>
)

add_subdirectory(tests)
add_subdirectory(examples)

# install
install(FILES zip_file.hpp DESTINATION ${include_dest})
install(FILES miniz-cpp-config.cmake DESTINATION ${lib_dest})
