extends Camera2D

var speed = 20


func _ready():
	var StartingPoint = get_parent().MAPSIZE * get_parent().get_child(1).cell_size / 2 #Finds the middle of the map
	self.position = StartingPoint #Sets itself into the middle of the map


func _input(event):
	if Input.is_action_pressed("camera_zoom_in"): #and zoom > Vector2(0.25,0.25):
		zoom -= Vector2(0.25,0.25) * zoom.x
	elif Input.is_action_pressed("camera_zoom_out"): #and zoom < Vector2(4,4):
		zoom += Vector2(0.25,0.25) * zoom.x


func _process(delta):
	if Input.is_action_pressed("camera_speed_up"):
		speed = 40
	else:
		speed = 20
	
	if Input.is_action_pressed("camera_up") and not Input.is_action_pressed("camera_down"):
		position.y -= speed * zoom.x
	if Input.is_action_pressed("camera_down") and not Input.is_action_pressed("camera_up"):
		position.y += speed * zoom.x
	if Input.is_action_pressed("camera_left") and not Input.is_action_pressed("camera_right"):
		position.x -= speed * zoom.x
	if Input.is_action_pressed("camera_right") and not Input.is_action_pressed("camera_left"):
		position.x += speed * zoom.x
