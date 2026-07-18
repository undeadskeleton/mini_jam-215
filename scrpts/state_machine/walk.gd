extends StateInterface

class_name WalkState
@export var Speed : int = 300
var direction : int
var store_dir : float
func physics_process(delta : float)-> void:
	var player = statemachine.player_ref

	if !player.is_on_floor():
		statemachine.changeState("fall")

	direction = Input.get_axis("ui_left","ui_right")
	store_dir  = 0.0

	if player.joy_direction.x or direction:
		if player.joy_direction.x:
			player.velocity.x = Speed * player.joy_direction.x
			store_dir = player.joy_direction.x
			statemachine.last_dir = store_dir
		elif direction :
			player.velocity.x = direction * Speed
			store_dir = direction
			statemachine.last_dir = store_dir
	else:
		player.velocity.x = move_toward(player.velocity.x,0,50)

	if player.velocity.x == 0:
		statemachine.changeState("idle")

func handle_input(event: InputEvent)-> void:
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_pressed("ui_accept"):
		statemachine.changeState("jump")
	if Input.is_action_just_pressed("dash"):
		statemachine.changeState("dash")
