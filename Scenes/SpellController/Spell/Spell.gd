class_name Spell extends Node2D

signal process_turn

var direction

func _ready():
	Signals.connect("process_turn", self, "process_turn")
	var angel = Vector2.ZERO.angle_to_point(direction)
	self.rotation = angel
	
func process_turn():
	position += direction * Config.grid_size