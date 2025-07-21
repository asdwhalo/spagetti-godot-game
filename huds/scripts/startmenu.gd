extends Control

@onready var text_label: RichTextLabel = $RichTextLabel
#TODO diyalog sistemi ekle

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/scenes/placeholderlevel1.tscn")
	

func _on_optinos_pressed() -> void:
	pass 


func _on_exit_pressed() -> void:
	get_tree().quit()
