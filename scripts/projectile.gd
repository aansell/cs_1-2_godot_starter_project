extends Area2D
var direction 
var speed = 300

func _ready() -> void:
	pass

func _physics_process(_delta):
	position += direction * speed * _delta
	
	pass

func set_direction(facing_direction):
	if facing_direction == "up":
		direction = Vector2.UP
	elif facing_direction == "down":
		direction = Vector2.DOWN
	elif facing_direction == "left":
		direction = Vector2.LEFT
	elif facing_direction == "right":
		direction = Vector2.RIGHT
	
	pass
