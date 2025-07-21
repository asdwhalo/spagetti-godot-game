class_name dial_area
extends Area2D

signal In
signal Out

func _on_body_entered(body: Node2D) -> void:
	if body is player :
		In.emit()


func _on_body_exited(body: Node2D) -> void:
	if body is player :
		Out.emit()
