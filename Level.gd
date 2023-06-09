extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var has_clicked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.window_borderless = true
	OS.window_size = OS.get_screen_size() - Vector2(2,2)
	OS.window_position = Vector2(1,1)
	get_tree().get_root().set_transparent_background(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		has_clicked = true
	if has_clicked:
		get_node("/root/Stopwatch").time_taken += delta
	if Input.is_action_just_pressed("exit_game"):
		get_tree().quit(0)
	if Input.is_action_just_pressed("switch_player"):
		var found_active_player=false
		var activated_next=false
		for player in $"Players".get_children():
			if found_active_player:
				player.active_player = true
				activated_next = true
				break
			if player.active_player:
				player.active_player = false
				found_active_player=true
		if not activated_next:
			for player in $"Players".get_children():
				player.active_player = true
				break
	for player in $"Players".get_children():
		if player.active_player:
			$Camera2D.position = player.position
