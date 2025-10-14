extends Node2D

@export var obstacle_scenes: Array[PackedScene] = []

@export var spawn_x_position := 350.0
@export var ground_y_position := 128.5
@export var min_spawn_interval := 1.5
@export var max_spawn_interval := 3.5

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

func stop_spawn():
	set_process(false)

func start_spawn():
	set_process(true)
	next_spawn()
