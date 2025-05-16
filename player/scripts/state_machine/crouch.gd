class_name PlayerCrouch extends PlayerState

func _ready() -> void:
	pass # Replace with function body.

func init() -> void:
	pass
	
func enter() -> void:
	print ("Entred crouch State")
	pass

func exit() -> void:
	print ("Exited crouch State")
	pass

func handle_input( _event : InputEvent ) -> PlayerState:
	return null

func process( _delta : float ) -> PlayerState:
	return null

func physics_process( _delta : float ) -> PlayerState:
	return null
