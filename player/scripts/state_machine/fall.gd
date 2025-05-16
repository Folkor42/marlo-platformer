class_name PlayerFall extends PlayerState

@export_custom( PROPERTY_HINT_NONE, "suffix:px/s" ) var base_move_speed : float = 100
@export var acceleration : float = 8
@export var coyote_time : float = 0.125
@export var fall_gravity_multiplier : float = 1.165

var coyote_timer : float
var move_speed : float 

func enter() -> void:
	player.animation_player.play("fall")
	move_speed = maxf(base_move_speed, abs(player.velocity.x))
	player.gravity_multipler = fall_gravity_multiplier
	
	coyote_timer = coyote_time
	if state_machine.previous_state == jump:
		coyote_timer=0
	pass

func exit() -> void:
	player.gravity_multipler = 1.0
	pass

func handle_input( _event : InputEvent ) -> PlayerState:
	if coyote_timer > 0:
		if _event.is_action_pressed("jump"):
			return jump
	return null

func process( _delta : float ) -> PlayerState:
	return null

func physics_process( _delta : float ) -> PlayerState:
	coyote_timer -= _delta
	player.update_velocity( direction.x * move_speed, acceleration )
	if player.is_on_floor():
		return idle
	return null
