extends Area2D


# Called when the node enters the scene tree for the first time.



func _on_body_entered(body):
	if body in get_parent().get_tree().get_nodes_in_group("Player"):
		get_tree().change_scene_to_file("res://win_screen.tscn")
