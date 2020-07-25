extends Control

var dialog = [
	"Man, what a dumpy coin machine... I hope you can get your money back!",
	"Tap anywhere to bang on the machine and bump the coins!",
	"Get all coins in the funnel to move on to the next level!",
]

var dialog_index = 0


func _ready():
	$DialogBox.visible = false
	
func _process(_delta):
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
		$"/root/Global".dialogCanRun = false
		$DialogBox.visible = false
		get_tree().paused = false
	dialog_index += 1


func _on_Timer_timeout():
	if $"/root/Global".dialogCanRun == true:
		get_tree().paused = true
		$DialogBox.visible = true
		load_dialog()
