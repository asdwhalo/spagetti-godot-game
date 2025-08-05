class_name player extends entity

#TODO movementi düzelt hiç sulu değil!

var par2:AtlasTexture = preload("res://Character/mainCharacter/assets/particelidle.tres")
@export var gun:Node2D
@export var PlayerHstates:Mstates
@export var PlayerYstates:Ystates = Ystates.HAYATTA
@onready var particles: CPUParticles2D = $CPUParticles2D

@onready var dial: Dialouge_manager = %dialougebox
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var movemodule: Node = $movemodule

signal killed

func change_liv_state(state:Ystates):
	PlayerYstates  = state
func change_mov_state(state:Mstates):
	PlayerHstates = state
enum Mstates{
	YER,
	HAVA,
	DASH,
	INTERAC,
	DIALOG
}
enum Ystates{
	OLU,
	HAYATTA
}
func Mstatemanager()->void:
	if is_on_floor():
		change_mov_state(Mstates.YER)
	elif not is_on_floor():
		change_mov_state(Mstates.HAVA)
func dialouge_control()->void:
	if PlayerHstates == Mstates.DIALOG:
		can_move = false

func _ready() -> void:
	curr_health = max_health
	#movemodule.velocity = self.velocity
func anim_control()->void:
	if can_move and  velocity.abs().x >= 0 :
		particles.emitting = true
	else:
		particles.emitting = false
	var curr_frame = anim.get
	if velocity.x < 0 :
		anim.flip_h = true
	elif velocity.x > 0:
		anim.flip_h = false
	match PlayerHstates:
		Mstates.YER:
			if velocity == Vector2.ZERO:
				anim.play("idle")
				particles.texture = par2
				
			elif velocity.x != 0:
				anim.play("run")
				
		Mstates.HAVA:
			anim.play("jump")

func _physics_process(_delta: float) -> void:
	if can_move == true:
		move_and_slide()
	Mstatemanager()
	anim_control()
	dialouge_control()


func _on_dialougebox_dialouge_ended() -> void:
	can_move = true
