class_name Player extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var player_state_machine: PlayerStateMachine = $PlayerStateMachine

var gravity : float = 980
var gravity_multipler : float = 1.0

func _ready() -> void:
	player_state_machine.init( self )
	pass
	
func _physics_process( _delta : float ) -> void:
	if !is_on_floor():
		velocity.y += gravity * _delta * gravity_multipler
	move_and_slide()

func update_velocity( _velocity : float, _acceleration : float ) -> void:
	velocity.x = move_toward (velocity.x, _velocity, _acceleration)
	pass

func play_audio ( audio : AudioStream ) -> void:
	if audio == null:
		return
	audio_stream_player_2d.stream = audio
	audio_stream_player_2d.play()

func update_direction ( _dir : float ) -> void:
	if _dir < 0:
		sprite_2d.flip_h=true
	elif _dir > 0:
		sprite_2d.flip_h=false
	pass
