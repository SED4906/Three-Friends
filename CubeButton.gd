extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var target: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_CubeButton_body_entered(body):
	if body.can_push_cube_buttons:
		$PushSound.play()
		$Layers/Layer3.translate(Vector2(0,1))
		get_tree().root.get_node(target).switched_off += 1


func _on_CubeButton_body_exited(body):
	if body.can_push_cube_buttons:
		$UnpushSound.play()
		$Layers/Layer3.translate(Vector2(0,-1))
		get_tree().root.get_node(target).switched_off -= 1
