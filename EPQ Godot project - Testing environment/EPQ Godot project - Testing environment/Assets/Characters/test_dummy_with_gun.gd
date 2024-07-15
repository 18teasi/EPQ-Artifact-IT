extends CharacterBody2D
var damageinstance = 0
var health = 40
var can_primary_fire = true
var damage = 10

signal enemy_primary_fire(pos, direction, damage)


func on_primary_fire():
	var bulletspawn = $"Attack spawn"
	var direction = (Global.playerpos - position).normalized()
	enemy_primary_fire.emit(bulletspawn.global_position, direction, damage)
	can_primary_fire = false
	$"Attack cooldown".start()



func _process(_delta):
	look_at(Global.playerpos)
	if health <= 0:
		dead()
	if can_primary_fire:
		on_primary_fire()
		
		

func dead():
	queue_free()

func hit():
	health -= damageinstance








func _on_attack_cooldown_timeout():
	can_primary_fire = true
