extends CharacterBody2D
var damageinstance = 0
var health = 40

func _process(delta):
	if health <= 0:
		dead()
		
		


func dead():
	queue_free()

func hit():
	health -= damageinstance
	print(health)
	print("hit")
