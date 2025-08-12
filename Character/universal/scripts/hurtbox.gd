class_name hurtbox extends Area2D

@onready var pr:entity= get_parent()
@onready var dur_time : Timer

func  _init()->void:
	connect("area_entered",on_area_entered)
func on_area_entered(area:Area2D)->void:
	if area is hitbox:
		pr.take_damage(area.damage)

