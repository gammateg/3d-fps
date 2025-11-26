extends CharacterBody3D

@export var speed = 100
@export var sens = 0.01

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if (event is InputEventMouse):
		print(event.relative)
