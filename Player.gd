extends Area2D

var bulletScene = load("res://Bullet.tscn")

func _ready() -> void:
	$FireTimer.start(GlobalValues.fireTimer)
	
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())


func _on_FireTimer_timeout() -> void:
	fire()
	$FireTimer.start(GlobalValues.fireTimer)
	
func fire():
	var instance = bulletScene.instance()
	get_tree().root.get_node("Root").add_child(instance)
	instance.global_position = global_position
	var target = get_global_mouse_position()
	var direction_to_mouse = instance.global_position.direction_to(target).normalized()
	instance.set_direction(direction_to_mouse)
