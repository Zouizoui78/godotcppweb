#ifndef ROTATINGSPRITE
#define ROTATINGSPRITE

#include <Godot.hpp>
#include <Sprite.hpp>

using namespace godot;

class RotatingSprite : public Sprite {
    GODOT_CLASS(RotatingSprite, Sprite);

    public:
        RotatingSprite();
        ~RotatingSprite();
        
        static void _register_methods();

        void _init();
        void _process(double delta);

    private:
        double rps = 0.5;
        double follow_speed = 5;
};

#endif // ROTATINGSPRITE