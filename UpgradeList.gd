extends ItemList

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_item_text(0,"Increase Turret Speed $" + str(GlobalValues.costOfFireTimeUpgrade))

func _process(delta: float) -> void:
	set_item_disabled(0,false)
	set_item_disabled(1,false)
	if GlobalValues.costOfFireTimeUpgrade > GlobalValues.money:
		set_item_disabled(0,true)
	if GlobalValues.costOfDoubleFireUpgrade > GlobalValues.money:
		set_item_disabled(1,true)

func _on_UpgradeList_item_selected(index: int) -> void:
	if is_item_disabled(index):
		return
	
	unselect_all()
	if get_item_text(index).begins_with("Increase Turret Speed"):
		GlobalValues.fireTimer -= .1
		GlobalValues.money -= GlobalValues.costOfFireTimeUpgrade
		GlobalValues.costOfFireTimeUpgrade += 2
		set_item_text(0,"Increase Turret Speed $" + str(GlobalValues.costOfFireTimeUpgrade))
	if get_item_text(index).begins_with("Double Fire"):
		GlobalValues.money -= GlobalValues.costOfDoubleFireUpgrade
		GlobalValues.doubleFireEnabled = true
		remove_item(1)
