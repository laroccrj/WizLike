class_name Spell extends Node2D

signal process_turn

var direction

func _ready():
	Signals.connect("process_turn", self, "process_turn")
	
func process_turn():
	position += direction * Config.grid_size