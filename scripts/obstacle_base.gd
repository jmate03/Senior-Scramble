extends Area2D
@export var speed: float = 100.0
var damage: int = 1
@export var y_offset := 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if has_node("AnimatedSprite2D"):
		var anim_sprite = $AnimatedSprite2D
		var variants = anim_sprite.sprite_frames.get_animation_names()
		if variants.size() > 0:
			var random_variant = variants[randi() % variants.size()]
			anim_sprite.play(random_variant)
			anim_sprite.pause()
	position.y += y_offset
	body_entered.connect(_on_body_entered)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed*delta
	
	if position.x < -100:
		queue_free()

func _on_body_entered(body):
	if body.name == "Player":
		print("Player hit obstacle")
		body.emit_signal("hit")
