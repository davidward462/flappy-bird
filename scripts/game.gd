extends Node

var rng = RandomNumberGenerator.new()
var wall_set_scene = preload("res://scenes/wall_set.tscn")
var wall_spawn_x_pos = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	
func create_wall(x_pos, y_pos)  -> void:
	#var center_height = randf_range(-200, 200)
	var center_height = 0
	# create instance
	var instance = wall_set_scene.instantiate()
	add_child(instance)
	# set position
	instance.position.x = x_pos
	instance.position.y = y_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# for testing only
	if Input.is_action_just_pressed("ui_down"):
		create_wall(wall_spawn_x_pos, 0)
