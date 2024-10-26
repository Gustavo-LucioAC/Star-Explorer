extends Node2D

func _physics_process(delta):
	var directionY = Input.get_axis("ui_down", "ui_up")
	var directionX = Input.get_axis("ui_left", "ui_right")
	print(directionY)
	position.y += (directionY * 1001)
	position.x += (directionX * 1001)
