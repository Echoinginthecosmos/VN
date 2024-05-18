extends Node3D

var Dialogue = DialogueResource

func _process(delta):
	var camera_pos = get_viewport().get_camera_3d().global_transform.origin
	camera_pos.y = 0
	look_at(camera_pos, Vector3(0, 1, 0))

var resource = load("res://Codes/angel - test.dialogue")
# then
var dialogue_line = await DialogueManager.get_next_dialogue_line(resource, "angel_meeting")



func _on_area_3d_body_entered(body: CharacterBody3D):
	Global.talkin = true
	DialogueManager.show_dialogue_balloon(resource, "angel_meeting")
