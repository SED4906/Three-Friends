extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var switched_off=0
export var switched_off_prev=0
export var swiched_off_threshold=0
var flash_timer=0
var flashing=false
var flashed=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if switched_off != switched_off_prev:
		flash_timer = 0
		flashing = true
		switched_off_prev = switched_off
		if switched_off > swiched_off_threshold:
			flashed = false
	if flashing:
		$Line2D.default_color = Color(1,1,1,1-flash_timer/0.4)
		if flash_timer > 0.4:
			flashing = false
			flashed = true
			flash_timer = 0
		else:
			$Line2D.visible = true
			flashed = false
		flash_timer += delta
	if switched_off > swiched_off_threshold:
		if flashed:
			$Line2D.visible = false
		collision_layer = 0
		collision_mask = 0
	else:
		if not flashing:
			$Line2D.default_color = Color(0.4,0.5,1,1)
		$Line2D.visible = true
		collision_layer = 1
		collision_mask = 1
