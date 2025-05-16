class_name PlayerState extends Node

static var player : Player
static var state_machine : PlayerStateMachine
static var direction : Vector2

@onready var idle: PlayerIdle = %Idle
@onready var run: PlayerRun = %Run
@onready var jump: PlayerJump = %Jump
@onready var fall: PlayerFall = %Fall
@onready var crouch: PlayerCrouch = %Crouch

func _ready() -> void:
	pass # Replace with function body.

func init() -> void:
	pass
	
func enter() -> void:
	pass

func exit() -> void:
	pass

func handle_input( _event : InputEvent ) -> PlayerState:
	return null

func process( _delta : float ) -> PlayerState:
	return null

func physics_process( _delta : float ) -> PlayerState:
	return null
