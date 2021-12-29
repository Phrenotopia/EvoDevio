extends Node2D

onready var world = get_node("/root/World")

const COLOUR = Color(1,1,1,0.25)

func _draw():
	var columns = world.MAPSIZE.x/(world.GRIDSIZE/world.PIXELSCALE) #How many columns can fit in the map
	var rows = world.MAPSIZE.y/(world.GRIDSIZE/world.PIXELSCALE) #How many rows can fit in the map
		
	for i in columns:
		if i != 0 :
			draw_rect(Rect2(i*world.GRIDSIZE-1, -1, 4, world.MAPSIZE.y*8), COLOUR) #Draws every line in the columns
	for i in rows:
		if i != 0 :
			draw_rect(Rect2(0, i*world.GRIDSIZE, world.MAPSIZE.x*8, 4), COLOUR) #Draws every line in the rows

