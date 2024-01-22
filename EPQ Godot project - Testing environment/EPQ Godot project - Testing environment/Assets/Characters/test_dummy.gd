extends CharacterBody2D
var damageinstance = 0
var health = 40
var can_primary_fire = true
var damage = 10




func _process(_delta):
	if health <= 0:
		dead()
		
		

func dead():
	queue_free()

func hit():
	health -= damageinstance
	print(health)
	print("hit")



