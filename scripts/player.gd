extends CharacterBody2D

const JUMP_VELOCITY = -600.0
const GRAVITY = Vector2(0, 2000)
var alive = true
@onready var animated_sprite: AnimatedSprite2D = $Sprite2D/AnimatedSprite2D

func _ready() -> void:
	pass

func fall() -> void:
	if alive:
		alive = false
		velocity.y = 0
		print("collsion")
		
#func _process(delta: float) -> void:
	#if Input.is_action_pressed("jump"):
	#	animated_sprite.set_frame(1)
	#else:
	#	animated_sprite.set_frame(0)

func _physics_process(delta: float) -> void:
	# Add the gravity
	velocity += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and alive:
		velocity.y = JUMP_VELOCITY
		

	move_and_slide()
