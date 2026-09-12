class_name labelsControl
extends Control

@export var ease: Tween.EaseType
@export var trans: Tween.TransitionType
@export var duration: float

@onready var level_name_label: RichTextLabel = %LevelNameLabel
@onready var stage_label: RichTextLabel = %StageLabel
@onready var boss_label: RichTextLabel = %BossLabel

var _label_tween: Tween
var visible_ratio_target: float = 1.0

func _ready() -> void:
	animate_rich_text_label()

func animate_rich_text_label():
	if _label_tween:
		_label_tween.kill()
	
	level_name_label.visible_ratio = 0.0
	stage_label.visible_ratio = 0.0
	boss_label.visible_ratio = 0.0
	
	_label_tween = create_tween()
	
	_label_tween.set_ease(ease).set_trans(trans)
	
	_label_tween.tween_property(level_name_label, "visible_ratio",visible_ratio_target,duration)

	_label_tween.tween_property(stage_label, "visible_ratio",visible_ratio_target,duration)
	
	_label_tween.tween_property(boss_label, "visible_ratio",visible_ratio_target,duration)


func _on_level_name_label_focus_entered() -> void:
	animate_rich_text_label()
