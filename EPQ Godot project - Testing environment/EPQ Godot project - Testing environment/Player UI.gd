extends CanvasLayer

@onready var current_ammo_label: Label = $"Ammo counter/HBoxContainer/Current_Ammo_Label"
@onready var max_ammo_label: Label = $"Ammo counter/HBoxContainer/Max_Ammo_Label"
# Called when the node enters the scene tree for the first time.
func update_ammo_counter():
	if Global.currentammo[Global.weapon] > -1:
		current_ammo_label.text = str(Global.currentammo[Global.weapon])
	max_ammo_label.text = str(Global.maxammo[Global.weapon])

func _process(delta):
	update_ammo_counter()
