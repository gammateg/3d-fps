extends CharacterBody3D

@export var speed = 100
@export var sens = 0.003

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseMotion):
		rotation.y -= event.relative.x * sens
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x-event.relative.y * sens, -1.6, 1.6)
		print($Camera3D.rotation.x)
