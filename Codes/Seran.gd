extends CharacterBody3D


var SPEED = 5
const JUMP_VELOCITY = 6.5

var mouseSensibility = 600
var mouse_relative_x = 0
var mouse_relative_y = 0
var jump_number = 2
var jump_numb_const = 2
var groundon = false

var sprint = false

var touch = false
var isCrouching = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") + 5

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$MeshInstance3D/AnimationPlayer.play("Stand")
	
func _physics_process(delta):
	
	if Global.talkin == false:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Global.talkin == true:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if is_on_floor():
		jump_number = jump_numb_const
	
	if Input.is_action_pressed("sprint"):
		sprint = true
		
	if sprint == true:
		SPEED = 8
	if sprint == false:
		SPEED = 4
	if not is_on_floor():
		velocity.y -= gravity * delta
		groundon = false
	# Handle Jump.
	if Input.is_action_just_pressed("Jump") and jump_number > 0:
		velocity.y = 8
		jump_number -= 1
		print(jump_number)
		$AudioStreamPlayer.playing = true
	# clicking on stuff
	if Input.is_action_just_pressed("up"):
		$MeshInstance3D/AnimationPlayer.play("Walk")
		
	if Input.is_action_just_pressed("back"):
		$MeshInstance3D/AnimationPlayer.play("Walk")
		
	if Input.is_action_just_released("up"):
		$MeshInstance3D/AnimationPlayer.play("Stand")
		
	if Input.is_action_just_released("back"):
		$MeshInstance3D/AnimationPlayer.play("Stand")
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "right", "up", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 4)
		velocity.z = move_toward(velocity.z, 0, 6)
	move_and_slide()
	

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		get_tree().paused = true
	
	sprint = false

		
func _input(event):
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x / mouseSensibility
		$head.rotation.x -= event.relative.y / mouseSensibility
		$head.rotation.x = clamp($head.rotation.x , deg_to_rad(-90), deg_to_rad(90))
		mouse_relative_x = clamp(event.relative.x , -50, 50)
		mouse_relative_y = clamp(event.relative.y , -50, 50)
		
		

		
