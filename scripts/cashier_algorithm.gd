extends Node

func _ready():
	pass

static func give_change(remaining_amount: float, coins : Array , combinations: Array =[]):
	if remaining_amount == 0:
		var combination : Array = []
		for coin in coins:
			if coin['used']: 
				combination.append(coin.amount)
		if combination not in combinations: 
			combinations.append(combination)
		return
	for coin in coins:
		if remaining_amount < coin['amount'] or coin['used']:
			continue
		coin['used'] = true
		give_change(remaining_amount - coin['amount'],coins, combinations)
		coin['used'] = false
	return combinations

static func convert_coins_dict(coins: Array) -> Array:
	var new_list : Array = []
	for coin in coins:
		new_list.append({
			'amount': coin,
			'used': false
		})
	return new_list

static func sort_arrays_by_size(arrays: Array):
	for i in range(0, arrays.size()):
		for j in range(i+1, arrays.size()):
			if arrays[i].size() > arrays[j].size():
				var temp = arrays[i]
				arrays[i] = arrays[j]
				arrays[j] = temp

static func get_combinations_productivity(combinations : Array):
	var new_list : Array = []
	for i in range(0, combinations.size()):
		var productivity : float = (float(combinations.size()) - i) / combinations.size() * 100
		new_list.append({
			'productivity': productivity,
			'combination': combinations[i]
		})
	return new_list
