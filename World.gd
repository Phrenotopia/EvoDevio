extends Node2D

var noise
const MAPSIZE = Vector2(480, 240) #Vector2(119, 65) For 32x32 tiles
const PIXELSCALE = 8 #How big the ElevationMap tiles are in pixels
const GRIDSIZE = 12*PIXELSCALE

func _ready():
	#randomize()
	noise = OpenSimplexNoise.new()
	noise.seed = 1
	noise.octaves = 2 #My default is 2
	noise.period = 64 #My default is 16
	noise.persistence = 0.25 #My default is 1
	make_map()
	$Grid._draw()


func make_map():
	for x in MAPSIZE.x:
		for y in MAPSIZE.y:
			var a = noise.get_noise_2d(x,y) # a is a number from -1 to 1
			a = (a+1)*0.5 # Makes a a number from 0 to 1
			a = round(a*16+0.6)-1 # Makes an integer from 0 to 15
			#print(a)
			$ElevationMap.set_cell(x,y,a) # Makes a a color from 0 (Red) to 15 (Dark blue)



