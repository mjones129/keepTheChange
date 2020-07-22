extends RigidBody2D

var canJump = true

func _ready():
	#connect the on_body_entered signal to Stage1.gd so it can trigger 'plink' sounds
	if !is_connected("body_entered", self, "_on_RigidBody2D_body_entered"):
		setup_connection()


func _input(_event):
	#kick all coins up when you tap. Limit the jumps to every 1 second
	if Input.is_action_just_pressed("jump") && canJump:
		apply_impulse(Vector2(0, 0), Vector2(0, -600))
		canJump = false
		$Timer.start()
	else:
		pass


func _on_Timer_timeout():
	canJump = true
	
func setup_connection():
	self.connect("body_entered", self, "_on_RigidBody2D_body_entered")


func _on_RigidBody2D_body_entered(_body):
	$Control/c1.play()
