extends Node

var rng = RandomNumberGenerator.new()
var wall_scene = preload("res://scenes/wall.tscn")
var wall_spawn_x_pos = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	
func create_wall()  -> void:
	# create upper and lower parts
	var center_height = randf_range(-150, 150)
	#var center_height = 0
	
	create_block(wall_spawn_x_pos, center_height)
	create_block(wall_spawn_x_pos, center_height+400)
	 
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
	if Input.is_action_just_pressed("ui_down"):
		create_wall()
