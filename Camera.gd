extends Camera2D

onready var world = get_node("/root/World")
onready var world_size = world.MAPSIZE * world.PIXELSCALE
onready var starting_point = world_size / 2 #Finds the middle of the map

const SPEED = 10

var current_speed = SPEED

func _ready():
	self.position = starting_point #Sets itself into the middle of the map
	zoom = world_size / Vector2(1920,1080) #Makes the camera fill the entire map


func _input(event):
	if Input.is_action_pressed("camera_zoom_in"): #and zoom > Vector2(0.25,0.25):
		#zoom -= Vector2(0.25,0.25) * zoom.x
		if not zoom == Vector2(0.5,0.5):
			zoom = Vector2(0.5,0.5)
			position = get_global_mouse_position()
		
		#position -= get_global_mouse_position() - position / 2
		
	
	elif Input.is_action_pressed("camera_zoom_out"): #and zoom < Vector2(4,4):
		zoom = world_size / Vector2(1920,1080) #Makes the camera fill the entire map
		self.position = starting_point #Puts the camera at the centre of the map


func _process(delta):
	movement()


func movement():
	
	current_speed = SPEED*zoom.x
	
	if Input.is_action_pressed("camera_speed_up"):
		
		current_speed = current_speed*4 #Makes the camera go four times as fast when "sprinting"
		
	else:
		current_speed = SPEED #Makes the camera go the normal speed
	
	if Input.is_action_pressed("camera_up") and not Input.is_action_pressed("camera_down"):
		if position.y >= 540*zoom.y+current_speed: #I don't know why but this works. Makes the camera unable to leave the map
			position.y -= current_speed
		else:
			position.y = 540*zoom.y
	if Input.is_action_pressed("camera_down") and not Input.is_action_pressed("camera_up"):
		if position.y <= world_size.y - 540*zoom.y - current_speed:
			position.y += current_speed
		else:
			position.y = world_size.y - 540*zoom.y
	if Input.is_action_pressed("camera_left") and not Input.is_action_pressed("camera_right"):
		if position.x >= 960*zoom.x+current_speed:
			position.x -= current_speed
		else:
			position.x = 960*zoom.x
	if Input.is_action_pressed("camera_right") and not Input.is_action_pressed("camera_left"):
		if position.x <= world_size.x - 960*zoom.x - current_speed:
			position.x += current_speed
		else:
			position.x = world_size.x - 960*zoom.x
	
	#current_speed = SPEED #Makes sure the camera doesn't speed up over time when "sprinting"
