extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.value = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.hit == true:
		$ProgressBar.value = Global.health
