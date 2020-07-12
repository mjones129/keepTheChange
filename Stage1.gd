extends Node2D

var allCoins = Array()
var number = allCoins.size()

func _ready():
	gather_coins()

func _physics_process(delta):
	print(averageEverything())
	positionCamera()
	
func addEverything():
	var sum = Vector2(0, 0)
	for i in range(0, allCoins.size()):
		sum = allCoins[i].get_position() + sum
	return sum
	
func gather_coins():
	for i in get_node("all2Coins").get_children():
		allCoins.append(i)
	
func averageEverything():
	return (addEverything() / allCoins.size())
	
func positionCamera():
	$Camera2D.position = averageEverything()

func _on_jumpButton_pressed():
	pass
