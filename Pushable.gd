extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var can_push_cube_buttons=true
export var pushable=false
export var pullable=false
export var show_rotation_of=0
export var can_push_rotom_buttons=false

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("platform_ability") and pullable and get_local_mouse_position().length() < 24:
		var platpos = get_tree().root.get_node("Level/Players/Platform").position
		if (platpos - position).length() < 256:
			show_rotation_of = get_angle_to(platpos)
			velocity += (platpos-position).normalized()*16.0
			velocity = velocity.clamped(128)
	else:
		velocity /= 8.0

func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2.UP)
