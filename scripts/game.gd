extends Node
var game_running : bool 
var game_over : bool 
var score
var time_elapsed: float

@onready var player = $Player  
@onready var obstacle_spawner = $obstacle_spawner

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.lives_changed.connect($UI/Lives.update_lives)  # Adjust $UI path if needed
	player.game_over.connect(_on_player_game_over)
	
	start_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_running:
		update_time(delta)
		update_score(delta)
	

func start_game():
	game_running = true
	score = 0
	$"UI/Score Timer Label".text = "Score: 0"
	$"UI/Score Timer".start()

func update_score(delta):
	score += delta
	$"UI/Score Timer Label".text = "Score: " + str(int(score))

func update_time(delta):
	time_elapsed += delta
	var minutes = int(time_elapsed / 60)
	var seconds = int(time_elapsed) % 60
	$"UI/Time Elapsed Label".text = "Time: %02d:%02d" % [minutes, seconds]

func _on_player_game_over():
	game_running = false
	game_over = true
	obstacle_spawner.stop_spawn()
