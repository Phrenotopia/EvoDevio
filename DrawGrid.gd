extends Node2D

onready var world = get_node("/root/World")

func _draw():
	var columns = world.MAPSIZE.x/(world.GRIDSIZE/world.PIXELSCALE)#How many columns can fit in the map
	var rows = world.MAPSIZE.y/(world.GRIDSIZE/world.PIXELSCALE)#How many rows can fit in the map
	
	for i in columns+1:
		draw_rect(Rect2(i*world.GRIDSIZE, 0, 4, world.MAPSIZE.y*8), "#000000") #Draws every line in the columns
	for i in rows+1:
		draw_rect(Rect2(0, i*world.GRIDSIZE, world.MAPSIZE.x*8, 4), "#000000") #Draws every line in the rows
