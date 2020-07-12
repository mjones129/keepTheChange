extends Node2D

func _ready():
	pass


func _on_jumpButton_pressed():
	Input.is_action_just_pressed("jump")
	$coin/coinBody.apply_impulse(Vector2(0,0), Vector2(0,-200))
	$machineBang.play()
