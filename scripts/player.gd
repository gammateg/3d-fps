extends CharacterBody3D

@export var speed = 10
@export var sens = 0.003
@export var gravity = 9.8
@export var jump_force = 7.0

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left","right","back","front")
	var dir = transform.basis * Vector3(input_dir.x, 0, -input_dir.y).normalized() * speed
	
	velocity.x = dir.x
	velocity.z = dir.z
	
	velocity.y -= gravity * delta
	
	if (Input.is_action_just_pressed("jump") and is_on_floor()):
		velocity.y = jump_force
	
	print(velocity)
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseMotion):
		rotation.y -= event.relative.x * sens
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x-event.relative.y * sens, -1.6, 1.6)
		print($Camera3D.rotation.x)
