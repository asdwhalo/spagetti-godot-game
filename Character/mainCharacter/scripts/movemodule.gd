extends Node
#TODO daha iyi bir hareket sistemi yaz!
#FIXME
@onready var Player:player = get_parent()
@onready var dashcool: Timer = $dashcooldown
@onready var dashtime: Timer = $dashtimer
@onready var rayr: RayCast2D = %RayCast2D
@onready var ray2: RayCast2D = %RayCast2D2
@onready var anim: AnimatedSprite2D = %AnimatedSprite2D

@export_group("basic")
@export var is_basic:bool = false
@export var basic_speed:int 
@export var basic_jump:int
@export var basic_gravity:float = 9.8
var parent = Player
func _ready() -> void:
	pass
@onready var jump_heigth = calculater(jump,jump_time_to_peak)
@onready var up_grav = gravity_calculater(jump,jump_time_to_peak)
@onready var dis_speed = cal_jump_dis(100,jump_time_to_peak,jump_destence)

@export_group("expremental")
@export var jump:float = 40.0
@export var speed:float = 400
@export var gravitiy:float  = 9.8
@export var jump_time_to_peak := 0.4
@export var jump_destence :float = 0.25 

@export_group("Extras")
@export var is_expremental:bool = false


func _physics_process(delta: float) -> void:
	if  is_basic == true:
		basic_movement()
	elif is_expremental == true:
		extra_movement()
	else:
		anim.self_modulate = Color.CRIMSON
		if Player.PlayerHstates == Player.Mstates.DASH:
			var dashspeed = speed*2
			Player.velocity.abs().x = dashspeed
		
		var cols = ray2.get_collider() and rayr.get_collider()
		var colled:bool = rayr.is_colliding() and ray2.is_colliding()
		var dirx = Input.get_axis("a","d")
		Player.velocity.x = dirx * speed 
		if Input.is_action_just_pressed("space")and Player.is_on_floor():
			Player.velocity.y += jump_heigth 
			Player.velocity.x = dirx/1.5 *dis_speed
		if Input.is_action_just_pressed("space")and Player.is_on_wall():
			Player.velocity.y += jump_heigth / 2
			Player.velocity.x = sign(dirx) * dis_speed / -2
			print("coll")
		if not Player.is_on_floor():
			Player.velocity.y += gravitiy *delta
		if Input.is_action_just_pressed("shift"):
			dash()

func calculater(height:float,to_peak:float)->float:
	return (height * -2) / to_peak
func gravity_calculater(height:float,to_peak:float)->float:
	return (2 * height) / pow(to_peak,2.0)
func dash():
	Player.PlayerHstates = Player.Mstates.DASH
	pass
func cal_jump_dis(distance:float,to_peak:float,to_desenc:float)->float:
	return distance / (to_desenc+to_peak)
func basic_movement()->void:
	
	var dir := Input.get_axis("a","d")
	Player.velocity.x = dir * basic_speed
	if Input.is_action_just_pressed("space") and Player.PlayerHstates == Player.Mstates.YER:
		Player.velocity.y -= basic_jump
	if  not Player.PlayerHstates == Player.Mstates.YER:
		var max_basic_gravity = 2 * basic_gravity
		if not basic_gravity > max_basic_gravity:
			Player.velocity.y += basic_gravity
		else:
			basic_gravity = 40.0
func extra_movement()->void: 
	#FIXME zıplama yok
	var xdir:Vector2 = Vector2.ZERO
	
	if Input.is_action_just_pressed("space") and Player.PlayerHstates == Player.Mstates.YER:
		xdir.y = -2
		Player.velocity.y = xdir.y
	if  not Player.PlayerHstates == Player.Mstates.YER:
		xdir.y = 1
		var max_basic_gravity = 2 * basic_gravity
		if not basic_gravity > max_basic_gravity:
			Player.velocity.y += basic_gravity
		else:
			basic_gravity = 20.0
	else:
		xdir.y = 0
	if Input.is_action_pressed("a") and Player.PlayerHstates == Player.Mstates.YER:
		xdir = Vector2(-1,0)
	if Input.is_action_pressed("d") and Player.PlayerHstates == Player.Mstates.YER:
		xdir = Vector2(1,0)
	Player.velocity.x = xdir.x * basic_speed