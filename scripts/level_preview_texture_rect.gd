class_name LevelPreviewTexture
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


# TODO: Pensar em colocar parâmetro relativo à orientação 
# que as infos do level entram
func animate_preview_texture():

	position = original_position
	self.scale = original_scale
	
	if _movement_animation:
		_movement_animation.kill()
	
	_movement_animation = create_tween().set_parallel(true)
	
	_movement_animation.set_ease(ease).set_trans(trans)
	
	_movement_animation.tween_property(self, "position", move_target, duration)
	_movement_animation.tween_property(self, "scale", scale_target, duration)
