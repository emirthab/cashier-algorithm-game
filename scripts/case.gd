extends Node3D

@onready var moneys : Array = []
@onready var change : float = 10
@onready var selected_moneys : Array = []
var cashier_algorithm = preload("res://scripts/cashier_algorithm.gd")

func _ready():
	moneys = [10,10, 5, 5,5,5,5,5,5, 5, 1,1,1,1,1,0.5,0.5, 0.5,0.5, 0.25, 0.1]
	initial_moneys()
#	var moneys_dict = cashier_algorithm.convert_coins_dict(moneys)
#	print(moneys_dict)
#	var combos = cashier_algorithm.give_change(change, moneys_dict)
#	print(combos)
#	cashier_algorithm.sort_arrays_by_size(combos)
#	print(combos)
#	var result = cashier_algorithm.get_combinations_productivity(combos)
#	print(result)

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

func decrease_money(money: float):
	for i in range(0, moneys.size()):
		if money == moneys[i]:
			var node = get_node_from_money(money)
			print(node)
			moneys.remove_at(i)
			return

func get_node_from_money(money : float) -> Node3D:
	var mon : String = str(money)
	mon = mon.replace('.','')
	print(mon)
	var node = get_node('dynamic/moneys/' + mon)
	return(node)


