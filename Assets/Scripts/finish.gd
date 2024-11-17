extends Node2D
var text = ""
var textEntered = ""
var timeBetweenText : float = 0.2
var totalKills = (Vars.corporatesKilled + Vars.minersKilled + Vars.warriorsKilled)

func _ready() -> void:
	if Vars.endingDied == true:
		text = "You died, and your island succumbed too."
	elif Vars.attacksDone >= 30 and totalKills == 0:
		text = "Hey, why did you hit the grass more than 30 times? That's useless..."
	elif totalKills == 0:
		text = "Congrats, your island has been destroyed, and now you have nowhere to sleep!"
	elif Vars.warriorsKilled >= 25:
		text = "Wow, you killed a lot of warriors!"
	elif totalKills > 20:
		text = "Congrats, you made a genocide! But your island stayed! This isn't a shoot'em'up."
	elif Vars.totalKillSceneFour == 0 and Vars.corporatesKilled == 3 and totalKills == 3:
		text = "Congrats, you've succeeded in your mission, and protected the island without killing too many innocent people."
	elif Vars.corporatesKilled == 0 and Vars.minersKilled > 0:
		text = "Congrats, you only killed innocents! You must be proud of you!"
	elif Vars.corporatesKilled >= 4 and totalKills == Vars.CorporatesKilled:
		text = "Congrats, you could have done better, but, nice job!"
	elif Vars.corporatesKilled > 0 and Vars.minersKilled == 0 and Vars.warriorsKilled == 0:
		text = "Hey, you only killed guys with suits!"
	elif Vars.totalKillSceneFour == 0 and totalKills == 15: 
		text = "Well, I don't really know what to say. What a turnaround, I didn't thought you could kill this amount of people in such a short time..."
	elif Vars.girlHit == totalKills:
		text = "So you only killed girls... You're strange bro"
	elif Vars.girlHit == 0 and totalKills >= 3 and Vars.corporatesKilled >= 2:
		text = "Okay, so you just killed everyone but girls? Are you gallant or something like that?"
	elif Vars.minersKilled > (Vars.corporatesKilled + Vars.warriorsKilled):
		text = "Congrats, you killed a lot of innocent people!"
	elif Vars.inventory.count("Wood") >= 10:
		text = "Nothing to say other than you like wood."
	elif Vars.inventory.count("Axe") >= 3:
		text = "Hey, why did you pick up this amount of axe???"
	elif Vars.totalKillSceneFour == 0 and totalKills == 1:
		text = "I thought you were better than that"
	elif totalKills == 1:
		text = "You just missclicked and killed someone bro?"
	elif Vars.timePassed >= 20:
		text = "Do I have to understand that you hate playing this game? You passed time more than 20 times!!"
	else:
		text = "So you just killed the people you saw..."
	$Timer.start(0.2)

func _on_timer_timeout() -> void:
	if $Label.text.length() != text.length():
		$Label.text = textEntered + text[$Label.text.length()]
		textEntered = $Label.text
		$Timer.start(timeBetweenText)
	else:
		$Timer2.start(15)


func _on_timer_2_timeout() -> void:
	get_tree().change_scene_to_file("res://Assets/Scènes/Worlds/credits.tscn")
