 extends Node2D

var pings = []
var bangs = []
var coin = load("res://coin2.tscn") # might not need this
var coinNode = coin.instance() # might not need this either

func _ready():
	gather_coins()
	gather_bangs()
	
	
	
	#loop all the pings into an array
	for i in $Control.get_children():
		pings.append(i)
		
func _physics_process(_delta):

	
	#set camera position
	positionCamera()

	#bang on the machine
	if Input.is_action_just_pressed("jump"):
		$Camera2D.shake(0.2, 15, 8)
		bangs.shuffle()
		bangs[0].play()
	
	#display number of coins remaining
	$CanvasLayer/Control/HBoxContainer/coinsRemaining.set_text("COINS REMAINING: " + str($"/root/Global".coinsRemaining))
	
	#display final score
	$CanvasLayer/Control/HBoxContainer/finalScore.set_text("FINAL SCORE: " + str($"/root/Global".finalScore))
	
	#End Game Logic
	if $"/root/Global".allCoins.size() == 0:
		#append final score coins to scene
#		for i in $"/root/Global".coinsInTray: #Problem line
#			$all2Coins.add_child(i) #Problem line
		$"/root/Global".dialogCanRun = false
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

func gather_bangs():
	for i in $bangs.get_children():
		bangs.append(i)

func _on_outOfBounds_body_entered(body):
	body.get_parent().remove_child(body)
	gather_coins()


func _on_Area2D_body_entered(body):
	$poof.play()
	body.get_parent().remove_child(body)
	gather_coins()


func _on_coinTray_body_entered(body):
	$"/root/Global".finalScore = $"/root/Global".finalScore + 1
	$traySound.play()
	$"/root/Global".coinsInTray.append(body)
	body.get_parent().remove_child(body)
	gather_coins()


func _on_RigidBody2D_body_entered(body):
	#play a random ping on contact
	pings.shuffle()
	pings[0].play()


