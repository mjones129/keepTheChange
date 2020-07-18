 
extends Node2D

func _ready():
	gather_coins()
#	$"/root/Global".Stage1 = self
	
func _physics_process(_delta):
	print("Final Score: " + str($"/root/Global".finalScore))
	#set camera position
	positionCamera()
	
	#bang on the machine
	if Input.is_action_just_pressed("jump"):
		$machineBang.play()
	
	#display number of coins remaining
	$CanvasLayer/Control/HBoxContainer/coinsRemaining.set_text("COINS REMAINING: " + str($"/root/Global".coinsRemaining))
	
	#display final score
	$CanvasLayer/Control/HBoxContainer/finalScore.set_text("FINAL SCORE: " + str($"/root/Global".finalScore))
	
	
	if $"/root/Global".allCoins.size() == 0:
		#load the ending game screen
		get_tree().reload_current_scene()
		
func addEverything():
	var sum = Vector2(0, 0)
	for i in range(0, $"/root/Global".allCoins.size()):
		sum = $"/root/Global".allCoins[i].get_position() + sum
	return sum
	
func gather_coins():
	$"/root/Global".allCoins.clear()
	for i in $"all2Coins".get_children():
		$"/root/Global".allCoins.append(i)
	
	
func averageEverything():
	return (addEverything() / $"/root/Global".allCoins.size())
	
func positionCamera():
	$Camera2D.position = averageEverything()

func _on_jumpButton_pressed():
	pass
	

func _on_outOfBounds_body_entered(body):
	body.get_parent().remove_child(body)
	gather_coins()


func _on_Area2D_body_entered(body):
	body.get_parent().remove_child(body)
	gather_coins()


func _on_coinTray_body_entered(body):
	$"/root/Global".finalScore = $"/root/Global".finalScore + 1
	body.get_parent().remove_child(body)
	gather_coins()
