extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")
var train_scene: PackedScene = preload("res://scenes/train.tscn")
var truck_scene: PackedScene = preload("res://scenes/truck.tscn")

var time : int = 0

func _on_finish_area_2d_body_entered(_body: Node2D) -> void:
	Global.score += 1000
	call_deferred("next_level")
	
func change_scene():
	get_tree().change_scene_to_file("res://scenes/Title.tscn")

func next_level():
	load_next_level()

func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate() as Area2D
	var pos_marker = $StartPositions/CarStartPositions.get_children().pick_random() as Marker2D
	car.position = pos_marker.position
	$Objects.add_child(car)
	car.connect("body_entered", go_to_title)
	

func _on_train_timer_timeout() -> void:
	var train = train_scene.instantiate() as Area2D
	var pos_marker = $StartPositions/TrainStartPositions.get_children().pick_random() as Marker2D
	train.position = pos_marker.position
	$Objects.add_child(train)
	train.connect("body_entered", go_to_title)
	


func _on_truck_timer_timeout() -> void:
	var truck = truck_scene.instantiate() as Area2D
	var pos_marker = $StartPositions/TruckStartPositions.get_children().pick_random() as Marker2D
	truck.position = pos_marker.position
	$Objects.add_child(truck)
	truck.connect("body_entered", go_to_title)

func go_to_title(_body):
	Global.save_high_score()
	call_deferred("change_scene")


func _on_score_timer_timeout() -> void:
	Global.score = max(0, Global.score - 5)
	time += 1
	$CanvasLayer/Label.text = "Time Elapsed: " + str(time)
	
func load_next_level():
	Global.current_level += 1

	match Global.current_level:
		2:
			get_tree().change_scene_to_file("res://scenes/level2.tscn")
		3:
			Global.save_high_score()
			get_tree().change_scene_to_file("res://scenes/Title.tscn")
		## 4:
			##get_tree().change_scene_to_file("res://scenes/Victory.tscn")

func _ready() -> void:
	var multiplier = 1.0 + (Global.current_level - 1) * 0.25

	$Timer/CarTimer.wait_time /= multiplier
	$Timer/TrainTimer.wait_time /= multiplier
	$Timer/TruckTimer.wait_time /= multiplier


func pause_game():
	get_tree().paused = true
	$CanvasLayer/PausePanel.visible = true


func resume_game():
	get_tree().paused = false
	$CanvasLayer/PausePanel.visible = false

func _input(event):

	if event.is_action_pressed("pause"):

		if get_tree().paused:
			resume_game()
		else:
			pause_game()


func _on_resume_button_pressed() -> void:
	resume_game()
