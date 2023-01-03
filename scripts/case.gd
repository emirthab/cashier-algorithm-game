extends Node3D

@onready var moneys : Array = get_parent().moneys
@onready var change : float = get_parent().change
@onready var selected_moneys : Array = []
var cashier_algorithm = preload("res://scripts/cashier_algorithm.gd")
var combos_with_productivity = []
var calculation_is_ready : bool = false

func calculate():
	initial_moneys()
	var moneys_dict = cashier_algorithm.convert_coins_dict(moneys)
	print('moneys_dict : \n' + '\n' + str(moneys_dict) + '\n\n\n')
	var combos = cashier_algorithm.give_change(change, moneys_dict)
	print('all_combos : \n' + '\n' + str(combos) + '\n\n\n')
	cashier_algorithm.sort_arrays_by_size(combos)
	print('sorted_combos : \n' + '\n' + str(combos) + '\n\n\n')
	combos_with_productivity = cashier_algorithm.get_combinations_productivity(combos)
	print('with_productivity : \n' + '\n' + str(combos_with_productivity) + '\n\n\n')
	calculation_is_ready = true

func _process(delta):
	pass

func initial_moneys():
	for money in moneys:
		var node = get_node_from_money(money)
		node.get_node('label').text = str(int(node.get_node('label').text) + 1)
		if node.visible == false:
			node.visible = true

func increase_money(money: float):
	moneys.append(money)
	var node = get_node_from_money(money)
	var int_label = int(node.get_node('label').text) + 1
	node.get_node('label').text = str(int_label)
	selected_moneys.erase(money)
	if node.visible == false:
		node.visible = true

func decrease_money(money: float):
	for i in range(0, moneys.size()):
		if money == moneys[i]:
			var node = get_node_from_money(money)
			var int_label = int(node.get_node('label').text) -1
			node.get_node('label').text = str(int_label)
			if int_label == 0:
				node.visible = false
			moneys.remove_at(i)
			selected_moneys.append(money)
			return

func get_node_from_money(money : float) -> Node3D:
	var mon : String = str(money)
	mon = mon.replace('.','')
	var node = get_node('dynamic/moneys/' + mon)
	return(node)




func _on_area_input_event(camera, event, position, normal, shape_idx):
	pass # Replace with function body.
