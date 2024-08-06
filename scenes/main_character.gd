extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -450.0

# JUMP_HOLD_TIME and jump_time are for the low and high jumps
const JUMP_HOLD_TIME = 15
var jump_time = 0

@onready var sprite_2d = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# variables for the character
	var direction = Input.get_axis("left", "right")
	
	# change animations between running and default
	if direction < 0 or direction > 0:
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	# and change animation to jumping
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"

	# if the jump key is released: stop going further up
	if Input.is_action_just_released("jump"):
		jump_time = 0

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_time = JUMP_HOLD_TIME
	
	# jump while the jump_time is active
	if jump_time > 0:
		velocity.y = JUMP_VELOCITY
		jump_time -= 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 50)

	move_and_slide()

	# create variable to show in wich direction the player is facing or was facing at the last movement
	# for true: look left
	# for false: look right
	var lookingLeft = direction < 0
	if direction != 0:
		sprite_2d.flip_h = lookingLeft
