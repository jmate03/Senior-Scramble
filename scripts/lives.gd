extends Node2D

@onready var heart1 = $Life1  
@onready var heart2 = $Life2
@onready var heart3 = $Life3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_lives(new_lives: int):
	match new_lives:
		3:
			heart1.play("full")
			heart2.play("full")
			heart3.play("full")
		2:
			heart1.play("full")
			heart2.play("full")
			heart3.play("empty")
		1:
			heart1.play("full")
			heart2.play("empty")
			heart3.play("empty")
		0:
			heart1.play("empty")
			heart2.play("empty")
			heart3.play("empty")
