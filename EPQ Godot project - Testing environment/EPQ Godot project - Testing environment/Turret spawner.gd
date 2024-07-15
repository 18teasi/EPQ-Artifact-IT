extends Node2D
var turret_scene: PackedScene = preload("res://Assets/Characters/Enemies/Turret.tscn")

# Called when the node enters the scene tree for the first time.
func on_turret_spawn():
	var turret = turret_scene.instantiate() as Node2D
	add_child(turret)
