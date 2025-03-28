extends Node2D
var bullet_scene: PackedScene = preload ("res://Assets/Projectiles/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_basic_man_player_primary_fire(pos, direction):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = pos
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + 90
	bullet.direction = direction
	$Projectiles.add_child(bullet)
