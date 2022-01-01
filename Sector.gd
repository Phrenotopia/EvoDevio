extends Node

const Locality = preload("Locality.gd")

class_name Sector #A 16x16 grid of localities

var localities : Array
var index : int 
var x : int
var y : int
#var localities : Locality

func _init(i,posx,posy):
	index = i
	x = posx
	y = posy


func append_locality(locality):
	localities.append(locality)
