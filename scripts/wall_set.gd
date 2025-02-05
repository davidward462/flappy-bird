extends Node2D  

var speed = 90.0
const DIRECTION = -1
signal point_scored

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func free_if_out_of_bounds(bound: int) -> void:
	if position.x < bound:
		print("freed")
		self.remove_from_group("existing_walls")   
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# move
	position.x += speed * delta * DIRECTION
	# free
	free_if_out_of_bounds(-100)
		
func stop_movement() -> void:
	speed = 0

func collision(body: Node2D) -> void:
	body.fall()

func _on_upper_wall_body_entered(body: Node2D) -> void:
	collision(body)

func _on_lower_wall_body_entered(body: Node2D) -> void:
	collision(body)

func _on_score_area_body_entered(body: Node2D) -> void:
	emit_signal("point_scored")
