# godotcppweb

Test with exporting for the web, Linux and windows a Godot project with GDNative C++ code.

## Build

Clone the project and its dependencies :

    git clone https://git.zouizoui.ovh/zoui/godotcppweb.git
    cd godotcppweb
    git clone --recursive https://github.com/godotengine/godot-cpp -b 3.3

Apply patch to compile godot-cpp to wasm with optimization (added in godot-cpp's master branch but not in 3.3) :

    cd godot-cpp
    git apply ../godot-cpp_sconstruct.patch
    cd ..

Build the project :

    make linux
    # OR for the web
    make web
    # OR for Windows
    make win
    # OR for all three
    make

## Build wasm+gdnative export templates

GDNative doesn't work with export templates for wasm provided by the Godot website. The templates provided here in `export_templates/` are compiled with the correct parameters and work. To rebuild them run these commands :

    git clone https://github.com/godotengine/godot.git -b 3.3.2-stable
    # Optimize Godot build
    cp custom.py godot/
    # Debug build
    scons platform=javascript tools=no gdnative_enabled=yes
    #Release build
    scons platform=javascript tools=no gdnative_enabled=yes target=release
    # Rename the procuced files
    mv bin/godot.javascript.opt.threads.zip bin/webassembly_threads_release.zip
    mv bin/godot.javascript.opt.gdnative.zip bin/webassembly_gdnative_release.zip