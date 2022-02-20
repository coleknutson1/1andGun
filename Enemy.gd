extends KinematicBody2D

var target := Vector2(512,300) 

var run_speed = 20
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity = Vector2.ZERO
	velocity = position.direction_to(target) * run_speed
	velocity = move_and_slide(velocity)


func _on_Area2D_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	GlobalValues.money += 1
	area.queue_free()
	queue_free()
