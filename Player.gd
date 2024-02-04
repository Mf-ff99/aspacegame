extends CharacterBody2D

@export var speed = 200
@export var rotation_speed = 7

var rotation_direction = 0
var playerHealth = 10
var playerLives = 3
var mouseIsInsideMe = false

func get_input():
	#look_at(get_global_mouse_position())
	rotation_direction = Input.get_axis("left", "right")
	velocity = transform.x * Input.get_axis("up", "down") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
