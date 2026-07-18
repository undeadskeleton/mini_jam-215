extends Label
@export var joystick : VirJoystick
@export var knob : joyKnob

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "posVector:"+str(joystick.posVector)
