extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")
var train_scene: PackedScene = preload("res://scenes/train.tscn")
var truck_scene: PackedScene = preload("res://scenes/truck.tscn")

func _on_finish_area_2d_body_entered(_body: Node2D) -> void:
	print('Has entered')


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
	print('Collision')
