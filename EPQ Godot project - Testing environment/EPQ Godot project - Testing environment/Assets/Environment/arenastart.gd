extends Node2D
@export var arena: int
signal arenastart(arena)
var activated = false



func _on_area_2d_body_entered(body):
	if body in get_parent().get_tree().get_nodes_in_group("Player") and not activated:
		print("Enter",arena)
		arenastart.emit(arena)
		activated = true
