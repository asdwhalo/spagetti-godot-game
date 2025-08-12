class_name dial_area
extends Area2D

signal In
signal Out


@onready var text:Label = get_node("text")


var in_area : bool
func _init() -> void:
	connect("body_entered",_on_body_entered)
	connect("body_exited",_on_body_exited)

func display()->void:
	if text == null:
		return
	
func _on_body_entered(body: Node2D) -> void:
	if body is player :
		in_area = true
		In.emit()


func _on_body_exited(body: Node2D) -> void:
	if body is player :
		in_area = false
		Out.emit()
