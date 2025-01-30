extends Node2D
var powernodescene:PackedScene = preload("res://Assets/Characters/Enemies/Power node.tscn")
signal spawned(object)
# Called when the node enters the scene tree for the first time.
func spawn_node():
	var powernode = powernodescene.instantiate() as Node2D
	add_child(powernode)
	spawned.emit(powernode)
	print("powernode Spawn attempted")
	

func _on_camera_2d_bossfight_phase_1():
	spawn_node()
