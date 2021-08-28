extends KinematicBody2D

var player_speed = 200

var player_position = Vector2.ZERO

var gravity = 0

var is_facing_right = true

onready var Bullet = preload("res://Scenes/Bullet.tscn")
var bullet

func _physics_process(delta):
	
	gravity += 5
	player_movement()
	shoot()
	player_position = move_and_slide(player_position, Vector2.UP)


func shoot():
	if Input.is_action_just_pressed("shoot"):
		bullet = Bullet.instance()
		
		if is_facing_right:
			bullet.bullet_speed = 10
			$GunPosition.gun_position_x = 18
		else:
			bullet.bullet_speed = -10
			$GunPosition.gun_position_x = -18
		bullet.global_position = $GunPosition.global_position
		get_parent().add_child(bullet)

func player_movement():
	
	if Input.is_action_just_pressed("right") and is_on_floor():
		move(true)
	elif Input.is_action_just_pressed("left") and is_on_floor():
		move(false)
	elif Input.is_action_just_pressed("right"):
		move(true)
	elif Input.is_action_just_pressed("left"):
		move(false)
	elif Input.is_action_pressed("right") and is_on_floor():
		run_movement(true)
	elif Input.is_action_pressed("left") and is_on_floor():
		run_movement(false)
	else:
		if gravity > 0 and is_on_floor():
			$AnimatedSprite.animation = "Idle"
			player_position.x = 0
		
	if Input.is_action_just_pressed("up") and is_on_floor():
		gravity = -300
		$AnimatedSprite.animation = "Jump"
		
	player_position.y = gravity

func run_movement(var move_to_right):
	move(move_to_right)	
	$AnimatedSprite.animation = "Run"
	
func move(var move_right):
	print(is_facing_right)
	if move_right:
		player_position.x = player_speed
		$AnimatedSprite.flip_h = false
		is_facing_right = true
	else:
		player_position.x = -player_speed
		$AnimatedSprite.flip_h = true
		is_facing_right = false
		
	
	
