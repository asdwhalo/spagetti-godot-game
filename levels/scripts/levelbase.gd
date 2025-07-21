extends Node2D
@onready var Player = get_node("Player")
@onready var enter: Node2D = $enter

@export var next_level_path:String
func _on_end_player_entered() -> void:
	get_tree().change_scene_to_file(next_level_path)
func _ready() -> void:
	Player.global_position = enter.global_position
	if OS.has_feature("javascript"):
		print("webde oynuyorsun")
	elif OS.has_feature("pc"):
		print("pcisin")
	
func _physics_process(delta: float) -> void:
	pass
