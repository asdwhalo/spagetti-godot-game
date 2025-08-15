class_name DialougeBox
extends Panel



signal skip
signal dialouge_ended
var dials = 0
@onready var label: RichTextLabel = %dialouge
@export var dialouges : ExtDialouge #FIXME bunu dialog kaynağından almalıyız
var dial :ExtDialouge = self.owner.get_dials()
# TODO  diyalog sistemini daha iyi yap!!!!!
func _init() -> void:
	# connect("dialouge_ended",pr._on_dialougebox_dialouge_ended)
	pass
func dialuoge_system()->void:
	for t in dialouges.dial_array:
		var ran = randi() % t.size()
		label.text = t.dial_text
		if Input.is_action_just_pressed("interac"):
			skip.emit()
			dials += 1
	#for t in
		await skip
		continue
		if dials >= ran:
			dialouge_ended.emit()
func built_in_dialouge_sys():
	for t in dial.dial_array:
		if t == null:
			print("managerden dialogları alamıyoruz D:<")
		var ran = randi() % t.size()
		label.text = t.dial_text
		if Input.is_action_just_pressed("interac"):
			skip.emit()
			dials += 1
	#for t in
		await skip
		continue
		if dials >= ran:
			dialouge_ended.emit()
func _input(event: InputEvent) -> void:
	dialuoge_system()
