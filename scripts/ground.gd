extends TileMapLayer
var game_running : bool 
var game_over : bool 
var scroll: float = 0.0
var score
const SCROLL_SPEED : float = 100
var screen_size : Vector2i

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport().get_visible_rect().size
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll += SCROLL_SPEED * delta

	# ground has fully scrolled one screen width, wrap it back
	if scroll >= screen_size.x:
		scroll = 0

	position.x = -scroll
