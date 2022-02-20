extends RichTextLabel


func _process(delta: float) -> void:
	text = "Enemy generated every " + str(GlobalValues.enemyGeneratedEveryXSecondsTimer) + " seconds"
