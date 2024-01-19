extends Area2D

@export var bulletspeed: int = 1000
var direction: Vector2 = Vector2.UP
const damage = 5

func _ready():
	$ExpiryTimer.start()

func _process(delta):
	position += direction * bulletspeed * delta



func _on_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		body.damageinstance = damage
	queue_free()


func _on_timer_timeout():
	queue_free()
