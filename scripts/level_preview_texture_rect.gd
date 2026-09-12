extends TextureRect

@export var ease: Tween.EaseType
@export var trans: Tween.TransitionType
@export var duration: float
@export var move_target: Vector2 = Vector2(822, 230)
@export var scale_target: Vector2 = Vector2(1,1)

var original_position: Vector2
var original_scale: Vector2

# Armazenado Tween numa variável para garantir um reset
# correto
var _movement_animation: Tween

func _ready() -> void:
	original_position = position
	original_scale = scale

# TODO: Melhorar nome
# - Nomes de função deveriam conter verbos no infinitivo
# - Nomes de função devem ser descritivas de maneira conceitual

# TODO: Pensar em colocar parâmetro relativo à orientação 
# que as infos do level entram
func animation():
	position = original_position
	self.scale = original_scale
	# Tween 1 - Declaração
	
	if _movement_animation:
		_movement_animation.kill()
	
	_movement_animation = create_tween().set_parallel(true)
	
	# Tween 2 - Configuração
	_movement_animation.set_ease(ease).set_trans(trans)
	
	# Tween 3 - Animação
	_movement_animation.tween_property(self, "position", move_target, duration)
	_movement_animation.tween_property(self, "scale", scale_target, duration)
