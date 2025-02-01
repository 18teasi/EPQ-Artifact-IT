extends Sprite2D


func _on_area_2d_body_entered(body):
	if body in get_parent().get_tree().get_nodes_in_group("Player"):
		Global.currentammo[2] += 50
		if Global.currentammo[2]>Global.maxammo[2]:
			Global.currentammo[2] = 150
		queue_free()
