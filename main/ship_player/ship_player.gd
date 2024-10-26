extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _init():
	print(ProjectSettings.get_setting("physics/2d/default_gravity"))


func _physics_process(delta):

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionY = Input.get_axis("ui_down", "ui_up")
	if directionY:
		velocity.y = directionY * SPEED * -1
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
		
	var directionX = Input.get_axis("ui_left", "ui_right")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
