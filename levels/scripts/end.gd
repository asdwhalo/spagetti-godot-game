extends Area2D

signal player_entered
var Player = player.new()
# TODO çalışan seviye sistemi yaz
func _on_body_entered(body: Node2D) -> void:
	if body is player and Player.PlayerYstates == Player.Ystates.HAYATTA:
		player_entered.emit()
	
