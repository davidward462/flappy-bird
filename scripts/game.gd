extends Node

var wall_set_scene = preload("res://scenes/wall_set.tscn")
const wall_spawn_x_pos = 400
const wall_spawn_y_offset = 338
var score = 0
var game_running = true

@onready var player_node = get_node("Player")
@onready var timer = get_node("Timer")
@onready var score_label: Label = $Score_label
@onready var background: ParallaxBackground = $ParallaxBackground
@onready var bg_trees: ParallaxLayer = $ParallaxBackground/bg_trees

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# timer
	timer.timeout.connect(_on_timer_timeout)
	randomize()
	set_score_ui()
	
func calc_y_spawn_pos(y_pos) -> int:
	var random_height = int(randf_range(-80, 200))
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
	
	# add child to node tree
	add_child(instance)
	
	# add to group of walls on screen
	instance.add_to_group("existing_walls")
	instance.connect('point_scored', increment_score)
	
func set_score_ui() -> void:
	score_label.text = str(score)
	
func increment_score() -> void:
	score += 1
	set_score_ui()
	
func restart_game() -> void:
	get_tree().reload_current_scene()
	
func stop_game() -> void:
	timer.stop()
	get_tree().call_group("existing_walls", "stop_movement")
	background.stop_movement()
	bg_trees.stop_movement()
	game_running = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# input for game restart
	if Input.is_action_just_pressed("restart") and not player_node.alive:
		restart_game()
	
	# stop the timer if the player is dead.
	# Maybe this should be done with a signal.
	if game_running:
		if not player_node.alive:
			stop_game()

func _on_timer_timeout() -> void:
	create_wall(wall_spawn_x_pos, 0)
