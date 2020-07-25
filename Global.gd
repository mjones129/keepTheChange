extends Node

var coinsRemaining
var allCoins = []
var Stage1 = preload("res://Stage1.tscn")
var finalScore = 0
var dialogCanRun = true
var coinsInTray = []


func _ready():
	pass

func _physics_process(_delta):
	coinsRemaining = allCoins.size()
