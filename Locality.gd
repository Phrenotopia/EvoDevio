extends Node

class_name Locality #A tile in WorldMap

var x : int	# x coordinate
var y : int	# y coordinate
var elevation : int 

#func _init():
#	pass
	
func _init(_x,_y,e): 
	x = _x
	y = _y
	elevation = e 
	
