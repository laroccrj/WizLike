extends Node2D

var grid_size = Config.grid_size

func _process(delta):
	if Input.is_action_just_pressed('ui_right'):
		move(Vector2(grid_size,0))
	elif Input.is_action_just_pressed('ui_left'):
		move(Vector2(-grid_size,0))
	elif Input.is_action_just_pressed('ui_up'):
		move(Vector2(0,-grid_size))
	elif Input.is_action_just_pressed('ui_down'):
		move(Vector2(0,grid_size))
		
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_SPACE:
			var spell = Spell.new()
			GlobalNodes.spell_controller.spawn_spell()

func move(dir : Vector2):
	position += dir
	Signals.emit("process_turn")
