extends Area2D

var bullet_speed = 20

func _physics_process(delta):
	position.x += bullet_speed

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	queue_free()
	
