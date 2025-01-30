extends CanvasLayer

@onready var current_ammo_label: Label = $"Ammo counter/HBoxContainer/Current_Ammo_Label"
@onready var max_ammo_label: Label = $"Ammo counter/HBoxContainer/Max_Ammo_Label"
@onready var health_bar: ProgressBar = $"Health counter/Bar/Health_Bar"
@onready var max_health_label: Label = $"Health counter/Label/HBoxContainer/Max_Health_Label"
@onready var current_health_label: Label = $"Health counter/Label/HBoxContainer/Current_Health_Label"
# Called when the node enters the scene tree for the first time.
func update_ammo_counter():
	if Global.currentammo[Global.weapon] > -1:
		current_ammo_label.text = str(Global.currentammo[Global.weapon])
	else:
		current_ammo_label.text = "INF"
	max_ammo_label.text = str(Global.maxammo[Global.weapon])
func update_health_bar():
	health_bar.value = Global.playerhealth
	max_health_label.text = str(Global.playermaxhealth)
	current_health_label.text = str(Global.playerhealth)
	

func _process(delta):
	update_ammo_counter()
	update_health_bar()
