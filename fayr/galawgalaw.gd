extends Node3D
@onready var path = $Path3D/PathFollow3D

func _ready():
	pass # Replace with function body.

func _process(delta):
		const move_speed = 4.0
		if (check_input()):
			path.progress += move_speed * delta
		
func check_input():
	if Input.is_action_pressed("player_move"):
		return true
	else:
		return false
