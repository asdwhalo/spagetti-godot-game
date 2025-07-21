class_name enemraycast extends RayCast2D

@onready var manager : Node = get_parent()

signal igotyou

func tagreted()->void:
	if is_colliding():
		var collider = get_collider()
		if collider is player:
			igotyou.emit()
func _ready() -> void:
	collide_with_areas = false
	collide_with_bodies = true
	igotyou.connect(manager.find())
