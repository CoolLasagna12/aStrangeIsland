extends Node2D
@export var text : String = ""
@export var timeBetweenText : float = 0.2
@export var corporate : bool = false
@export var girl : bool = false

@onready var sprite = $Bubble
var entered : bool = false
var textEntered = ""
var stop = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if stop == false:
		if body.name == "Physics":
			$Bubble/Label.text = ""
			textEntered = ""
			sprite.visible = true
			entered = true
			$Bubble/BubbleTimer.start(timeBetweenText)
			$TalkSound.play()

func _on_area_2d_body_exited(_body: Node2D) -> void:
	if stop == false:
		$Bubble/Label.text = ""
		sprite.visible = false
		entered = false
		textEntered = ""
		$TalkSound.stop()

func _on_bubble_timer_timeout() -> void:
	if stop == false:
		if entered == true:
			if $Bubble/Label.text.length() != text.length():
				$Bubble/Label.text = textEntered + text[$Bubble/Label.text.length()]
				textEntered = $Bubble/Label.text
				$Bubble/BubbleTimer.start(timeBetweenText)

func _on_sprite_animation_finished() -> void:
	queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if stop == false:
		if area.name == "axe":
			$TalkSound.stop()
			stop = true
			$Sprite.play("die")
			sprite.visible = false
			if corporate == true:
				Vars.corporatesKilled += 1
			else:
				Vars.minersKilled += 1
			if girl == true:
				Vars.girlHit += 1
