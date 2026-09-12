extends Control

@export var initial_focus: Button
@export var boss_buttons: Array[Button] 
@export var level_data: Array[Level]

@onready var level_name_label: RichTextLabel = %LevelNameLabel
@onready var stage_label: RichTextLabel = %StageLabel
@onready var boss_label: RichTextLabel = %BossLabel
@onready var labels: labelsControl = %Labels
@onready var level_preview_texture_rect: LevelPreviewTexture = %LevelPreviewTextureRect

func _ready() -> void:
	var index := 0

	for button in boss_buttons:
		button.focus_entered.connect(_on_button_focus_entered.bind(button, index))
		button.icon = level_data[index].boss_image
		index += 1
	
	initial_focus.grab_focus()

func _get_level(index: int) -> Level:
	if level_data.size() <= index:
		push_warning("Level not implemented yet. Don't worry. Index" + str(index))
		return null
	return level_data[index]

func _on_button_focus_entered(button: Button, level_index: int) -> void:
	# If level no implemented yet return
	var focused_level: Level = _get_level(level_index)
	if not focused_level: return
	
	# Display level info
	level_name_label.text = focused_level.stage
	boss_label.text = focused_level.boss_name
	level_preview_texture_rect.texture = level_data[level_index].preview
	
	if focused_level.is_going_right == false:
		level_preview_texture_rect.direction = false
		labels.position = labels.is_going_left_target
	else:
		level_preview_texture_rect.direction = true
		labels.position = labels.is_going_right_target
	
	# Animate ui components
	labels.animate_rich_text_label()
	level_preview_texture_rect.animate_preview_texture()
