extends Node2D
var turret_scene: PackedScene = preload("res://Assets/Characters/Enemies/Turret.tscn")
@export var arena = 0

signal spawned(object)
# Called when the node enters the scene tree for the first time.
func on_turret_spawn():
	var turret = turret_scene.instantiate() as Node2D
	turret.set_meta("Active",true)
	add_child(turret)
	spawned.emit(turret)
func _ready():
	for trigger in get_tree().get_nodes_in_group("ArenaTrigger"):
		trigger.connect("arenastart",onarenaspawn)

func _on_camera_2d_bossfight_phase_1():
	on_turret_spawn()
	
func onarenaspawn(activearena):
	if activearena == arena:
		on_turret_spawn()
