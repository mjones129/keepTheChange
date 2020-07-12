extends Control

var dialog = [
	"Tap anywhere to hit the machine!",
	"This is another line of dialog just for testing purposes.",
	"Also, I always thought dialog was spelled dialogue."
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()
	
func load_dialog():
	if dialog_index < dialog.size():
		$ColorRect/RichTextLabel.bbcode_text = dialog[dialog_index]
		$ColorRect/RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$ColorRect/RichTextLabel, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1
