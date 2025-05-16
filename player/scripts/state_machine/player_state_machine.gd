@icon ("res://player/sprites/icon_state_machine_16x16.png")
class_name PlayerStateMachine extends Node

var states : Array [ PlayerState ]
var current_state : PlayerState :
	get : return states.front()
var previous_state : PlayerState :
	get : return states[1]
	
var player : Player

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta: float) -> void:
	current_state.direction = Vector2(
		sign(Input.get_axis("ui_left","ui_right")),
		Input.get_axis("ui_up","ui_down"),
		)
	var new_state = current_state.process( delta )
	change_state( new_state )
	pass
	
func _physics_process(delta: float) -> void:
	var new_state = current_state.physics_process( delta )
	change_state( new_state )
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	var new_state = current_state.handle_input( event )
	change_state ( new_state )
	pass
	
func change_state ( new_state : PlayerState ) -> void:
	if new_state == null:
		return
	elif new_state == current_state:
		return
	
	if current_state:
		current_state.exit()
	states.push_front( new_state )
	current_state.enter()
	states.resize( 3 )
	pass
	
func init( _player : Player ) -> void:
	player = _player
	states = []
	
	for c in get_children():
		if c is PlayerState:
			states.append(c)
	if states.size() == 0:
		return
			
	current_state.player = player
	current_state.state_machine = self
	
	for state in states:
		state.init()
		
	change_state( current_state.idle )
	process_mode = Node.PROCESS_MODE_INHERIT
	pass
