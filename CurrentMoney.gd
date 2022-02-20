extends RichTextLabel

func _process(delta: float) -> void:
	text = "$" + str(GlobalValues.money)
