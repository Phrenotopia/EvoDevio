extends Node2D

var noise
const MAPSIZE = Vector2(480, 270) #Vector2(119, 65) For 32x32 tiles


func _ready():
	#randomize()
	noise = OpenSimplexNoise.new()
	noise.seed = 1
	noise.octaves = 2 #My default is 2
	noise.period = 64 #My default is 16
	noise.persistence = 0.25 #My default is 1
	make_map()


func make_map():
	for x in MAPSIZE.x:
		for y in MAPSIZE.y:
			var a = noise.get_noise_2d(x,y) # a is a number from -1 to 1
			a = (a+1)*0.5 # Makes a a number from 0 to 1
			a = round(a*16+0.6)-1 # Makes a an integer from 0 to 15
			#print(a)
			$ElevationMap.set_cell(x,y,a) # Makes a a color from 0 (Red) to 15 (Dark blue)
			
#			if a <= 0.1:
#				$RainbowNoise.set_cell(x,y,0)
#			elif a <= 0.2:
#				$RainbowNoise.set_cell(x,y,1)
#			elif a <= 0.3:
#				$RainbowNoise.set_cell(x,y,2)
#			elif a <= 0.4:
#				$RainbowNoise.set_cell(x,y,3)
#			elif a <= 0.5:
#				$RainbowNoise.set_cell(x,y,4)
#			elif a <= 0.6:
#				$RainbowNoise.set_cell(x,y,5)
#			elif a <= 0.7:
#				$RainbowNoise.set_cell(x,y,6)
#			elif a <= 0.8:
#				$RainbowNoise.set_cell(x,y,7)
#			elif a <= 0.9:
#				$RainbowNoise.set_cell(x,y,8)
#			elif a <= 1:
#				$RainbowNoise.set_cell(x,y,9)
