class_name Dialouge_manager
extends Panel

class dial extends Control :
	pass

signal skip
signal dialouge_ended

@onready var label: Label = $dialouge
@export var dialouges : Array[dialouge] 

#TODO  diyalog sistemi yap!!!!!

func dialuoge_system(event:InputEvent)->void:
	for t in dialouges:
		var dials:int = 0
		label.text = t.dial_text
		if Input.is_action_just_pressed("interac"):
			skip.emit()
			dials += 1
		
		await skip
		continue
		if dials >= dialouges.size():
			break
			dialouge_ended.emit()
func _input(event: InputEvent) -> void:
	dialuoge_system(event)
