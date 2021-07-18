#include "EntryPoint.hpp"

Test::Test() {}
Test::~Test() {}

void Test::_register_methods() {}

void Test::_init() {
    Godot::print("Test class init");
    _sprite = RotatingSprite::_new();
    this->add_child(_sprite);
}