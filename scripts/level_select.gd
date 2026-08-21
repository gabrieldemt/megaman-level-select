extends Control

@export var initial_focus: Button
@export var boss_buttons: Array[Button] 

func _ready() -> void:
	initial_focus.grab_focus()
	
	for button in boss_buttons:
		button.focus_entered.connect(_on_button_focus_entered.bind(button))
		
func _on_button_focus_entered(button: Button) -> void:
	print("focus entered " + button.boss_name)
