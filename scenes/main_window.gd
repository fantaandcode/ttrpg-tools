extends Control

func _ready():
	for stat_container in get_tree().get_nodes_in_group('stat_container'):
		stat_container.connect('rolled_check', _on_rolled_check)
		stat_container.connect('updated_stat', _on_updated_stat)

func _on_rolled_check(s_name, r_value, crit_fail, crit_pass):
	%AbilityLabel.set_text(s_name)
	%CheckValueLabel.set_text(str(r_value))
	if crit_fail:
		%CheckValueLabel.set_label_settings(load("res://ui_theme/font_settings/fail_color.tres"))
	elif crit_pass:
		%CheckValueLabel.set_label_settings(load("res://ui_theme/font_settings/pass_color.tres"))
	else:
		%CheckValueLabel.set_label_settings(load("res://ui_theme/font_settings/default_color.tres"))

func _on_updated_stat(s_ref):
	print(s_ref.stat_name, s_ref.stat_value)
