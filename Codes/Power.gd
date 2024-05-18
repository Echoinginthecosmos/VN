extends Node3D

const SPEED = 6
var direction = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
func _process(_delta):
	look_at (get_viewport().get_camera_3d().global_transform.origin,Vector3 (0,1,0))

	


func _on_area_3d_2_body_entered(body: CharacterBody3D):
	pass


func _on_area_3d_2_body_exited(body: CharacterBody3D):
	pass # Replace with function body.


func _on_area_3d_body_entered(body: CharacterBody3D):
	Global.hit = true
