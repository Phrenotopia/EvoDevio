extends Node

class_name Tile

var x : int
var y : int
var elevation : int 

#func _init():
#	pass
	
func _init(posx,posy,e): 
	x = posx
	y = posy
	elevation = e 
	
