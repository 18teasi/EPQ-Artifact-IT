extends Node2D

signal arenastart
# Called when the node enters the scene tree for the first time.
var closed = false


const doortexture = preload("res://Assets/PNGs/Lockdown door.png")
@export var speed = 2
@onready var animation = $AnimationPlayer

func _process(_delta):
	if Input.is_key_pressed(KEY_G):
		close()
	if Input.is_key_pressed(KEY_V):
		open()

func close():
	if not closed:
		$AnimatableBody2D/LockdownDoor.texture = doortexture
		animation.play("Open")
		var arena = get_meta("key")
		print("opening arena door",  arena)
		closed = true
func open():
	if closed:
		$AnimatableBody2D/LockdownDoor.texture = null
		animation.play("RESET")





func _on_area_2d_body_entered(body):
	if body in get_tree().get_nodes_in_group("Player"):
		close()





func _on_boss_fight_trigger_body_entered(body):
	if body in get_tree().get_nodes_in_group("Player"):
		close()


func _on_camera_2d_enddooropen():
	animation.play("Open_2")
	$AnimatableBody2D/LockdownDoor.texture = null
