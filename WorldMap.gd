extends TileMap

onready var world = get_node("/root/World")
var width = 256
var height = 144
var localities = []
var sectors = []
const Locality = preload("Locality.gd")
const Sector = preload("Sector.gd")

var noise

func make_map(w,h):
	width = w
	height = h
	#randomize()
	noise = OpenSimplexNoise.new()
	noise.seed = 1
	noise.octaves = 2 #My default is 2
	noise.period = 64 #My default is 16
	noise.persistence = 0.25 #My default is 1
	
	for y in height/16:
		for x in width/16:
			# Creates sectors and assigns an index number
			var s = Sector.new(y*16+x,x*world.GRIDSIZE,y*world.GRIDSIZE)
			sectors.append(s)
			#print(Vector2(s.x,s.y))
	
	for y in height:
		for x in width:
			# Assigns an elevation to localities
			var e = noise.get_noise_2d(x,y) # e is a number from -1 to 1
			e = (e+1)*0.5 # Makes e a number from 0 to 1
			e = round(e*16+0.6)-1 # Makes e an integer from 0 to 15
			var t = Locality.new(x,y,e) # Create locality
			#localities.append(t)
			var s = sectors[ceil(y-1+x/16)] # Get locality's sector 
			s.append_locality(t) # Assign locality to sector
	
	for f in sectors.size():
		print("Sector" + str(f) + " contains " + str(sectors[f].localities.size()) + " localities")
	
func _draw():
	#for t in localities:
	#		set_cell(t.x,t.y,t.elevation) # Makes a a color from 0 (Red) to 15 (Dark blue)
	for s in sectors: 
		for t in s.localities:
				set_cell(t.x,t.y,t.elevation) # Makes a a color from 0 (Red) to 15 (Dark blue)
		
	
