extends Node2D

func _on_player_time_finished() -> void:
	Fade.fade_out(1,Color(0,0,0,1),"Diagonal",false,false)
	print(Vars.minersKilled)
	print(Vars.corporatesKilled)
	print(Vars.warriorsKilled)
	await Fade.fade_out().finished
	if Vars.year == 1:
		get_tree().change_scene_to_file(Vars.sceneTwo)
	elif Vars.year == 2:
		get_tree().change_scene_to_file(Vars.sceneThree)
	elif Vars.year == 3:
		if Vars.corporatesKilled != 4:
			Vars.totalKillSceneFour = (Vars.corporatesKilled + Vars.minersKilled + Vars.warriorsKilled)
			get_tree().change_scene_to_file(Vars.sceneFourNEK)
		else:
			Vars.totalKillSceneFour = 1000
			get_tree().change_scene_to_file(Vars.sceneFourEK)
	elif Vars.year == 4:
		Vars.ending = true
		if Vars.totalKillSceneFour == 0 and Vars.corporatesKilled == 3:
			get_tree().change_scene_to_file(Vars.goodEnding)
		elif (Vars.corporatesKilled + Vars.minersKilled + Vars.warriorsKilled) < 4 or Vars.corporatesKilled < 2:
			get_tree().change_scene_to_file(Vars.badEnding)
		else:
			get_tree().change_scene_to_file(Vars.goodEnding)
	elif Vars.ending == true:
		get_tree().change_scene_to_file("res://Assets/Scènes/Worlds/finish.tscn")
	Fade.fade_in(1,Color(0,0,0,1),"Diagonal",false,false)
	Vars.started = false
	Vars.timeLeft = 60
	Vars.phase = 0
