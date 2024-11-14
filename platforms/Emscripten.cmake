cmake_minimum_required(VERSION 3.7)

project(RetroEngine)

add_executable(RetroEngine ${RETRO_FILES})

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
set(RETRO_OUTPUT_NAME "RSDKv2")

set(EMSCRIPTEN_FLAGS
    -sUSE_SDL=2
    -sUSE_OGG=1
    -sUSE_VORBIS=1
    -O3
)

set(emsc_link_options
    -sTOTAL_MEMORY=32MB
    -sALLOW_MEMORY_GROWTH=1
    -sUSE_SDL=2
    -sUSE_OGG=1
    -sUSE_VORBIS=1
    -sFORCE_FILESYSTEM=1
    -sELIMINATE_DUPLICATE_FUNCTIONS=1
    -sEXPORTED_FUNCTIONS=['_main','_RSDK_Initialize']
    -lm
    -lidbfs.js
    -flto
)

target_compile_options(RetroEngine PRIVATE ${EMSCRIPTEN_FLAGS})
target_link_options(RetroEngine PRIVATE ${emsc_link_options})

if(RETRO_MOD_LOADER)
    set_target_properties(RetroEngine PROPERTIES
        CXX_STANDARD 17
        CXX_STANDARD_REQUIRED ON
    )
endif()

set_target_properties(RetroEngine PROPERTIES
    SUFFIX ".js"
)