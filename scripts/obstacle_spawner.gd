extends Node2D

@export var obstacle_scenes: Array[PackedScene] = []
@export var dollar_scene: PackedScene

@export var spawn_x_position := 350.0
@export var ground_y_position := 128.5
@export var min_spawn_interval := 0.8
@export var max_spawn_interval := 2.0

var time_until_next_spawn := 0.0
var time_elapsed := 0.0

func _ready() -> void:
	randomize()
	next_spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_elapsed += delta
	time_until_next_spawn -= delta
	
	if time_until_next_spawn <= 0:
		spawn_obstacle()
		spawn_dollars()
		next_spawn()

func next_spawn():
	time_until_next_spawn = randf_range(min_spawn_interval, max_spawn_interval)

func spawn_obstacle():
	if obstacle_scenes.is_empty():
		return
	var rand_scene = obstacle_scenes[randi() % obstacle_scenes.size()]
	var obstacle = rand_scene.instantiate()
	
	obstacle.position = Vector2(spawn_x_position, ground_y_position)
	
	add_child(obstacle)

func spawn_dollars():
	if not dollar_scene:
		print("Error no dollar scene")
		return
	#print("spawning dollars")
	var dollar_offset_x = spawn_x_position + 50
	var num_dollars = randi_range(1,3)
	for i in range(num_dollars):
		var dollar = dollar_scene.instantiate()
		dollar.position = Vector2(dollar_offset_x + (i*20), ground_y_position)
		add_child(dollar)
		#print("dollar spawned at: ", dollar.position)
func stop_spawn():
	set_process(false)

func start_spawn():
	set_process(true)
	next_spawn()
