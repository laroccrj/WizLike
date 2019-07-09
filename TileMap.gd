extends TileMap

var _tileset
var pos = Vector2(0,0)

func _ready():
	_tileset = get_tileset()
	spawnRoom(Vector2(0,0), 10, 10)

func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		# var tile_pos = world_to_map(event.pos)
		var tile_pos = world_to_map(get_viewport().get_mouse_position())
		print_debug('click')
		set_cellv(tile_pos, _tileset.find_tile_by_name("rocky"))
		
func spawnRoom(start, width, height):
	for x in range(width):
		for y in range(height):
			var pos = start + Vector2(x, y)
			spawnRandomBlock(pos)

func spawnRandomBlock(pos):
	var tile = "rocky"
	if randi() % 2 == 0:
		tile = "dirty"
	print_debug('spawnRandomBlock')
	print_debug(tile)
	print_debug(pos)
	set_cellv(pos, _tileset.find_tile_by_name(tile))