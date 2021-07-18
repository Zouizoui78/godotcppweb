#ifndef TEST
#define TEST

#include <Godot.hpp>
#include <Node2D.hpp>

#include "RotatingSprite.hpp"

using namespace godot;

class Test : public Node2D {
    GODOT_CLASS(Test, Node2D);

    public:
        Test();
        ~Test();
        
        static void _register_methods();

        void _init();

    private:
        RotatingSprite* _sprite = nullptr;
};

#endif // TEST