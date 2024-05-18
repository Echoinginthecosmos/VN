extends Node


var hit = false
var health = 100
var MusVol = 75
var Effvol = 75
var Damage = 1
var talkin = false


func _ready():
	if hit == true:
		health -= Damage
		print("hit")
		hit == false
