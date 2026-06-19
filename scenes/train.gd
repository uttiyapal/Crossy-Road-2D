extends Area2D

var direction = Vector2.LEFT
var speed = 200

func _ready() -> void:
	if position.x < 0:
		direction.x = 1

func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
