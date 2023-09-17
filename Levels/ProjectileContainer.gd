extends Node2D

var cannonball_scene: PackedScene = preload("res://Projectiles/cannon_ball.tscn")


func _on_pirate_ship_cannon_fired():
	var cannonball = cannonball_scene.instantiate()
	add_child(cannonball)
