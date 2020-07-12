extends Control

var dialog = [
	"Tap anywhere to hit the machine!",
	"This is another line of dialog just for testing purposes.",
	"Also, I always thought dialog was spelled dialogue."
]

var dialog_index = 0
var finished = false

func _ready():
	$DialogBox.visible = false
	
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		load_dialog()
	
func load_dialog():
	if dialog_index < dialog.size():
		$DialogBox/ColorRect/RichTextLabel.bbcode_text = dialog[dialog_index]
		$DialogBox/ColorRect/RichTextLabel.percent_visible = 0
		$DialogBox/Tween.interpolate_property(
			$DialogBox/ColorRect/RichTextLabel, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$DialogBox/Tween.start()
	else:
		queue_free()
		$DialogBox.visible = false
		get_tree().paused = false
	dialog_index += 1


func _on_Timer_timeout():
	get_tree().paused = true
	$DialogBox.visible = true
	load_dialog()
