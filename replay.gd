extends Node2D





func but_replay_pressed():
	get_tree().change_scene("res://world.tscn")
	get_tree().paused = false


func but_quit_pressed():
	get_tree().quit()

 
