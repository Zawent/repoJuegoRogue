extends HSlider

@export var audio_bus_name: String
@onready var volume_image: TextureRect = $"../VolumeImage"


# Estas variables aparecerán en el Inspector para que arrastres tus archivos .png
@export var vol_max : Texture2D
@export var vol_medio : Texture2D
@export var vol_min : Texture2D
@export var vol_mute : Texture2D

var audio_bus_id

func _ready() -> void:
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	# Sincronizamos el icono al arrancar el juego
	_update_icon(value)

func _on_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id, db)
	_update_icon(value)

func _update_icon(val: float) -> void:
	if volume_image:
		if val <= 0:
			volume_image.texture = vol_mute
		elif val < 0.4:
			volume_image.texture = vol_min
		elif val < 0.8:
			volume_image.texture = vol_medio
		else:
			volume_image.texture = vol_max
