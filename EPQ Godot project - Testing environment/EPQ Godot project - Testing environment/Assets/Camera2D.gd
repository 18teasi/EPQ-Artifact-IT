extends Camera2D
var gameplayactive = true
signal bossfight_phase1()
signal enddooropen()
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
	emit_signal("bossfight_phase1")


func _on_computer_boss_controller_bossendcutscene():
	gameplayactive = false
	global_position = $"../ComputerBossController".global_position
	$Bossendcutscenetimer.start()
	


func _on_bossendcutscenetimer_timeout():
	gameplayactive = true
	emit_signal("enddooropen")
