extends TileMap

var width = 256
var height = 144
var tiles = {}
const Tile = preload("Tile.gd")

var noise

func make_map(x,y):
	width = x
	height = y
	#randomize()
	noise = OpenSimplexNoise.new()
	noise.seed = 1
	noise.octaves = 2 #My default is 2
	noise.period = 64 #My default is 16
	noise.persistence = 0.25 #My default is 1
	
	var i = 0
	for x in width:
		for y in height:
			var e = noise.get_noise_2d(x,y) # a is a number from -1 to 1
			e = (e+1)*0.5 # Makes a a number from 0 to 1
			e = round(e*16+0.6)-1 # Makes an integer from 0 to 15
			#print(e)
			var t = Tile.new(x,y,e)
			tiles.values().append(t)
	
	_draw()

func _draw():
	print("draw world map with  tiles ")
	for t in tiles:
			print(t)
			set_cell(t.x,t.y,t.a) # Makes a a color from 0 (Red) to 15 (Dark blue)
