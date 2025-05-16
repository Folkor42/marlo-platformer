class_name PlayerJump extends PlayerState

@export var jump_velocity : float = 350
@export var jump_audio : AudioStream
@export_custom( PROPERTY_HINT_NONE, "suffix:px/s" ) var base_move_speed : float = 100
@export var acceleration : float = 8

var move_speed : float

func enter() -> void:
	player.animation_player.play("jump")
	player.play_audio(jump_audio)
	player.global_position.y -= 1
	player.velocity.y = -jump_velocity
	move_speed = maxf(base_move_speed, abs(player.velocity.x))
	pass

func exit() -> void:
	player.audio_stream_player_2d.stop()
	pass

func handle_input( _event : InputEvent ) -> PlayerState:
	if _event.is_action_released("jump"):
		player.velocity.y *= 0.5
		#return fall
	return null

func process( _delta : float ) -> PlayerState:
	return null

func physics_process( _delta : float ) -> PlayerState:
	player.update_velocity( direction.x * move_speed, acceleration )
	if player.is_on_floor():
		return idle
	elif player.velocity.y >= 0:
		return fall
	return null
