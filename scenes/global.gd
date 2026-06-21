extends Node

var score : int = 500
var high_score : int = 0
var current_level : int = 1

const SAVE_FILE = "user://savegame.dat"

func save_high_score():

	if score > high_score:
		high_score = score

	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)

	if file:
		file.store_var(high_score)

func load_high_score():

	if FileAccess.file_exists(SAVE_FILE):

		var file = FileAccess.open(SAVE_FILE, FileAccess.READ)

		if file:
			high_score = file.get_var()
