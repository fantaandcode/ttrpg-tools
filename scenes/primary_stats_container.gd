extends HBoxContainer

@export var stat_name := 'Test'
@onready var rand = RandomNumberGenerator.new()

var stat_value := 10
var stat_mod := 0
@onready var check_proficient = %ProficientCheckButton.button_pressed

signal updated_stat(s_ref)
signal rolled_check(s_name, r_value, c_fail, c_pass)

func _ready():
	%PrimaryStatLabel.set_text(stat_name)

func _on_roll_check_button_pressed():
	var d20_roll = rand.randi_range(1, 20)
	var check_total = d20_roll + stat_mod + int(check_proficient) * PlayerStats.proficiency_bonus
	var crit_fail = d20_roll == 1
	var crit_pass = d20_roll == 20
	rolled_check.emit(stat_name, check_total, crit_fail, crit_pass)

func _on_primary_stat_line_edit_text_changed(new_text):
	stat_value = int(%PrimaryStatLineEdit.get_text())
	stat_mod = round((stat_value - 10.1)/2)
	%ModifierStatLabel.set_text(str(stat_mod))
	updated_stat.emit(self)

func _on_proficient_check_button_toggled(button_pressed):
	check_proficient = button_pressed
