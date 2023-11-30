extends Area2D
var bulletspeed = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		


func _on_child_entered_tree(node):
	look_at(get_global_mouse_position())
	position += get_global_mouse_position() + bulletspeed
