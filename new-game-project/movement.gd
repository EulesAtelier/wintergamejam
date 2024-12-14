extends CharacterBody3D
var speed = 2  # speed in pixels/sec
var healthandammo
@onready var snowmanModel = $Snowman
func _ready() -> void:
	healthandammo = get_node("../Control/healthammo")
func _physics_process(delta):
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input != Vector2(0,0):
		var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
		velocity.x = movement_dir.x * speed
		velocity.z = movement_dir.z * speed
		snowmanModel.look_at(transform.origin + velocity * -1,Vector3.UP)
	if velocity.length() > 0:
		healthandammo.value+=1
		velocity *= 0.99 #dampen the velocity to simulate friction on a slippery surface
	move_and_slide()
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT :
			healthandammo.value-=10
