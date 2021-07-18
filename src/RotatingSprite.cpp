#include "RotatingSprite.hpp"

#include <ResourceLoader.hpp>
#include <Texture.hpp>

RotatingSprite::RotatingSprite() {}
RotatingSprite::~RotatingSprite() {}

void RotatingSprite::_register_methods() {
    register_method("_process", &RotatingSprite::_process);
}

void RotatingSprite::_init() {
    Godot::print("RotatingSprite init");
    this->set_texture(ResourceLoader::get_singleton()->load("res://assets/textures/icon.png"));
}

void RotatingSprite::_process(double delta) {
    this->rotate(2 * Math_PI * rps * delta);

    this->set_position(this->get_position().linear_interpolate(get_global_mouse_position(), delta * follow_speed));
}