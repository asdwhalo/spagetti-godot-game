class_name enemy extends entity

@export var raycast_manager:Node
@export var spec_attack_module:Node
@export var spec_move_behavior:Node 
@export var attack_area:Area2D
@export var enemy_AI_module:Node


@export var enembasicstate:EnemAIbasic
@export var enembasicHstate:EnemHbasic
@export var enembasicYstate:EnemYbasic = EnemYbasic.HAYATTA
enum EnemYbasic{
	OLU,
	HAYATTA
}
enum EnemHbasic{
	YER,
	HAVA
}
enum EnemAIbasic{
	IDLE,
	VOLTA,
	CHASE,
	ATTACK
}
