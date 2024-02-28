extends CharacterBody2D

signal player_primary_fire(pos, direction, damage)
signal player_weapon_change()

const damagevalues = [0,5, 2]
const firerate = [0,0.25,0.03]




var damage = 0
var textures = [preload("res://Assets/PNGs/Game Weapon Pistol.png"), 
preload("res://Assets/PNGs/Overheat MG placeholder.png")]
var weapon = 0
const SPEED = 500
var health = 100
var selectedspawn = 0
var can_primary_fire = true
var bullet_scene = preload("res://Assets/Projectiles/Pistol_Bullet.tscn")
var damageinstance = 0


func on_player_primary_fire():
	var bulletspawn = $"Pistol Bullet spawn"
	if weapon == 1:
		bulletspawn = $"Pistol Bullet spawn"
	if weapon == 2:
		bulletspawn = $"MG Bullet spawns".get_children()[selectedspawn % 2]
		selectedspawn += 1
	Global.currentammo[weapon] -=1
	print(Global.currentammo[weapon])
		
		
	var player_direction = (get_global_mouse_position()- position).normalized()
	player_primary_fire.emit(bulletspawn.global_position, player_direction, damage)
	can_primary_fire = false
	$"Primary fire cooldown".start()

func hit():
	Global.playerhealth -= damageinstance
	print(Global.playerhealth)
	if Global.playerhealth <= 0:
		dead()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#movement code
	var direction = Input.get_vector("MoveLeft","MoveRight","MoveUp","MoveDown")
	velocity = direction * 500
	move_and_slide()
	damage = damagevalues[weapon]
	
	

	
	#player facing code
	look_at(get_global_mouse_position())
	
	
	#primary fire input
	if Input.is_action_pressed("PrimaryFire") and can_primary_fire and Global.currentammo[weapon] != 0 or Input.is_action_pressed("PrimaryFire") and can_primary_fire and weapon == 1:
		if weapon > 0:
			
			on_player_primary_fire()
		
		#code to handle weapon swapping
	
	#weapon switch code
	if Input.is_action_just_pressed("Weapon 0"):
		weapon = 0
		Global.weapon = 0
		$GameWeaponSprite.texture = null
		player_weapon_change.emit()
		
	if Input.is_action_just_pressed("weapon 1"):
		weapon = 1
		$"Primary fire cooldown".wait_time = firerate[weapon]
		Global.weapon = 1
		$GameWeaponSprite.texture = textures[weapon-1]
		player_weapon_change.emit()
		
	if Input.is_action_just_pressed("Weapon 2"):
		weapon = 2
		$"Primary fire cooldown".wait_time = firerate[weapon]
		Global.weapon = 2
		$GameWeaponSprite.texture = textures[weapon-1]
		player_weapon_change.emit()
		
	


func _on_primary_fire_cooldown_timeout():
	can_primary_fire = true


func dead():
	print("dead")
	pass
