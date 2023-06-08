extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var i=0
	for layer in $".".get_children():
		layer.frame = i
		layer.position = Vector2(0,-i)
		i+=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"..".active_player:
		var pos = get_global_mouse_position() - position
		for layer in $".".get_children():
			layer.rotation = get_angle_to(pos)
		$"../Collision".rotation = get_angle_to(pos)
