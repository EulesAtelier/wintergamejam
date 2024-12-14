extends RigidBody3D

var speed = 2  # speed in pixels/sec

func _physics_process(delta):
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input != null:
		var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
		velocity.x = movement_dir.x * speed
		velocity.z = movement_dir.z * speed
	move_and_slide()
func _process(delta: float) -> void:
	pass
