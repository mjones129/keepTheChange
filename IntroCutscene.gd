extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	OS.native_video_play("res://billInsert_2M.webm", 0, "0", "none")
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene("res://Stage1.tscn")


func _on_VideoPlayer_finished():
	get_tree().change_scene("res://Stage1.tscn")
	
	
	
	#video source path: res://billInsert_2M.webm
	# volume: float
	# audio track: string
	# subtitle track: string
