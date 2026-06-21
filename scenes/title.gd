extends Control

func _ready() -> void:
	Global.load_high_score()

	$Label2.text = "High Score : " + str(Global.high_score)

func _process(_delta):
	if Input.is_action_just_pressed("confirm"):
		Global.score = 500
		Global.current_level = 1

		get_tree().change_scene_to_file("res://scenes/game.tscn")
