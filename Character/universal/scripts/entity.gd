class_name entity extends CharacterBody2D
var can_move:bool = true

signal dead

@export var max_health:float
@export var curr_health:float:
    set = take_damage,
    get = get_health
@export var hurtbox_component:Area2D
@export var fizikbox:CollisionShape2D
func _init() -> void:
    curr_health = max_health
func take_damage(amount:float)->void:
    curr_health -= amount
    if curr_health <=  0.0:
        dead.emit()
func get_health()->float:
    return curr_health
		
