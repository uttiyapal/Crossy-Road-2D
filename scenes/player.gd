extends CharacterBody2D
var direction: Vector2 = Vector2(1,1)
var speed = 4000

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed * delta
	animation()
	move_and_slide()
	
func animation():
		if direction:
			$AnimatedSprite2D.flip_h = direction.x < 0
		else:
			$AnimatedSprite2D.frame = 0
