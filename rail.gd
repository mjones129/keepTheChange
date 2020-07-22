extends Area2D

var clinks = []


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in $allClinks.get_children():
		clinks.append(i)


func _on_rail_body_entered(body):
	clinks.shuffle()
	clinks[0].play()
