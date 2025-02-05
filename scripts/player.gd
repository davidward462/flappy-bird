extends CharacterBody2D

const JUMP_VELOCITY = -600.0
const GRAVITY = Vector2(0, 2000)
var alive = true

func _ready():
	pass

func fall():
	if alive:
		alive = false
		velocity.y = 0
		print("collsion")

func _physics_process(delta: float) -> void:
	# Add the gravity
	velocity += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and alive:
		velocity.y = JUMP_VELOCITY

	move_and_slide()
