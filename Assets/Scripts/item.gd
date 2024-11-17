extends Node2D
var inside : bool = false
@export var item : String

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pickUp"): 
		if inside == true:
			Vars.inventory.append(str(item))
			$DeletingTimer.start(0.01)

func _ready() -> void:
	$Sprite.visible = false

func _on_area_body_entered(body: Node2D) -> void:
	if body.name == "Physics":
		$Sprite.visible = true
		inside = true

func _on_area_body_exited(_body: Node2D) -> void:
	inside = false
	$Sprite.visible = false

func _on_deleting_timer_timeout() -> void:
	$Sprite.modulate.a -= 0.05
	if $Sprite.modulate.a >= 0.0:
		$DeletingTimer.start(0.01)
	else:
		queue_free()
