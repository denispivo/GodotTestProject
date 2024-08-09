#
# use RemoteTransform2D in the player object and put the remote path to the camera
# the camera will get centered to the player
#

#
# assign the TileMap to the camera
#

extends Camera2D

@export var tilemap: TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	# get the position and count of the non empty tile maps
	var mapRect = tilemap.get_used_rect()
	# get the size of a tile
	var tileSize = tilemap.rendering_quadrant_size
	# set limits for the camera
	# top and left limit are at the starpoints of the map
	# right and bottom limits are given by the start and the tile size in x and y dimension
	limit_right = (mapRect.position.x + mapRect.size.x) * tileSize - tileSize
	limit_left = mapRect.position.x * tileSize + tileSize
	limit_bottom = (mapRect.position.y + mapRect.size.y) * tileSize - tileSize
	limit_top = mapRect.position.y * tileSize + tileSize

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
