extends RigidBody2D

onready var break_s : AudioStreamPlayer2D = get_node("break")
onready var start_s : AudioStreamPlayer2D = get_node("start")
onready var you_win_s : AudioStreamPlayer2D = get_node("you_win")
onready var lose_s : AudioStreamPlayer2D = get_node("lose")
onready var hit_s : AudioStreamPlayer2D = get_node("hit")


var game_started = false

func _input(event): 
		if event.is_action_pressed("iniciar") and not game_started:
			linear_velocity = Vector2(50,-250)
			game_started = true
			start_s.play()
	
func _process(delta):
	for body in get_colliding_bodies():
		if body.is_in_group("gr_blocks"):
			body.queue_free()
			break_s.play()
			if body.get_parent().get_child_count() == 1:
				print("Ganaste")
				you_win_s.play()
				get_tree().paused = true
				yield(you_win_s,"finished")
				queue_free()
				get_tree().change_scene("res://replay.tscn")
		elif body.get_name() == "bord_bot":
			print("Perdiste")
			get_tree().paused = true
			lose_s.play()
			yield(lose_s,"finished")
			queue_free()
			var replay_scn = load("res://replay.tscn")
			get_parent().add_child(replay_scn.instance())
		else:
			hit_s.play()
 



