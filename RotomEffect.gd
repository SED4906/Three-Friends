extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("sed_ability"):
		visible=true
		$"../Ability".play()
	if Input.is_action_just_released("sed_ability"):
		visible=false
		$"../Ability".stop()
