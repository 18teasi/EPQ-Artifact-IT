extends Path2D

signal arenastart
# Called when the node enters the scene tree for the first time.

const doortexture = preload("res://Assets/PNGs/Lockdown door.png")
@export var active = false
@export var speed = 2
var arena = $".".get_meta("key")
@onready var path = $PathFolllow2D
@onready var animation = $AnimationPlayer

func _process(_delta):
	if Input.is_key_pressed(KEY_G):
		close()
	if Input.is_key_pressed(KEY_V):
		open()

func close():
	if not active:
		$AnimatableBody2D/LockdownDoor.texture = doortexture
		animation.play("Open")
		print("opening arena door", arena)
func open():
	if not active:
		$AnimatableBody2D/LockdownDoor.texture = null
		animation.play("RESET")
