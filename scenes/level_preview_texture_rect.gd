extends TextureRect

@export var ease: Tween.EaseType
@export var trans: Tween.TransitionType
@export var duration: float
@export var move_target: Vector2 = Vector2(822, 230)
@export var scale_target: Vector2 = Vector2(1,1)

var original_position: Vector2
var original_scale: Vector2
func _ready() -> void:
	original_position = position
	original_scale = scale
	animation()

func animation():
	position = original_position
	self.scale = original_scale
	# Tween 1 - Declaração
	var movement_animation: Tween = create_tween().set_parallel(true)
	
	# Tween 2 - Configuração
	movement_animation.set_ease(ease).set_trans(trans)
	
	# Tween 3 - Animação
	movement_animation.tween_property(self, "position", move_target, duration)
	movement_animation.tween_property(self, "scale",scale_target,duration)
	
	
