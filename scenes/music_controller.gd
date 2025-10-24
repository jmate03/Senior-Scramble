extends Node
@onready var button_sfx = $MenuButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func click_sound():
	if button_sfx.playing:
		button_sfx.stop()
	button_sfx.play()
