class_name hurtbox extends Area2D

@onready var pr:entity= get_parent()

var Hitbox = hitbox.new()
var Hitbody = hitbody.new()
func  _init()->void:
	connect("area_entered",on_area_entered)
func on_area_entered(area:Area2D)->void:
	if area is hitbox:
		pr.take_damage(area.damage)
