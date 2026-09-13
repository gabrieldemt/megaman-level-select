extends Button

@export var boss_name: String
@export var stage: String


@onready var button_click_sound: AudioStreamPlayer2D = %ButtonClickSound
var _button_pressed_tween: Tween

func _ready():
	# set pivot on bottom center
	pivot_offset = size * Vector2(0.5, 1.0)

func _on_button_down():
	button_click_sound.stop()
	button_click_sound.play()
	# ensures the tween is not running
	if _button_pressed_tween: _button_pressed_tween.kill()
	
	# scale down to give a pressed look
	scale = Vector2(0.9, 0.9)

func _on_button_up():
	button_click_sound.stop()
	button_click_sound.play()
	_button_pressed_tween = create_tween()
	_button_pressed_tween.set_ease(Tween.EASE_OUT)
	_button_pressed_tween.set_trans(Tween.TRANS_SPRING)
	
	# restores the scale smoothly in 0.15 seconds
	_button_pressed_tween.tween_property(self, "scale", Vector2(1,1), 0.15)
