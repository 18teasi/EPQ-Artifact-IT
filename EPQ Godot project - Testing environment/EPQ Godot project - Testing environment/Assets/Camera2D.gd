extends Camera2D
var gameplayactive = true

# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameplayactive:
		global_position = $"../BasicMan".global_position



func _on_boss_fight_trigger_bossfightstart():
	gameplayactive = false
	global_position = $"../ComputerBossController".global_position
	$Bosscutscenetimer.start()
	



func _on_bosscutscenetimer_timeout():
	gameplayactive = true
