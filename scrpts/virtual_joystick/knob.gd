extends Sprite2D

class_name joyKnob
@export var parent : VirJoystick
var pressing : bool
@export var maxLength: int =100
@export var deadZone : int = 10
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	parent.button_action = pressing
	if pressing:

		if parent.global_position.distance_to(get_global_mouse_position()) <= maxLength:
			global_position = get_global_mouse_position()
		else:
			var angle = parent.global_position.angle_to_point(get_global_mouse_position())
			global_position.x = parent.global_position.x + cos(angle) * maxLength
			global_position.y = parent.global_position.y + sin(angle) * maxLength
		calculateVector()
	else:
		global_position = lerp(global_position,parent.global_position,delta*50)
		parent.posVector = Vector2(0,0)

func calculateVector()-> void:
	if abs(global_position.x-parent.global_position.x) >= deadZone:
		#print("x: ",(global_position.x-parent.global_position.x)/maxLength)
		parent.posVector.x = (global_position.x-parent.global_position.x)/maxLength
	if abs(global_position.y-parent.global_position.y) >= deadZone:
		#print("y: ",(global_position.y-parent.global_position.y)/maxLength)
		parent.posVector.y = (global_position.y-parent.global_position.y)/maxLength

	#Map the vector strenght directly to godot input system

func _on_button_button_down() -> void:
	pressing = true

func _on_button_button_up() -> void:
	pressing = false
