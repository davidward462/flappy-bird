extends Node2D  

var speed = 90.0
const DIRECTION = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# move
	position.x += speed * delta * DIRECTION
	
	# free
	if position.x < -100:
		print("freed")
		queue_free()
