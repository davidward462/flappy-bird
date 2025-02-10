extends CharacterBody2D

const JUMP_VELOCITY = -600.0
const GRAVITY = Vector2(0, 2000)
var alive = true
@onready var animated_sprite: AnimatedSprite2D = $Sprite2D/AnimatedSprite2D
@onready var flap_sound: AudioStreamPlayer2D = $FlapSound
@onready var caw_sound: AudioStreamPlayer2D = $CawSound

func _ready() -> void:
	pass

func fall() -> void:
	if alive:
		caw_sound.play()
		animated_sprite.set_frame(2)
		alive = false
		velocity.y = 0
		
#func _process(delta: float) -> void:
	#if Input.is_action_pressed("jump"):
		
	#else:
		#

func _physics_process(delta: float) -> void:
	# Add the gravity
	velocity += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and alive:
		animated_sprite.set_frame(1)
		velocity.y = JUMP_VELOCITY
		flap_sound.play()
	
	if Input.is_action_just_released("jump") and alive:
		animated_sprite.set_frame(0)
		
	move_and_slide()
