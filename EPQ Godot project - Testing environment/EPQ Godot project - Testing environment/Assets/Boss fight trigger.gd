extends Area2D


signal bossfightstart()


func _on_body_entered(body):
	if body in get_tree().get_nodes_in_group("Player"):
		emit_signal("bossfightstart")
		
