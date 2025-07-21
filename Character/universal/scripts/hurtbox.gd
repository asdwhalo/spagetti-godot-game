class_name hurtbox extends Area2D

@onready var Player:player = get_parent()
var Hitbox = hitbox.new()
var Hitbody = hitbody.new()
func _on_body_entered(body: Node2D) -> void:
	if body is hitbody:
		Player.take_damage(Hitbox.hit_value)
		Player

func _on_area_entered(area: Area2D) -> void:
	if area is hitbox:
		Player.take_damage(Hitbox.hit_value)
