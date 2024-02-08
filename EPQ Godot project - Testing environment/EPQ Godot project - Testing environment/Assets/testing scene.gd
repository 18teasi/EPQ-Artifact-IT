extends Node2D
var bullet_scene: PackedScene = preload ("res://Assets/Projectiles/Pistol_Bullet.tscn")

# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_basic_man_player_primary_fire(pos,direction,damage):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = pos
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + 90
	bullet.direction = direction
	bullet.damage = damage
	$Projectiles.add_child(bullet)


func _on_gun_dummy_enemy_primary_fire(pos, direction, damage):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = pos
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + 90
	bullet.direction = direction
	bullet.damage = damage
	$Projectiles.add_child(bullet)
	$UI.update_ammo_counter()


func _on_static_body_2d_body_entered(body):
	pass


func _on_basic_man_player_weapon_change():
	$UI.update_ammo_counter()
