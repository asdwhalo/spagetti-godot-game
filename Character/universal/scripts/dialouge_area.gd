class_name DialougeArea
extends Area2D

signal In
signal Out
signal started

@onready var text:Label = get_node("text")


var in_area : bool
func _init() -> void:
	connect("body_entered",_on_body_entered)
	connect("body_exited",_on_body_exited)
	connect("In",_In)
	connect("started",get_parent().get_node("dial_man").started)

func display()->void:
	if text == null:
		return
	
func _on_body_entered(body: Node2D) -> void:
	if body is player :
		in_area = true
		In.emit()
func _In():
	if in_area and Input.is_action_just_pressed("interac"):
		started.emit()

func _on_body_exited(body: Node2D) -> void:
	if body is player :
		in_area = false
		Out.emit()
