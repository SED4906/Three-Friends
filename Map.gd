extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(10):
		add_child($"Layer1".duplicate())
	$"Layer1".collision_layer = 1
	$"Layer1".collision_mask = 1
	$"Layer1".occluder_light_mask = 1
	var i=0
	for layer in $".".get_children():
		if layer != $"Layer1":
			for n in [12,13,14,15,16,17,18,19,20,21,22,23]:
				for cell in layer.get_used_cells_by_id(n):
					layer.set_cellv(cell,-1)
		layer.translate(Vector2(0,-i))
		i+=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
