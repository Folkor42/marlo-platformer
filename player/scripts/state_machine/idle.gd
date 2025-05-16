class_name PlayerIdle extends PlayerState

@export var deceleration : float = 8

func enter() -> void:
	player.animation_player.play("idle")
	pass

func exit() -> void:
	pass

func handle_input( _event : InputEvent ) -> PlayerState:
	if _event.is_action_pressed("jump"):
		return jump
	return null

func process( _delta : float ) -> PlayerState:
	if direction.x != 0:
		return run
	return null

func physics_process( _delta : float ) -> PlayerState:
	player.update_velocity (0,deceleration)
	if !player.is_on_floor():
		return fall
	return null
