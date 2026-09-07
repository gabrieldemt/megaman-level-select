extends Control

@export var ease: Tween.EaseType
@export var trans: Tween.TransitionType
@export var duration: float

@onready var level_name_label: RichTextLabel = %LevelNameLabel
@onready var stage_label: RichTextLabel = %StageLabel
@onready var boss_label: RichTextLabel = %BossLabel

var visible_ratio_target: float = 1.0

func _ready() -> void:
	level_name_label.visible_ratio = 0.0
	stage_label.visible_ratio = 0.0
	boss_label.visible_ratio = 0.0
	animation()

func animation():
	var typing_animation: Tween = create_tween()
	
	typing_animation.set_ease(ease).set_trans(trans)
	
	typing_animation.tween_property(level_name_label, "visible_ratio",visible_ratio_target,duration)

	typing_animation.tween_property(stage_label, "visible_ratio",visible_ratio_target,duration)
	
	typing_animation.tween_property(boss_label, "visible_ratio",visible_ratio_target,duration)
