extends Node2D

const SPEED = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#movement code
	var direction = Input.get_vector("MoveLeft","MoveRight","MoveUp","MoveDown")
	position += direction * SPEED * delta
	
	#player facing code
	look_at(get_global_mouse_position())
	
	
	#primary fire input
	if Input.is_action_just_pressed("PrimaryFire"):
		print("fire")
