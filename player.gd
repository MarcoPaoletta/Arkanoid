extends KinematicBody2D

export var speed = 4  

# Movimiento
func _process(delta):
	if Input.is_action_pressed("derecha"):
		var mouvement : Vector2 = Vector2(speed,0)
		move_and_collide(mouvement)
	if Input.is_action_pressed("izquierda"):
		var mouvement : Vector2 = Vector2(-speed,0)
		move_and_collide(mouvement)
	

	
