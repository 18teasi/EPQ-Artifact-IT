extends Node2D

signal player_primary_fire(pos, direction, damage)

const damagevalues = [0,5]
var damage = 0
var pistoltexture = preload("res://Assets/PNGs/Game Weapon Pistol.png")
var weapon = 0
const SPEED = 500
var health = 100

var can_primary_fire = true
var bullet_scene = preload("res://Assets/Projectiles/Pistol_Bullet.tscn")
# Called when the node enters the scene tree for the first time.


func on_player_primary_fire():
	var bulletspawn = $"Bullet spawn"
	var player_direction = (get_global_mouse_position()- position).normalized()
	player_primary_fire.emit(bulletspawn.global_position, player_direction, damage)
	can_primary_fire = false
	$"Primary fire cooldown".start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#movement code
	var direction = Input.get_vector("MoveLeft","MoveRight","MoveUp","MoveDown")
	position += direction * SPEED * delta
	damage = damagevalues[weapon]
	
	

	
	#player facing code
	look_at(get_global_mouse_position())
	
	
	#primary fire input
	if Input.is_action_pressed("PrimaryFire") and can_primary_fire:
		if weapon > 0:
		
			on_player_primary_fire()
		
		#code to handle weapon swapping
	if Input.is_action_just_pressed("Weapon 0"):
		weapon = 0
		$GameWeaponSprite.texture = null
		
	if Input.is_action_just_pressed("weapon 1"):
		$"Primary fire cooldown".wait_time
		weapon = 1
		$GameWeaponSprite.texture = pistoltexture
		
		
	


func _on_primary_fire_cooldown_timeout():
	can_primary_fire = true
