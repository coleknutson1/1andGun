extends ItemList


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	

func _on_UpgradeList_item_selected(index: int) -> void:
	unselect_all()	
	if get_item_text(index) == "Increase Turret Speed":
		GlobalValues.fireTimer -= .01

