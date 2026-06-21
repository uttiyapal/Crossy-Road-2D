extends Area2D

var direction = Vector2.LEFT
var speed = 100 + ((Global.current_level-1)*20)
var color = [preload("res://graphics/cars/car1.png"),
	preload("res://graphics/cars/car2.png"),
	preload("res://graphics/cars/car3.png"),
	preload("res://graphics/cars/car4.png"),
	preload("res://graphics/cars/car5.png"),
	preload("res://graphics/cars/car6.png")]

func _ready() -> void:
	if position.x < 0:
		direction.x = 1
	$Sprite2D.texture = color.pick_random()

func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
