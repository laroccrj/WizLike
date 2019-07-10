class_name Spell extends Node2D

signal process_turn

func _ready():
	Signals.connect("process_turn", self, "process_turn")
	
func process_turn():
	position += Vector2(Config.grid_size,0)