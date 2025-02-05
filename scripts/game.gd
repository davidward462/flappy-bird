extends Node

var rng = RandomNumberGenerator.new()
var wall_set_scene = preload("res://scenes/wall_set.tscn")
var wall_spawn_x_pos = 400
const wall_spawn_y_offset = 338
var score = 0
var game_running = true
@onready var player_node = get_node("Player")
@onready var timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# timer
	timer.timeout.connect(_on_timer_timeout)
	randomize()
	
func calc_y_spawn_pos(y_pos) -> int:
	var random_height = int(randf_range(-100, 100))
	var center_height = 0 + wall_spawn_y_offset + random_height
	var y_spawn = y_pos + center_height
	return y_spawn
	
func create_wall(x_pos, y_pos)  -> void:
	var y_spawn = calc_y_spawn_pos(y_pos)
	
	
	# create instance 
	var instance = wall_set_scene.instantiate()
	
	# set position
	instance.position.x = x_pos
	instance.position.y = y_spawn
	
	# for debug
	print("spawned wall at (" + str(x_pos) + ", " + str(y_spawn) + ")")
	
	# add child to node tree
	add_child(instance)
	
	# add to group of walls on screen
	instance.add_to_group("existing_walls")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# stop the timer if the player is dead.
	# Maybe this should be done with a signal.
	if game_running:
		if not player_node.alive:
			timer.stop()
			get_tree().call_group("existing_walls", "stop_movement")
			game_running = false

func _on_timer_timeout():
	create_wall(wall_spawn_x_pos, 0)
