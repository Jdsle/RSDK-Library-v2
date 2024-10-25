cmake_minimum_required(VERSION 3.7)

project(RetroEngine)

set(RETRO_FILES
    Nexus/Animation.cpp
    Nexus/Audio.cpp
    Nexus/Collision.cpp
    Nexus/Debug.cpp
    Nexus/Drawing.cpp
    Nexus/Ini.cpp
    Nexus/Input.cpp
    Nexus/main.cpp
    Nexus/Math.cpp
    Nexus/Object.cpp
    Nexus/Palette.cpp
    Nexus/Player.cpp
    Nexus/Reader.cpp
    Nexus/RetroEngine.cpp
    Nexus/Scene.cpp
    Nexus/Script.cpp
    Nexus/Sprite.cpp
    Nexus/String.cpp
    Nexus/Text.cpp 
    Nexus/Userdata.cpp
Nexus/Video.cpp
)

add_executable(RetroEngine ${RETRO_FILES})

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")

set(EMSCRIPTEN_FLAGS
    -sUSE_SDL=2
    -sUSE_SDL_IMAGE=1
    -sUSE_OGG=1
    -sUSE_VORBIS=1
    -DRSDK_REVISION=3
    -O3
)

set(emsc_link_options
    -sTOTAL_MEMORY=64MB
    -sALLOW_MEMORY_GROWTH=1
    -sUSE_SDL=2
    -sUSE_SDL_IMAGE=1
    -sUSE_OGG=1
    -sUSE_VORBIS=1
    -sFORCE_FILESYSTEM=1
    -sELIMINATE_DUPLICATE_FUNCTIONS=1
    -sEXPORTED_FUNCTIONS=['_main','_RSDKInitialize']
    -lm
    -lidbfs.js
    -sWASM=1
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
    OUTPUT_NAME "RSDKv2" 
    SUFFIX ".js"
)