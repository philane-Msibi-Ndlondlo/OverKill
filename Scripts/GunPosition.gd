extends Position2D

var gun_position_x = 0

func _physics_process(delta):
	position.x = gun_position_x

