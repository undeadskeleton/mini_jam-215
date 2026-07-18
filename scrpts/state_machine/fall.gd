extends StateInterface

class_name FallState

func physics_process(delta : float)-> void:
	var player = statemachine.player_ref

	player.velocity.y += 980 * delta
	if player.is_on_floor():
		player.velocity.x = move_toward(player.velocity.x,0,50)
		if (Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")) or (player.joy_direction):
			statemachine.changeState("walk")
			return
		if player.velocity.x == 0:
			statemachine.changeState("idle")
		if Input.is_action_just_pressed("ui_accept") or Input.is_action_pressed("ui_accept"):
			statemachine.changeState("jump")
