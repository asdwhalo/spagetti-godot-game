class_name raycastman extends Node
@onready var Enemroot : enemy = get_parent()
func find()->void:
	Enemroot.enembasicstate = Enemroot.EnemAIbasic.CHASE
