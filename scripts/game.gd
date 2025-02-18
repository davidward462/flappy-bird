extends Node

var wall_set_scene = preload("res://scenes/wall_set.tscn")
const wall_spawn_x_pos = 400
const wall_spawn_y_offset = 338
var score = 0
var game_running = false

@onready var player_node = get_node("Player")
@onready var timer = get_node("Timer")
@onready var score_label: Label = $UI/Score_label
@onready var background: ParallaxBackground = $Background/ParallaxBackground
@onready var bg_trees: ParallaxLayer = $Background/ParallaxBackground/bg_trees
@onready var text_0: Label = $UI/Text0
@onready var text_1: Label = $UI/Text1
@onready var title: Label = $UI/Title

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# timer
	timer.timeout.connect(_on_timer_timeout)
	timer.stop()
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
	
func start_game() -> void:
	print("start_game()")
	background.start_movement()
	bg_trees.start_movement()
	timer.start()  
	player_node.start_player()
	text_0.queue_free()
	text_1.queue_free()
	title.queue_free()
	score_label.visible = true
	
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
	
	# input for game restart.
	# Only restart the game when restart is pressed, and player is dead.
	if Input.is_action_just_pressed("restart") and not player_node.alive:
		restart_game()
		
	# Start the game if the jump key is pressed on the title screen.
	# On the title screen, game_running is false, and the player is alive.
	# This is the main indicator that the game is on the title screen.
	# Do not start the game if jump is presssed when the game is running.
	if Input.is_action_just_pressed("jump"):
		if not game_running and player_node.alive:
			start_game()
			game_running = true
	
	# stop the timer if the player is dead.
	if game_running:
		if not player_node.alive:
			stop_game()

func _on_timer_timeout() -> void:
	create_wall(wall_spawn_x_pos, 0)
