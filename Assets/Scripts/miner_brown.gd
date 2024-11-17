extends Node2D
@export var flip : bool = false

func _ready() -> void:
	if flip == true:
		$Characters/Sprite.flip_h = true
