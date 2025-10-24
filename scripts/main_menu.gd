extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%Settings.hide()
	$Settings/BackButton.pressed.connect(_on_back_pressed)
	%MusicSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0)) 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	MusicController.click_sound()
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_settings_pressed() -> void:
	MusicController.click_sound()
	%Settings.show()


func _on_exit_pressed() -> void:
	MusicController.click_sound()
	get_tree().quit()
func _on_back_pressed() -> void:
	MusicController.click_sound()
	%Settings.hide()


func _on_music_slider_mouse_exited() -> void:
	release_focus()


func _on_apply_pressed() -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(%MusicSlider.value))
	MusicController.click_sound()
