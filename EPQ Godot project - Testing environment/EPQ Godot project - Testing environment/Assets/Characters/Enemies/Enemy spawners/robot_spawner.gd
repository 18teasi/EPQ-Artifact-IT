extends Node2D
var turret_scene: PackedScene = preload("res://Assets/Characters/Enemies/gun_robot.tscn")
@export var selfarena = 0
signal spawned(object)


func on_turret_spawn():
	var turret = turret_scene.instantiate() as Node2D
	turret.set_meta("Active",true)
	turret.scale = Vector2(0.35,0.35)
	add_child(turret)
	spawned.emit(turret)

func _ready():
	for trigger in get_tree().get_nodes_in_group("ArenaTrigger"):
		trigger.connect("arenastart",onarenaspawn)

func _on_camera_2d_bossfight_phase_1():
	on_turret_spawn()
	
func onarenaspawn(activearena):
	if activearena == selfarena:
		on_turret_spawn()
