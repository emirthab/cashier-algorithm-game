extends Node3D

var moneys = [10, 10, 5, 5, 5, 5, 1, 0.50, 0.50, 0.25, 0.25]
var change = 21.5

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton and $UI.visible == true:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$AnimationPlayer.play("camera_init")
			$UI.visible = false


#var moneys = [10, 10, 5, 5, 5, 5, 1, 0.50, 0.50, 0.25, 0.25]
#var change = 21.5

#var moneys = [10, 1, 1, 1, 1, 0.50, 0.50, 0.50, 0.50]
#var change = 14.50
