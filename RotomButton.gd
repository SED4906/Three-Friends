extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var target: String
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("sed_ability") and is_pushed:
		is_on=!is_on
		if is_on:
			get_tree().root.get_node(target).switched_off += 1
			$PushSound.play()
			$Layers/Layer3.translate(Vector2(0,1))
		else:
			get_tree().root.get_node(target).switched_off -= 1
			$Layers/Layer3.translate(Vector2(0,-1))
			$UnpushSound.play()

var is_pushed=false
var is_on=false

func _on_RotomButton_body_entered(body):
	if body.can_push_rotom_buttons:
		is_pushed = true


func _on_RotomButton_body_exited(body):
	if body.can_push_rotom_buttons:
		is_pushed = false
