extends TileMap

var _tileset
var pos = Vector2(0,0)

func _ready():
	_tileset = get_tileset()
	cell_size.x = Config.grid_size
	cell_size.y = Config.grid_size
	spawnRoom(Vector2(0,0), 10, 10)
		
func spawnRoom(start, width, height):
	for x in range(width):
		for y in range(height):
			var pos = start + Vector2(x, y)
			spawnRandomBlock(pos)

func spawnRandomBlock(pos):
	var tile = "rocky"
	if randi() % 2 == 0:
		tile = "dirty"
	set_cellv(pos, _tileset.find_tile_by_name(tile))