extends Node

var wall_scene = preload("res://scenes/wall.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_wall()
	pass # Replace with function body.
	
func create_upper_wall() -> void:
	# create instance
	var instance = wall_scene.instantiate()
	add_child(instance)
	
	# set position
	instance.position.y = 550
	instance.position.x = 400	

func create_lower_wall() -> void:
	# create instance
	var instance = wall_scene.instantiate()
	add_child(instance)
	
	# set position
	instance.position.y = 550
	instance.position.x = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# for testing only
	if Input.is_action_pressed("ui_down"):
		create_upper_wall()
		create_lower_wall()
