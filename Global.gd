extends Node

var coinsRemaining
var allCoins = []
var Stage1 = preload("res://Stage1.tscn")
var finalScore = 0


func _ready():
	pass

func _physics_process(delta):
	coinsRemaining = allCoins.size()
