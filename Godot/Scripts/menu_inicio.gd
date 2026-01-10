extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_buttons.visible = true
	options.visible = false


@onready var main_buttons: VBoxContainer = $MainButtons
@onready var options: Panel = $Options

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")


func _on_options_pressed() -> void:
	main_buttons.visible = false
	options.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_menu_pressed() -> void:
	_ready()


func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
