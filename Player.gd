extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var deceleration_factor=0.0
export var acceleration_factor=0.0
export var maximum_speed=0.0
export var active_player=false
export var can_push_cube_buttons=false
export var can_push_rotom_buttons=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var velocity = Vector2.ZERO
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var pos = get_global_mouse_position() - position
	if Input.is_action_just_pressed("movement"):
		$Movement.play()
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and active_player:
		velocity += acceleration_factor*pos.normalized()*delta
		velocity.clamped(maximum_speed)
	else:
		$Movement.stop()
		velocity /= deceleration_factor
	velocity = move_and_slide(velocity, Vector2.UP)
