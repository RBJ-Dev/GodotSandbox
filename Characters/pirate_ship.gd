extends CharacterBody2D

signal port_cannons_fired
signal starboard_cannons_fired

@export var rotational_speed = 1.5
@export var speed = 200

var rotation_direction = 0
var port_cannons_ready: bool = true
var starboard_cannons_ready: bool = true

func get_move_input():
	rotation_direction = Input.get_axis("turn to port", "turn to starboard")
	velocity = transform.x * Input.get_axis("slow down", "forward") * speed

func _process(delta):
	if Input.is_action_pressed("fire port cannons") and port_cannons_ready:
		port_cannons_ready = false
		port_cannons_fired.emit()
		$PortCannonsReload.start()
	
	if Input.is_action_pressed("fire starboard cannons") and starboard_cannons_ready:
		starboard_cannons_ready = false
		starboard_cannons_fired.emit()
		$StarboardCannonsReload.start()

func _physics_process(delta):
	get_move_input()
	rotation += rotation_direction * rotational_speed * delta
	move_and_slide()


func _on_port_cannons_reload_timeout():
	port_cannons_ready = true


func _on_starboard_cannons_reload_timeout():
	starboard_cannons_ready = true
