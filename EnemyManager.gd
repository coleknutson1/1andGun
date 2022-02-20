extends Node

var rng = RandomNumberGenerator.new()
var enemyScene = load("res://Enemy.tscn")

func _ready():
	generate_enemy()
	$EnemyGenerationTimer.start(GlobalValues.enemyGeneratedEveryXSecondsTimer)
	
func generateRandomNumberGivenRange(start:float,end:float):
	rng.randomize()
	return ceil(rng.randf_range(start, end))
	
func _on_EnemyGenerationTimer_timeout() -> void:
	$EnemyGenerationTimer.stop()	
	generate_enemy()
	$EnemyGenerationTimer.start(GlobalValues.enemyGeneratedEveryXSecondsTimer)
	
func generate_enemy():
	var enemyVector2 := get_new_enemy_coordinates()
	spawn_enemy(enemyVector2)

func get_new_enemy_coordinates() -> Vector2:
	var newEnemyVector2 := Vector2(generateRandomNumberGivenRange(0,1024),generateRandomNumberGivenRange(0,600) )
	
	#Where do we push enemy off screen for them to creep in?
	var snapToXOrY = generateRandomNumberGivenRange(0,2)
	
	#If we put them to left or right
	if snapToXOrY == 1:
		var leftOrRight = generateRandomNumberGivenRange(0,2)
		if leftOrRight == 1:
			newEnemyVector2.x = -20
		else:
			newEnemyVector2.x = 1044
	
	#If we put them to up or down
	else:
		var upOrDown = generateRandomNumberGivenRange(0,2)
		if upOrDown == 1:
			newEnemyVector2.y = -20
		else:
			newEnemyVector2.y = 620
	return newEnemyVector2

func spawn_enemy(coordinates:Vector2) -> void:
	var instance = enemyScene.instance()
	get_tree().root.get_node("Root").add_child(instance)
	instance.global_position = coordinates


func _IncreaseEnemyGenSpeedTimer() -> void:
	GlobalValues.enemyGeneratedEveryXSecondsTimer -= .1
