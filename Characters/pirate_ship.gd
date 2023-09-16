extends CharacterBody2D


@export var rotational_speed = 1.5
@export var speed = 200

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("turn to port", "turn to starboard")
	velocity = transform.x * Input.get_axis("slow down", "forward") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotational_speed * delta
	move_and_slide()
