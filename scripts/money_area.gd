extends Area3D

func _ready():
	self.connect("input_event", on_input_event)

func on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var case = get_parent().get_parent().get_parent().get_parent()
			var money = str(get_parent().name)
			if money.begins_with('0'):
				money = money.right(-1)
				money = '0.' + money
			money = money.to_float()
			print(money)
			case.decrease_money(money)
