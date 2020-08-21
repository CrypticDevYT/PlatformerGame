extends KinematicBody2D
var speed = 260
var grav = 4000
var jump_speed= -1200
var is_dead = false
var velocity = Vector2.ZERO
var lvl = 0
var coin = 0
var life = 3
var jump_amount = 0
onready var scoretxt = get_node("Camera2D/CanvasLayer/coin")
onready var lifetxt = get_node("Camera2D/CanvasLayer/RichTextLabel")


func get_input():
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene("res://scene/pause.tscn")
		
	velocity.x = 0
	if Input.is_key_pressed(KEY_D):
		velocity.x += speed

	if Input.is_key_pressed(KEY_A):
		velocity.x -= speed
	
	if Input.is_action_just_pressed("shoot"):
		pass

	
func _physics_process(delta):
	get_global_mouse_position()
	get_input()
	#gravity
	velocity.y += grav * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	#jumping
	if Input.is_action_just_pressed("Jump"):
		jump_amount += 1
		if !is_on_floor() && jump_amount < 2:
			velocity.y = jump_speed
		if is_on_floor():
			jump_amount = 0
			velocity.y = jump_speed
func take_damage():
	life -= 1
	var text = "LIFE: "+String(life)
	lifetxt.clear()
	lifetxt.add_text(text)
	velocity.y = jump_speed
	if life == 0:
		get_tree().change_scene("res://scene/death menu.tscn")
func changelvl():
	lvl += 1
func win():
	queue_free()
	if lvl == 1:
		get_tree().change_scene("res://scene/Control.tscn")
	elif lvl == 2:
		get_tree().change_scene("res://scene/Control2.tscn")
func coinget():
	coin += 1
	var text = "SCORE: "+String(coin)
	scoretxt.clear()
	scoretxt.add_text(text)


