extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body: CharacterBody3D):
	get_tree().change_scene_to_file("res://Layout/1-1.tscn")


func _on_area_3d_2_body_entered(body: CharacterBody3D):
	get_tree().reload_current_scene()
