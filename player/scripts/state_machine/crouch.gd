class_name PlayerCrouch extends PlayerState

@export var deacceleration : float = 4.0

@onready var collision_shape_2d: CollisionShape2D = $"../../CollisionShape2D"
@onready var collision_shape_2d_crouch: CollisionShape2D = $"../../CollisionShape2D_Crouch"
@onready var ray_cast_2d: RayCast2D = $RayCast2D

func init() -> void:
	ray_cast_2d.enabled = false

func enter() -> void:
	collision_shape_2d.disabled = true
	collision_shape_2d_crouch.disabled = false
	ray_cast_2d.enabled = true
	player.animation_player.play( "crouch" )
	pass

func exit() -> void:
	collision_shape_2d.disabled = false
	collision_shape_2d_crouch.disabled = true
	ray_cast_2d.enabled = false
	pass

func handle_input( _event : InputEvent ) -> PlayerState:
	if _event.is_action_pressed("jump"):
		if ray_cast_2d.is_colliding():
			player.position.y += 2
			return fall
		return jump
	return null

func process( _delta : float ) -> PlayerState:
	return null

func physics_process( _delta : float ) -> PlayerState:
	player.update_velocity(0, deacceleration )
	if direction.y <= 0:
		return idle
	elif !player.is_on_floor():
		return fall
	return null
