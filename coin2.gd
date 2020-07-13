extends RigidBody2D

var canJump = true

func _input(event):
	if Input.is_action_just_pressed("jump") && canJump:
		apply_impulse(Vector2(0, 0), Vector2(0, -600))
		canJump = false
		$Timer.start()
	else:
		pass


func _physics_process(delta):
	pass



func _on_Timer_timeout():
	canJump = true
