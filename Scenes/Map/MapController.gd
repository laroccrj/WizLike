class_name MapController extends TileMap

var _tileset
var pos = Vector2(0,0)
var _walls = {}

func _ready():
	GlobalNodes.map = self
	_tileset = get_tileset()
	cell_size.x = Config.grid_size
	cell_size.y = Config.grid_size
	spawnRoom(Vector2(-1,-1), 10, 10)
		
func spawnRoom(start, width, height):
	for x in range(width):
		for y in range(height):
			var pos = start + Vector2(x, y)
			if x == 0 or y == 0 or x == width - 1 or y == height - 1:
				spawnWall(pos)
			else:
				spawnRandomBlock(pos)

func spawnRandomBlock(pos):
	var tile = "rocky"
	if randi() % 2 == 0:
		tile = "dirty"
	set_cellv(pos, _tileset.find_tile_by_name(tile))
	
func spawnWall(pos):
	var tile = "wall"
	set_cellv(pos, _tileset.find_tile_by_name(tile))
	_walls[pos] = true
	
func isWall(pos):
	return _walls.has(pos)