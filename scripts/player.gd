extends CharacterBody2D

const JUMP_VELOCITY = -600.0
const GRAVITY = Vector2(0, 2000)

func _ready():
	# set gravity multiplier
	pass

func fall():
	print("collsion")

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	#velocity += get_gravity() * delta
	velocity += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()
