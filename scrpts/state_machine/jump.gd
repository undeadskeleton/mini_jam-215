extends StateInterface

class_name JumpState

func enter()-> void:
	var player = statemachine.player_ref
	player.velocity.y = -600

func physics_process(delta : float)-> void:
	var player = statemachine.player_ref
	var direction = Input.get_axis("ui_left","ui_right")

	if ((!player.is_on_floor()) and (player.velocity.y ==-600)):
		statemachine.changeState("fall")
	else:
		if direction or player.direction.x:
			statemachine.changeState("walk")
		else:
			player.velocity.x = move_toward(player.velocity.x,0,200)
	if player.velocity.x==0:
			statemachine.changeState("idle")
