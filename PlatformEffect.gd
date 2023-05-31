extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("platform_ability"):
		visible=true
		$"../Ability".play()
	if Input.is_action_just_released("platform_ability"):
		visible=false
		$"../Ability".stop()
	$"../Line2D".visible = visible
	$"../Line2D".points = [[0.0,0.0],get_local_mouse_position().limit_length(128.0)]
	$"../Line2D".default_color.a = 1 if get_local_mouse_position().length() <= 128.0 else 0.25
