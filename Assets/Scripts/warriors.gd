extends Node2D
@export var target : Node2D
@onready var navAgent = $PhysicsWarrior/NavigationAgent2D
@onready var sprite = $PhysicsWarrior/Sprite
const speed = 32
var dead = false

func _process(delta: float) -> void:
	if dead == false:
		navAgent.target_position = target.pos

func _physics_process(delta: float) -> void:
	if dead == false:
		if navAgent.is_navigation_finished():
			return
		var current_agent_position: Vector2 = $PhysicsWarrior.global_position
		var next_path_position: Vector2 = navAgent.get_next_path_position()
		$PhysicsWarrior.velocity = current_agent_position.direction_to(next_path_position) * speed
		$PhysicsWarrior.move_and_slide()
		if target.pos.x < $PhysicsWarrior.global_position.x:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		if target.pos.distance_to($PhysicsWarrior.global_position) <= 8:
			sprite.play("attack")
			$PhysicsWarrior/attack/attack.disabled = false

func _on_life_area_entered(area: Area2D) -> void:
	if area.name == "axe":
		$PhysicsWarrior/Sprite.play("die")
		dead = true


func _on_sprite_animation_finished() -> void:
	if dead == false:
		$PhysicsWarrior/attack/attack.disabled = true
		sprite.play("run")
	else:
		Vars.warriorsKilled += 1 
		queue_free()
		
