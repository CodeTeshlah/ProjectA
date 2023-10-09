extends Node3D
@onready var path = $Navigation/Path3D/PathFollow3D
@onready var player = $Navigation/Path3D/PathFollow3D
@onready var path1 = $Navigation/Path3D
@onready var path2 = $Navigation/Path3DLeft
@onready var path3 = $Navigation/Path3DRight
@onready var anim = $Navigation/Path3D/PathFollow3D/Player/Camera3D/AnimationPlayer
var running = 1
func _ready():
	pass # Replace with function body.

func _process(delta):
		const move_speed = 5.0
		if (check_input()):
			running = 3
		else:
			running = 1
		path.progress += (move_speed * running ) * delta
		anim.play("head_bob")
		print(path.progress_ratio >= 1)
		if (path.progress_ratio) >= 1:
			anim.stop(false)
			check_direction()
		else:
			pass
		
func check_input():
	if Input.is_action_pressed("player_move"):
		return true
	else:
		return false

func check_direction():
	if (Input.is_action_just_pressed('player_move_right')):
		path1.remove_child(player)
		path3.add_child(player)
		path.progress = 0
	if (Input.is_action_just_pressed("player_move_left")):
		path1.remove_child(player)
		path2.add_child(player)
		path.progress = 0
