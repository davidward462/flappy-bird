extends Node

var rng = RandomNumberGenerator.new()
var wall_set_scene = preload("res://scenes/wall_set.tscn")
var wall_spawn_x_pos = 400
const wall_spawn_y_offset = 338

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	
func create_wall(x_pos, y_pos)  -> void:
	var random_height = randf_range(-100, 100)
	var center_height = 0 + wall_spawn_y_offset + random_height
	
	# create instance 
	var instance = wall_set_scene.instantiate()
	# set position
	instance.position.x = x_pos
	instance.position.y = y_pos + center_height
	add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# for testing only
	if Input.is_action_just_pressed("ui_down"):
		create_wall(wall_spawn_x_pos, 0)
