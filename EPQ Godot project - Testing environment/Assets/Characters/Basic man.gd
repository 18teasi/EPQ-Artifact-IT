extends Node2D

signal player_primary_fire(pos, direction)


var weapon = 0
const SPEED = 500

var can_primary_fire = true
var bullet_scene = preload("res://Assets/Projectiles/bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func on_player_primary_fire():
	print ("Fire")
	var bulletspawn = $"Bullet spawn"
	var player_direction = (get_global_mouse_position()- position).normalized()
	player_primary_fire.emit(bulletspawn.global_position, player_direction)
	can_primary_fire = false
	$"Primary fire cooldown".start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#movement code
	var direction = Input.get_vector("MoveLeft","MoveRight","MoveUp","MoveDown")
	position += direction * SPEED * delta

	
	#player facing code
	look_at(get_global_mouse_position())
	
	
	#primary fire input
	if Input.is_action_pressed("PrimaryFire") and can_primary_fire:
		
		on_player_primary_fire()
		can_primary_fire = false
		
		$"Primary fire cooldown".start()
		
	


func _on_primary_fire_cooldown_timeout():
	can_primary_fire = true
