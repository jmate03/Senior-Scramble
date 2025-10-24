extends Node2D
@onready var parallax = $ParallaxBackground

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func scroll(speed, delta):
	parallax.scroll_offset.x -= speed*delta
