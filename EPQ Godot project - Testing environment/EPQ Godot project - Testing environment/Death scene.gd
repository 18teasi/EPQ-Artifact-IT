extends Node2D



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Assets/testing scene.tscn")
	Global.currentammo = [0,0,150]

