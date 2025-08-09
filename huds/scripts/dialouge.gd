class_name Dialouge_manager
extends Panel

class dial extends Control :
	pass

signal skip
signal dialouge_ended

@onready var label: RichTextLabel = %dialouge
@export var dialouges : Array[ExtDialouge] 

# TODO  diyalog sistemini daha iyi yap!!!!!
func _init() -> void:
	# connect("dialouge_ended",pr._on_dialougebox_dialouge_ended)
	pass
func dialuoge_system(event:InputEvent)->void:
	for t in dialouges:
		var dials:int = 0
		label.text = t.dial_text
		if Input.is_action_just_pressed("interac"):
			skip.emit()
			dials += 1
	#for t in
		await skip
		continue
		if dials >= dialouges.size():
			break
			dialouge_ended.emit()
func _input(event: InputEvent) -> void:
	dialuoge_system(event)
