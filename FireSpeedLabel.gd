extends RichTextLabel


func _process(delta: float) -> void:
	text = "Firing Speed: " + str(GlobalValues.fireTimer)
