extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var joystick : VirJoystick
var joy_direction : Vector2

func _physics_process(delta: float) -> void:
	joy_direction = joystick.posVector
	move_and_slide()
