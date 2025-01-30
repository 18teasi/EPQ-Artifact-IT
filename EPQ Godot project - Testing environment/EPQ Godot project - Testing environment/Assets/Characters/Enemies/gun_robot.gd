extends CharacterBody2D
var damageinstance = 0
var health = 100
var can_primary_fire = true
var damage = 15
var inrange = false
var selectedspawn = 0
signal enemy_primary_fire(pos, direction, damage)
signal enemy_death()
@onready var bulletspawn = $"Bullet spawns/Marker2D"

func on_primary_fire():
	var active = get_meta("Active")
	if active == true:
		if inrange:
			bulletspawn = $"Bullet spawns".get_children()[selectedspawn % 2]
			var direction = (Global.playerpos - bulletspawn.global_position).normalized()
			enemy_primary_fire.emit(bulletspawn.global_position, direction, damage)
			can_primary_fire = false
			selectedspawn +=1
			print("fire")
			$"Attack cooldown".start()

	


func _process(_delta):
	look_at(Global.playerpos)
	rotate(PI/2)
	if health <= 0:
		dead()
	if can_primary_fire:
		on_primary_fire()
	
	#movement code
	if not inrange:
		move_and_collide((Global.playerpos - global_position).normalized())
		
		

func dead():
	queue_free()
	enemy_death.emit()

func hit():
	health -= damageinstance


func _on_area_2d_body_entered(body):
	if "Player" in body.get_groups():
		inrange = true


func _on_area_2d_body_exited(body):
	if "Player" in body.get_groups():
		inrange = false


func _on_attack_cooldown_timeout():
	can_primary_fire = true
