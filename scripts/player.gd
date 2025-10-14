extends CharacterBody2D

@onready var animated = $AnimatedSprite2D
@onready var standing_collision = $StandingCollision
@onready var ducking_collision = $DuckingCollision
@onready var duck_timer = $DuckTimer
var is_ducking = false
const SPEED = 300.0
const JUMP_VELOCITY = -360.0
signal hit

func _ready():
	standing_collision.disabled = false
	ducking_collision.disabled = true
	
	duck_timer.timeout.connect(end_duck)
	hit.connect(_on_hit)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
		# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and not is_ducking:
		velocity.y = JUMP_VELOCITY
		animated.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if is_on_floor():
		if not is_ducking and animated.animation != "run":
			animated.play("run")
	else:
		if animated.animation != "jump":
				animated.play("jump")

	move_and_slide()
	if Input.is_action_just_pressed("duck") and is_on_floor() and not is_ducking:
		start_duck()

func start_duck():
	if is_ducking:
		return
	is_ducking = true
	animated.play("duck")
	
	standing_collision.disabled = true
	ducking_collision.disabled = false
	duck_timer.start(0.75)

func end_duck():
	if not is_ducking:
		return
	
	is_ducking = false
	
	standing_collision.disabled = false
	ducking_collision.disabled = true
	
	animated.play("run")

func _on_hit():
	print("Player hit")
