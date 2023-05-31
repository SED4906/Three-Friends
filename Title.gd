extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.window_borderless = true
	OS.window_size = OS.get_screen_size() - Vector2(2,2)
	OS.window_position = Vector2(1,1)
	get_tree().get_root().set_transparent_background(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit_game"):
		get_tree().quit(0)
	if Input.is_action_just_pressed("begin_game"):
		get_tree().change_scene("res://Level.tscn")
