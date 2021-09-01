extends Area2D

const enemy_speed = 2

func _ready():
	pass

func _physics_process(delta):
	position.x += -enemy_speed

func _on_Enemy_area_entered(area):
	area.queue_free()
	queue_free()
