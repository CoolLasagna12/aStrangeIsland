extends Node2D
signal finished

func _ready() -> void:
	$yearText.text = str("Year ", Vars.allYears[Vars.year])

func _on_sprite_animation_finished() -> void:
	$yearText/yearTextTimer.start(0.05)
	$TimeLeft/TimeLeftTimer.start(1)

func _on_year_text_timer_timeout() -> void:
	$yearText.label_settings.font_color -= Color(0,0,0,0.05)
	if $yearText.label_settings.font_color.a >= 0.0:
		$yearText/yearTextTimer.start(0.05)

func _on_time_left_timer_timeout() -> void:
	Vars.timeLeft -= 1
	if Vars.timeLeft < (Vars.times[Vars.year] * (1.0/6.0)) and Vars.phase == 4:
		$TimeLeft/Bubble2.queue_free()
		$TimeLeft/Bubble1.play("red")
		Vars.phase += 1
	elif Vars.timeLeft < (Vars.times[Vars.year] * (1.0/3.0)) and Vars.phase == 3:
		$TimeLeft/Bubble3.queue_free()
		$TimeLeft/Bubble2.play("red")
		Vars.phase += 1
	elif Vars.timeLeft < (Vars.times[Vars.year] * (1.0/2.0)) and Vars.phase == 2:
		$TimeLeft/Bubble4.queue_free()
		$TimeLeft/Bubble3.play("red")
		Vars.phase += 1
	elif Vars.timeLeft < (Vars.times[Vars.year] * (2.0/3.0)) and Vars.phase == 1:
		$TimeLeft/Bubble5.queue_free()
		$TimeLeft/Bubble4.play("red")
		Vars.phase += 1
	elif Vars.timeLeft < (float(Vars.times[Vars.year] * (5.0/6.0))) and Vars.phase == 0:
		$TimeLeft/Bubble5.play("red")
		$TimeLeft/Bubble6.queue_free()
		Vars.phase += 1
	if Vars.timeLeft > 0:
		$TimeLeft/TimeLeftTimer.start(1)
	else:
		Vars.year += 1
		emit_signal("finished")
		$yearText.label_settings.font_color.a = 1
		$yearText.text = ""
