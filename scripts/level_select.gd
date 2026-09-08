extends Control

@export var initial_focus: Button
@export var boss_buttons: Array[Button] 

@export var level_data: Array[Level]

@onready var level_name_label: RichTextLabel = %LevelNameLabel
@onready var stage_label: RichTextLabel = %StageLabel
@onready var boss_label: RichTextLabel = %BossLabel

@onready var labels: Control = %Labels
@onready var level_preview_texture_rect: TextureRect = %LevelPreviewTextureRect

@onready var tween = get_tree().create_tween()

func _ready() -> void:
	initial_focus.grab_focus()
	
	var index := 0
	for button in boss_buttons:
		button.focus_entered.connect(_on_button_focus_entered.bind(button, index))
		index += 1

func _get_level(index: int) -> Level:
	# TODO: lidar com null ref
	if level_data.size() <= index:
		printerr("No level found")
		return null
	return level_data[index]

func _on_button_focus_entered(button: Button, level_index: int) -> void:
	#var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_SINE)
	#tween.tween_property(%LevelNameLabel,"modulate", Color.WHITE, 0.5)
	#print("focus entered " + button.boss_name + " " + button.stage)
	
	var focused_level: Level = _get_level(level_index)
	level_name_label.text = focused_level.stage
	boss_label.text = focused_level.boss_name
	labels.animation()
	level_preview_texture_rect.animation()
	

#region Animations

#endregion
