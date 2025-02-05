extends Node

var rng = RandomNumberGenerator.new()
var wall_set_scene = preload("res://scenes/wall_set.tscn")
var wall_spawn_x_pos = 400
const wall_spawn_y_offset = 338
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# timer
	var timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)
	randomize()
	
func create_wall(x_pos, y_pos)  -> void:
	var random_height = int(randf_range(-100, 100))
	var center_height = 0 + wall_spawn_y_offset + random_height
	var y_spawn = y_pos + center_height
	# create instance 
	var instance = wall_set_scene.instantiate()
	# set position
	instance.position.x = x_pos
	instance.position.y = y_spawn
	print("spawned wall at (" + str(x_pos) + ", " + str(y_spawn) + ")")
	add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout():
	create_wall(wall_spawn_x_pos, 0)
