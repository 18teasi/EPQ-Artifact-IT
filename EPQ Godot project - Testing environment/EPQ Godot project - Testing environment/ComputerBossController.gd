extends Node2D
var phase = 0

signal nextphase()
signal bossendcutscene()
# Called when the node enters the scene tree for the first time.
func _ready():
		for spawner in get_tree().get_nodes_in_group("Spawner"):
			spawner.connect("spawned", powernode_spawn)


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_boss_fight_trigger_bossfightstart():
	$Monitor_sprite.play("Wakeup")
	


func _on_power_node_powernodedead():
	emit_signal("bossendcutscene")
	$Monitor_sprite.play("Boss death")
	

func endboss():
	pass

func powernode_spawn(object):
	if object in get_tree().get_nodes_in_group("Powernode"):
		object.connect("powernodedead", _on_power_node_powernodedead)
	print("Powernode spawned")
