 extends Node2D

#var pings = []
var bangs = []
var coin = load("res://coin2.tscn")


func _ready():
	add_new_coins()
	#loop through all bang sounds and put them in bangs []
	
#	connect_coins()
	
	gather_bangs()

	#clear the allCoins array, loop through all coins and add them to allCoins array
	gather_coins()


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
		$"/root/Global".dialogCanRun = false
		get_tree().reload_current_scene()
#		add_new_coins()
#		gather_bangs()
#		gather_coins()
		
func addEverything():
	var sum = Vector2(0, 0)
	for i in range(0, $"/root/Global".allCoins.size()):
		sum = $"/root/Global".allCoins[i].get_position() + sum
	return sum


func averageEverything():
	#average Vector2 posotion of all coins
	return (addEverything() / $"/root/Global".allCoins.size())


func positionCamera():
	#set camera position according to averageEverything()
	$Camera2D.position = averageEverything()


func gather_bangs():
	#loop through all the bang sound effects and put them into the bangs array
	for i in $bangs.get_children():
		bangs.append(i)
		
func connect_coins():
	#loop through all coins and connect the signal to the main script
	if !is_connected("body_entered", self, "_on_RigidBOdy2D_body_entered"):
		for i in $all2Coins.get_children():
			self.connect("body_entered", self, "_on_RigidBody2D_body_entered")


#func gather_pings():
#	#loop all the pings into an array
#	for i in $Control.get_children():
#		pings.append(i)

func add_new_coins():
	for i in $"/root/Global".finalScore:
		get_node("all2Coins").add_child(coin.instance())


func gather_coins():
	# clear the allCoins array, loop through all children of all2Coins and append them to allCoins array
	$"/root/Global".allCoins.clear()
	for i in $"all2Coins".get_children():
		$"/root/Global".allCoins.append(i)

func _on_Area2D_body_entered(body):
	#What happens when a coin hits the out of bounds body
	$poof.play()
	body.get_parent().remove_child(body)
	gather_coins()


func _on_coinTray_body_entered(body):
	$"/root/Global".finalScore = $"/root/Global".finalScore + 1
	$traySound.play()
#	$"/root/Global".coinsInTray.append(body)
	body.get_parent().remove_child(body)
	gather_coins()


func _on_RigidBody2D_body_entered(_body):
#	#play a random ping on contact
#	pings.shuffle()
#	pings[0].play()
	pass


