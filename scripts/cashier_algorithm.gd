extends Node
func _ready():
	var coins = [10, 5, 4, 3, 2, 1, 0.5,0.5, 0.25]
	coins = convert_coins_dict(coins)
	var change = 10
	var combinations = give_change(change, coins)
	var sorted = sort_arrays_by_size(combinations)
	print(get_combinations_productivity(combinations))

func give_change(remaining_amount: float, coins : Array , combinations: Array =[]):
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

func convert_coins_dict(coins: Array) -> Array:
	var new_list : Array = []
	for coin in coins:
		new_list.append({
			'amount': coin,
			'used': false
		})
	return new_list

func sort_arrays_by_size(arrays: Array):
	for i in range(0, arrays.size()):
		for j in range(i+1, arrays.size()):
			if arrays[i].size() > arrays[j].size():
				var temp = arrays[i]
				arrays[i] = arrays[j]
				arrays[j] = temp

func get_combinations_productivity(combinations : Array):
	var new_list : Array = []
	for i in range(0, combinations.size()):
		var productivity : float = (float(combinations.size()) - i) / combinations.size() * 100
		new_list.append({
			'productivity': productivity,
			'combination': combinations[i]
		})
	return new_list
