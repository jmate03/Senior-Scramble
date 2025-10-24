extends Area2D
@export var dollar_value: int = 1
@export var speed: float = 100.0
@onready var dollarsfx = $DollarSFX

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed*delta
	if position.x < -100:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		dollarsfx.pitch_scale = randf_range(0.9,1.3)
		dollarsfx.play()
		collect(body)

func collect(player):
	if player.has_method("collect_dollar"):
		player.collect_dollar(dollar_value)
		visible = false
		$CollisionShape2D.set_deferred("disabled", true)
		
		await dollarsfx.finished
	queue_free()
