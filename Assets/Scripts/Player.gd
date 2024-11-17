extends CharacterBody2D
@export var speed : float = 3750
@onready var sprite = $Sprite

var direction : Vector2 = Vector2.ZERO
var target_velocity : Vector2 = Vector2.ZERO

var axeUsed : bool = false
var wakingUp : bool = true

func _ready() -> void:
	sprite.play("wakeUp")

func _physics_process(delta: float) -> void:
	if Vars.started == true:
		direction = Vector2.ZERO
		if Input.is_action_pressed("ui_left"):
			sprite.flip_h = true
			$axe/axe.position.x = -6.5
			direction.x = -1
		if Input.is_action_pressed("ui_right"):
			sprite.flip_h = false
			$axe/axe.position.x = 6.5
			direction.x = 1
		if Input.is_action_pressed("ui_up"):
			direction.y = -1
		if Input.is_action_pressed("ui_down"):
			direction.y = 1
		target_velocity = direction * 50
		velocity = target_velocity.normalized() * speed * delta
		move_and_slide()
		if direction != Vector2.ZERO and axeUsed == false:
			sprite.play("run")
		elif axeUsed == false:
			sprite.play("idle")
		if Input.is_action_just_pressed("loseTime"):
			$timePassedSound.play()
			Vars.timePassed += 1
			Vars.timeLeft-=(Vars.times[Vars.year]/6)
		if Input.is_action_just_pressed("Axe") and Vars.inventory.has("Axe"):
			Vars.attacksDone += 1
			speed = 2000
			$axe/axe.disabled = false
			axeUsed = true
			sprite.play("Axe")
			$AxeSound.play()


func _on_sprite_animation_finished() -> void:
	if wakingUp == true:
		wakingUp = false
		Vars.started = true
		Vars.timeStart = true
		if Vars.ending == true:
			Vars.timeLeft = 20
		else:
			Vars.timeLeft = Vars.times[Vars.year]
		sprite.play("idle")
	elif axeUsed == true:
		speed = 3750
		axeUsed = false
		$axe/axe.disabled = true
	else:
		Vars.ending = true
		Vars.endingDied = true
		Fade.fade_out(1,Color(0,0,0,1),"Diagonal",false,false)
		await Fade.fade_out().finished
		get_tree().change_scene_to_file(Vars.end)
		Fade.fade_in(1,Color(0,0,0,1),"Diagonal",false,false)


func _on_life_area_entered(area: Area2D) -> void:
	if area.name == "attack":
		sprite.play("die")
		Vars.started = false
