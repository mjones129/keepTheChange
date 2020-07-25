extends Control

func _process(_delta):
	if Input.is_action_just_pressed("jump"):
		$"/root/Global".finalScore = 0
		get_tree().change_scene("res://IntroCutscene.tscn")
