extends TextureRect

@export var ease: Tween.EaseType
@export var trans: Tween.TransitionType
@export var duration: float
@export var move_target: Vector2 = Vector2(822, 230)

var original_position: Vector2

func _ready() -> void:
	original_position = position

func _test_animation():
	position = original_position
	
	# Tween 1 - Declaração
	var movement_animation: Tween = create_tween()
	
	# Tween 2 - Configuração
	movement_animation.set_ease(ease).set_trans(trans)
	
	# Tween 3 - Animação
	movement_animation.tween_property(self, "position", move_target, duration)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_test_animation()
