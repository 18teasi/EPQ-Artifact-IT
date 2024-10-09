extends Node2D
var turret_scene: PackedScene = preload("res://Assets/Characters/Enemies/gun_robot.tscn")
signal spawned(object)
# Called when the node enters the scene tree for the first time.
func on_turret_spawn():
	var turret = turret_scene.instantiate() as Node2D
	turret.set_meta("Active",true)
	turret.scale = Vector2(0.35,0.35)
	add_child(turret)
	spawned.emit(turret)


func _on_camera_2d_bossfight_phase_1():
	on_turret_spawn()
