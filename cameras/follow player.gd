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
	# calculate the x and the y size of the tile
	var mapSizeInPixels = mapRect.size * tileSize
	
	# set limits for the camera
	# top and left limit are at 0, because the map starts at 0
		# if map would have startet further to the right, better caclulations would be needed
	# right and bottom limits are given by the mapSizeInPixels divided by the 2 border tiles at the top, bottom, left and right
	limit_right = mapSizeInPixels.x - (tileSize * 2)
	limit_left = 0
	limit_bottom = mapSizeInPixels.y - (tileSize * 2)
	limit_top = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
