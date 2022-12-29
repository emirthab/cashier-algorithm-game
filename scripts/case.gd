extends Node3D

@onready var moneys : Array
@onready var change : float = 10
var cashier_algorithm = preload("res://scripts/cashier_algorithm.gd")

func _ready():
	set_moneys([10,10, 5, 5,5,5,5,5,5, 4, 5, 4, 3, 2, 1, 0.5,0.5, 0.25, 0.10])
	var moneys_dict = cashier_algorithm.convert_coins_dict(moneys)
	var combos = cashier_algorithm.give_change(change, moneys_dict)
	cashier_algorithm.sort_arrays_by_size(combos)
	var result = cashier_algorithm.get_combinations_productivity(combos)
	print(result)

func _process(delta):
	pass

func set_moneys(moneys : Array):
	self.moneys = moneys
