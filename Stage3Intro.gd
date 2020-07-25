extends Node2D


func _process(_delta):
	$Control/countdown.set_text(str(round($Timer.time_left)))
	


func _on_Timer_timeout():
	get_tree().change_scene("res://Stage3.tscn")
