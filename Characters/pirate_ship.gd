extends CharacterBody2D

@export var rotational_speed = 1.5
@export var speed = 200

signal cannon_fired
var rotation_direction = 0

func get_move_input():
	rotation_direction = Input.get_axis("turn to port", "turn to starboard")
	velocity = transform.x * Input.get_axis("slow down", "forward") * speed

func _process(_delta):
	if Input.is_action_pressed("fire port cannons"):
		$PortCannon.fire_cannon()
	
	if Input.is_action_pressed("fire starboard cannons"):
		$StarboardCannon.fire_cannon()

func _physics_process(delta):
	get_move_input()
	rotation += rotation_direction * rotational_speed * delta
	move_and_slide()


func _on_port_cannon_cannon_fired(cannon_position, direction):
	cannon_fired.emit(cannon_position, direction)


func _on_starboard_cannon_cannon_fired(cannon_position, direction):
	cannon_fired.emit(cannon_position, direction)
