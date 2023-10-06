extends Node3D
@onready var path = $Path3D/PathFollow3D
@onready var player = $Path3D/PathFollow3D
@onready var path1 = $Path3D#/PathFollow3D
@onready var path2 = $Path3DLeft#/PathFollow3D
@onready var path3 = $Path3DRight#/PathFollow3D
func _ready():
	pass # Replace with function body.

func _process(delta):
		const move_speed = 10.0
		#if (check_input()):
		path.progress += move_speed * delta
		print(path.progress_ratio >= 1)
		if (path.progress_ratio) >= 1:
			check_direction()
		else:
			pass
		
func check_input():
	if Input.is_action_pressed("player_move"):
		return true
	else:
		return false

func check_direction():
	if (Input.is_action_just_pressed('player_move_left')):
		path1.remove_child(player)
		path2.add_child(player)
		path.progress = 0
	if (Input.is_action_just_pressed("player_move_right")):
		path1.remove_child(player)
		path3.add_child(player)
		path.progress = 0
