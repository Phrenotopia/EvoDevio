extends Node2D

const SCALE = 16
const MAPSIZE = Vector2(16*SCALE, 9*SCALE) #Vector2(119, 65) For 32x32 tiles
const PIXELSCALE = 8 #How big the ElevationMap tiles are in pixels / ElevationMap cell_size
const GRIDSIZE = 16*PIXELSCALE

func _ready():
	$WorldMap.make_map(MAPSIZE.x, MAPSIZE.y)
	$Grid._draw()


#func make_map():
#	for x in MAPSIZE.x:
#		for y in MAPSIZE.y:
#			var a = noise.get_noise_2d(x,y) # a is a number from -1 to 1
#			a = (a+1)*0.5 # Makes a a number from 0 to 1
#			a = round(a*16+0.6)-1 # Makes an integer from 0 to 15
#			#print(a)
#			$ElevationMap.set_cell(x,y,a) # Makes a a color from 0 (Red) to 15 (Dark blue)



