extends Node2D

signal cannon_fired(cannon_position, direction)
var reload_time: float = 1.0

var loaded: bool = true

func fire_cannon():
	if loaded:
		loaded = false
		cannon_fired.emit(global_position, global_rotation)
		$Reload.start(reload_time)

func _on_reload_timeout():
	loaded = true
