extends Node2D


func _on_timer_timeout() -> void:
	Fade.fade_out(1,Color(0,0,0,1),"Diagonal",false,false)
	await Fade.fade_out().finished
	get_tree().change_scene_to_file("res://Assets/Scènes/Worlds/Year0.tscn")
	Fade.fade_in(1,Color(0,0,0,1),"Diagonal",false,false)
