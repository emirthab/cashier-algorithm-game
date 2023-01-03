extends Node3D

var moneys = [10, 10, 5, 5, 5, 5, 1, 0.50, 0.50, 0.25, 0.25]
var change = 21.5

func _ready():
	$UI/Change.text = 'Give Change : $ ' + str(change)
	get_node('case/button/Area3D').connect("input_event", on_ok_pressed)
	var thread = Thread.new()
	thread.start($case.calculate)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if $UI.visible == true:
				$AnimationPlayer.play("camera_init")
				$UI.visible = false
			elif $UI_END.visible == true:
				get_tree().reload_current_scene()

func on_ok_pressed(camera, event, position, normal, shape_idx):
	if $case.calculation_is_ready == false: return
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$man/AnimationPlayer.play("dance")
			$AnimationPlayer.play("end_game")
			$UI_END.visible = true
			var used_combos_productivity = 0
			for combo in $case.combos_with_productivity:
				if arrays_have_same_content(combo['combination'], $case.selected_moneys):
					used_combos_productivity = combo['productivity']
			$UI_END/ProgressBar.value = used_combos_productivity

func arrays_have_same_content(array1, array2) -> bool:
	if array1.size() != array2.size(): 
		return false
	for item in array1:
		if !array2.has(item): 
			return false
		if array1.count(item) != array2.count(item): 
			return false
	return true

#var moneys = [10, 10, 5, 5, 5, 5, 1, 0.50, 0.50, 0.25, 0.25]
#var change = 21.5

#var moneys = [10, 1, 1, 1, 1, 0.50, 0.50, 0.50, 0.50]
#var change = 14.50
