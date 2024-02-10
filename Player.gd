extends CharacterBody2D

class_name Player

@export var max_speed = 2
@export var rotation_speed = 2
@export var velocity_damping_factor = .5
@export var linear_velocity = 75

var input_vector: Vector2
var rotation_direction = 0
var playerHealth = 10
var playerLives = 3

func _process(delta):
	input_vector.x = Input.get_action_strength("left") - Input.get_action_strength("right")
	input_vector.y = Input.get_action_strength("down")
	
	if Input.is_action_pressed("right"):
		rotation_direction = 1
	elif Input.is_action_pressed("left"):
		rotation_direction = -1
	else: 
		rotation_direction = 0
		
	move_and_collide(velocity * delta)
	Transform2D()

func _physics_process(delta):
	rotation += (rotation_direction * rotation_speed * delta)
	if (input_vector.y > 0):
		accelerate(delta)
	elif input_vector.y == 0 && velocity != Vector2.ZERO:
		apply_drag(delta)

# we can limit the player's movement by restricting the value of velocity
# by limiting the length of velocity to our max speed, we are defining the
# limit of how far the object can travel when traversing away from a 
# vector
func accelerate( delta: float):
	velocity += (input_vector * linear_velocity * delta).rotated(rotation)
	velocity.limit_length(max_speed)

func apply_drag(delta: float):
	# lerp, how did i not know about this method, hereeee lets have a lerp shall weeee
	velocity = lerp(velocity, Vector2.ZERO, velocity_damping_factor * delta)
	
	# stopp
	if velocity.y >= 0.1 && velocity.y <= 0.1:
		velocity.y = 0
		velocity.x = 0





#func get_input():
#	#look_at(get_global_mouse_position())
#	rotation_direction = Input.get_axis("left", "right")
#	velocity = transform.x * Input.get_axis("up", "down") * speed
#	print(velocity)
#
#func _physics_process(delta):
#	get_input()
#	rotation += rotation_direction * rotation_speed * delta
#	move_and_slide()
