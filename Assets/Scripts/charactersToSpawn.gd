extends Node2D

func _ready() -> void:
	if Vars.year == 2:
		if Vars.corporatesKilled == 1:
			$Warriors3.queue_free()
			$Warriors2.queue_free()
		elif Vars.corporatesKilled == 0:
			$Warriors3.queue_free()
			$Warriors2.queue_free()
			$Warriors.queue_free()
	if Vars.year == 3:
		if Vars.totalKillSceneFour < 1000:
			if Vars.totalKillSceneFour == 0:
				$Warriors.queue_free()
				$Warriors2.queue_free()
				$Warriors3.queue_free()
				$Warriors4.queue_free()
				$Warriors5.queue_free()
				$Warriors6.queue_free()
				$Warriors7.queue_free()
			elif Vars.totalKillSceneFour == 1:
				$Warriors2.queue_free()
				$Warriors3.queue_free()
				$Warriors4.queue_free()
				$Warriors5.queue_free()
				$Warriors6.queue_free()
				$Warriors7.queue_free()
			elif Vars.totalKillSceneFour <= 3:
				$Warriors4.queue_free()
				$Warriors5.queue_free()
				$Warriors6.queue_free()
				$Warriors7.queue_free()
			else:
				pass
