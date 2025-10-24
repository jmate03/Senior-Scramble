extends TabContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tab_selected.connect(_on_tab_selected)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_tab_selected(tab_index:int):
	MusicController.click_sound()
