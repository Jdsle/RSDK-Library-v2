# RSDKv2 Decompilation

A complete decompilation of the Retro-Sonic Engine v2.

Without assets from the Sonic Nexus 2008 demo, this decompilation will not run. You can download the game [here](https://info.sonicretro.org/Sonic_Nexus).

# Additional Tweaks
* Added a built in mod loader, allowing to easily create and play mods.
* There is now a `settings.ini` file that the game uses to load all settings, similar to Sonic Mania.
* The dev menu can now be accessed from anywhere by pressing the `ESC` key if enabled in the config.
* The `F12` pause, `F11` step over & fast forward debug features from Sonic Mania have all been ported and are enabled if `devMenu` is enabled in the config.

# How to Build

Please note that the following instructions are for building this fork *only*. If you need instructions on how to build for the officially supported platforms, [view the instructions here.](https://github.com/RSDKModding/RSDKv2-Decompilation)

This project uses [CMake](https://cmake.org/), a versatile building system that supports many different compilers and platforms. You can download CMake [here](https://cmake.org/download/). **(Make sure to enable the feature to add CMake to the system PATH during the installation!)**

You will also need [Emscripten.](https://emscripten.org/docs/getting_started/downloads.html) Download and install it by following the provided instructions on the page.

## Get the source code

In order to clone the repository, you need to install Git, which you can get [here](https://git-scm.com/downloads).

Clone the repo, using:
`git clone --single-branch --branch web https://github.com/Jdsle/RSDKv2-Decompilation`

## Compiling

> [!NOTE]  
> This fork does *not* run standalone! If you want to host your own build, you will need to also build the [RSDK-Library Engine Manager](https://github.com/Jdsle/RSDK), or develop your own interface.

Compiling is as simple as typing the following in the root repository directory:
```
emcmake -B build
cmake --build build --config release
```

The resulting build will be located somewhere in `build/` depending on your system.

The following cmake arguments are available when compiling:
- Use these by adding `-D[flag-name]=[value]` to the end of the `emcmake -B build` command.

### RSDKv2 flags
- `FORCE_CASE_INSENSITIVE`: Forces case insensivity when loading files. Takes a boolean, defaults to `off`.
- `RETRO_MOD_LOADER`: Enables or disables the mod loader. Takes a boolean, defaults to `on`.
- `RETRO_ORIGINAL_CODE`: Removes any custom code. *A playable game will not be built with this enabled.* Takes a boolean, defaults to `off`.
- `RETRO_SDL_VERSION`: *Only change this if you know what you're doing.* Switches between using SDL1 or SDL2. Takes an integer of either `1` or `2`, defaults to `2`.

# Contact:
Join the [Retro Engine Modding Discord Server](https://dc.railgun.works/retroengine) for any extra questions you may need to know about the decompilation or modding it.
