extends Node2D

var grid_size = Config.grid_size
var facing = Vector2.RIGHT
var _pos = Vector2.ZERO

func _process(delta):
	if Input.is_action_just_pressed('ui_right'):
		move(Vector2.RIGHT)
	elif Input.is_action_just_pressed('ui_left'):
		move(Vector2.LEFT)
	elif Input.is_action_just_pressed('ui_up'):
		move(Vector2.UP)
	elif Input.is_action_just_pressed('ui_down'):
		move(Vector2.DOWN)
	position = get_formatted_pos() * grid_size
		
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
		_pos += dir
		if GlobalNodes.map.isWall(_pos):
			_pos -= dir
	else:
		facing = dir
	Signals.emit("process_turn")
	
func get_formatted_pos():
	return _pos + Vector2.RIGHT + Vector2.DOWN
