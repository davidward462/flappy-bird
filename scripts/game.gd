extends Node

var wall_scene = preload("res://scenes/wall.tscn")
var wall_spawn_x_pos = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func create_wall() -> void:
	# create upper and lower parts
	create_block(wall_spawn_x_pos, 550)
	create_block(wall_spawn_x_pos, 100)
	
func create_block(x_pos, y_pos) -> void:
	# create instance
	var instance = wall_scene.instantiate()
	add_child(instance)
	# set position
	instance.position.x = x_pos
	instance.position.y = y_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# for testing only
	if Input.is_action_pressed("ui_down"):
		create_wall()
