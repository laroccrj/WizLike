extends Node2D

var grid_size = Config.grid_size
var facing = Vector2.RIGHT

func _process(delta):
	if Input.is_action_just_pressed('ui_right'):
		move(Vector2.RIGHT)
	elif Input.is_action_just_pressed('ui_left'):
		move(Vector2.LEFT)
	elif Input.is_action_just_pressed('ui_up'):
		move(Vector2.UP)
	elif Input.is_action_just_pressed('ui_down'):
		move(Vector2.DOWN)
		
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_SPACE:
			var spell = Spell.new()
			var pos = self.position  + (facing * grid_size)
			var dir = facing
			GlobalNodes.spell_controller.spawn_spell(pos, dir)
			Signals.emit("process_turn")

func move(dir : Vector2):
	if facing == dir:
		position += dir * grid_size
	else:
		facing = dir
	Signals.emit("process_turn")
