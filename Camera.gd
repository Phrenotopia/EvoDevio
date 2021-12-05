extends Camera2D

func _input(event):
	if Input.is_action_pressed("camera_zoom_in") and zoom > Vector2(0.25,0.25):
		zoom -= Vector2(0.25,0.25)
	elif Input.is_action_pressed("camera_zoom_out") and zoom < Vector2(4,4):
		zoom += Vector2(0.25,0.25)


func _process(delta):
	if Input.is_action_pressed("camera_up") and not Input.is_action_pressed("camera_down"):
		position.y -= 10 * zoom.x
	if Input.is_action_pressed("camera_down") and not Input.is_action_pressed("camera_up"):
		position.y += 10 * zoom.x
	if Input.is_action_pressed("camera_left") and not Input.is_action_pressed("camera_right"):
		position.x -= 10 * zoom.x
	if Input.is_action_pressed("camera_right") and not Input.is_action_pressed("camera_left"):
		position.x += 10 * zoom.x
