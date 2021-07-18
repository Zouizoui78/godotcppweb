all:
	$(MAKE) linux
	$(MAKE) web
	$(MAKE) win

# Linux
linux: godot-cpp/bin/libgodot-cpp.linux.release.64.a
	g++ -fPIC -O3 -std=c++14 -o godotprj/bin/lib/libtest.so src/*.cpp -Iinclude -Igodot-cpp/include -Igodot-cpp/include/core -Igodot-cpp/include/gen -Igodot-cpp/godot-headers -shared -Lgodot-cpp/bin -lgodot-cpp.linux.release.64

godot-cpp/bin/libgodot-cpp.linux.release.64.a:
	cd godot-cpp && scons platform=linux target=release generate_bindings=yes -j 12

# Web

web: godot-cpp/bin/libgodot-cpp.javascript.release.wasm.bc
	em++ -o godotprj/bin/lib/libtest.wasm -O3 -s SIDE_MODULE=1 src/*.cpp godot-cpp/bin/libgodot-cpp.javascript.release.wasm.bc -Iinclude -Igodot-cpp/include -Igodot-cpp/include/core -Igodot-cpp/include/gen -Igodot-cpp/godot-headers

godot-cpp/bin/libgodot-cpp.javascript.release.wasm.bc:
	cd godot-cpp && scons platform=javascript target=release generate_bindings=yes -j 12 use_llvm=yes

#Windows

win: godot-cpp/bin/libgodot-cpp.windows.release.64.a
	x86_64-w64-mingw32-g++ -shared -static -fPIC -O3 -std=c++14 -o godotprj/bin/lib/libtest.dll src/*.cpp -Iinclude -Igodot-cpp/include -Igodot-cpp/include/core -Igodot-cpp/include/gen -Igodot-cpp/godot-headers -Lgodot-cpp/bin -lgodot-cpp.windows.release.64

godot-cpp/bin/libgodot-cpp.windows.release.64.a:
	cd godot-cpp && scons platform=windows target=release generate_bindings=yes -j 12 use_mingw=yes



clean:
	@rm -rf export_{linux,web,win}/* godotprj/bin/lib/*
	@find -name "*.import" | xargs rm -r