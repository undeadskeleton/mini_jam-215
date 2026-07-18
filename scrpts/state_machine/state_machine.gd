extends Node
class_name StateMachine

var states : Dictionary = {}
var currentState : StateInterface

@export var initialState : StateInterface
@export var player_ref : CharacterBody2D
var currentstatename : String

#for storing the last facing direction before entering dash

var last_dir : float = 1
func _ready() -> void:
	for child in get_children():
		if child is StateInterface:
			states[child.name.to_lower()] = child
			child.statemachine = self
	if initialState:
		changeState(initialState.name.to_lower())

func changeState(new_state_name)-> void:
	if currentState:
		currentState.exit()

	currentstatename = new_state_name
	currentState = states.get(currentstatename)

	if currentState:
		currentState.enter()
	else:
		push_error("State Not found")

func _process(delta: float) -> void:
	if currentState:
		currentState.process(delta)

func _physics_process(delta: float)-> void:
	if currentState:
		currentState.physics_process(delta)

func _input(event: InputEvent) -> void:
	if currentState:
		currentState.handle_input(event)

func  currentStateName()-> String:
	return currentstatename
