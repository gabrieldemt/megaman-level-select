extends Control

@export var initial_focus: Button
@export var boss_buttons: Array[Button] 
@onready var level_name_label: Label = %LevelNameLabel
@onready var stage_label: Label = %StageLabel
@onready var boss_label: Label = %BossLabel

@onready var tween = get_tree().create_tween()

func _ready() -> void:
	
	initial_focus.grab_focus()
	
	for button in boss_buttons:
		button.focus_entered.connect(_on_button_focus_entered.bind(button))
		
		
func _on_button_focus_entered(button: Button) -> void:
	var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_SINE)
	tween.tween_property(%LevelNameLabel,"modulate", Color.WHITE, 0.5)
	
	
	print("focus entered " + button.boss_name + " " + button.stage)
	level_name_label.text = button.stage
	boss_label.text = button.boss_name
	
