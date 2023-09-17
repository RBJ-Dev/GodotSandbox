extends Node2D

var cannonball_scene: PackedScene = preload("res://Projectiles/cannon_ball.tscn")

var speed = 200


func _on_pirate_ship_cannon_fired(cannon_location, direction):
	var cannonball = cannonball_scene.instantiate() as RigidBody2D
	cannonball.position = cannon_location
	cannonball.linear_velocity = Vector2.from_angle(direction) * speed
	add_child(cannonball)
