extends Area2D

@export var bulletspeed: int = 1000
var direction: Vector2 = Vector2.UP
var damage = 5

func _ready():
	$ExpiryTimer.start()

func _process(delta):
	position += direction * bulletspeed * delta



func _on_body_entered(body):
	queue_free()
	if body.has_method("hit"):
		body.damageinstance = damage
		body.hit()
		



func _on_timer_timeout():
	queue_free()
