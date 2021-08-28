extends AnimatedSprite

var bullet_speed = 10

func _physics_process(delta):
	position.x += bullet_speed

