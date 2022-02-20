extends Area2D

var bulletScene = load("res://Bullet.tscn")
var enemy_to_fire_at
func _ready() -> void:
	$FireTimer.start(GlobalValues.fireTimer)


func _on_FireTimer_timeout() -> void:
	enemy_to_fire_at = get_closest_enemy()
	fire()
	if GlobalValues.doubleFireEnabled:
		$DoubleFireTimer.start()
	$FireTimer.start(GlobalValues.fireTimer)
	
func _on_DoubleFireTimer_timeout() -> void:
	fire()
	$DoubleFireTimer.stop()

func get_closest_enemy():
	var closest_enemy = null
	var enemies = get_tree().get_nodes_in_group("Enemy")
	var closest_enemy_distance : float
	for enemy in enemies:
		var distance2Hero = enemy.position.distance_to(position);
		if closest_enemy == null:
			closest_enemy_distance = distance2Hero
			closest_enemy = enemy
		elif distance2Hero < closest_enemy_distance:
			closest_enemy_distance = distance2Hero
			closest_enemy = enemy
	return closest_enemy
			
		
		
func fire():
	if enemy_to_fire_at == null:
		return
	look_at(enemy_to_fire_at.position)
	var instance = bulletScene.instance()
	get_tree().root.get_node("Root").add_child(instance)
	instance.global_position = global_position
	var target = enemy_to_fire_at.position
	var direction_to_target = instance.global_position.direction_to(target).normalized()
	instance.set_direction(direction_to_target)



