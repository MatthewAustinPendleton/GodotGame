extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0

@onready var ap = $AnimationPlayer
@onready var sprite = $PlayerSprite

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction = Vector2.RIGHT

func _physics_process(delta):
	#sprite.texture = load("res://Walk-Man.png")
	if Input.is_action_pressed("ui_left"):
		direction = Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		direction = Vector2.RIGHT
		
	if direction == Vector2.RIGHT:
		sprite.flip_h = false
	if direction == Vector2.LEFT:
		sprite.flip_h = true
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionInput = Input.get_axis("ui_left", "ui_right")
	if directionInput:
		velocity.x = directionInput * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if velocity.x == 0:
		ap.play("idle")
	else:
		ap.play("walk_animation")

