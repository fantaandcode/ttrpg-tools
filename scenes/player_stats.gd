extends Node

var player_level = 1
var proficiency_bonus = 2 + floor((player_level-1)/4)

func set_player_level(new_level):
	player_level = new_level
	proficiency_bonus = 2 + floor((player_level-1)/4)
