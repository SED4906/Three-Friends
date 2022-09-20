extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var switched_off=0
export var swiched_off_threshold=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if switched_off > swiched_off_threshold:
		visible = false
		collision_layer = 0
		collision_mask = 0
	else:
		visible = true
		collision_layer = 1
		collision_mask = 1
