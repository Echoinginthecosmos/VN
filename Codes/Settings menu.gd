extends Control

@onready var DDmenu = $OptionButton

func _on_OptionButton_item_selected(index):
	var current_selected = index
	
	if current_selected == 0:
		pass

func _on_music_value_changed(value):
	Global.MusVol = value


func _on_sound_effects_value_changed(value):
	Global.Effvol = value


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Main Menu.tscn") 


func _on_sound_effects_2_value_changed(value):
	pass # Replace with function body.


func _on_brightness_value_changed(value):
	pass


func _on_keybind_pressed():
	get_tree().change_scene_to_file("res://Keybind menu.tscn") 
