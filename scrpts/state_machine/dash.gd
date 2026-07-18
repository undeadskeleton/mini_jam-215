extends StateInterface

class_name DashState

@export var Dash_SPEED : int = 500
@export var dash_timer : float = 0.6
var can_dash : bool = false
var dash_duration : float

func enter()-> void:
	can_dash = true
	dash_duration = dash_timer

func physics_process(delta : float)-> void:
	var player = statemachine.player_ref

	if can_dash:
		dash_duration-=delta
		player.velocity.x = statemachine.last_dir * Dash_SPEED
		if dash_duration <= 0.0:
			can_dash  = false
	elif !can_dash:
		player.velocity.x = move_toward(player.velocity.x,0,50)
		if (Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")) or (player.joy_direction):
			statemachine.changeState("walk")
			return
		if player.velocity.x == 0:
			statemachine.changeState("idle")
