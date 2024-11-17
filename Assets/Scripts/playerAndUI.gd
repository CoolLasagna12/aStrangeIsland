extends Node2D
signal timeFinished

@export var pos : Vector2

func _on_ui_finished() -> void:
	emit_signal("timeFinished")

func _process(float) -> void:
	pos = $Physics.global_position
