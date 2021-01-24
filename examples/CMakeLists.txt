if(${MINIZ_BUILD_EXAMPLES})
    file(GLOB EXAMPLE_SOURCES *.cpp)

    foreach(EXAMPLE_SOURCE IN ITEMS ${EXAMPLE_SOURCES})
        get_filename_component(EXAMPLE_NAME ${EXAMPLE_SOURCE} NAME_WE)
        set(EXAMPLE_EXECUTABLE example-${EXAMPLE_NAME})

        add_executable(${EXAMPLE_EXECUTABLE} ${EXAMPLE_SOURCE})
        target_link_libraries(${EXAMPLE_EXECUTABLE} PUBLIC miniz-cpp)

    endforeach()
endif()