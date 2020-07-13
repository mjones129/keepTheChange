extends RigidBody2D


func _input(event):
	if Input.is_action_just_pressed("jump"):
		apply_impulse(Vector2(0, 0), Vector2(0, -600))


func _physics_process(delta):
	pass

