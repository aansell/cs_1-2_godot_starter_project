extends Area2D

# TODO: Add speed variable for how fast projectile moves
var speed = 400

# TODO: Add direction variable to store which way to move
var direction : Vector2

func _ready() -> void:
	print("created")

func _process(_delta):
	
	# TODO: Calculate movement using direction and speed
	# Similar to player movement: velocity = direction * speed
	position += speed * direction * _delta
	
	

	

# TODO: Create function to set projectile direction
func set_direction(_target):
	
	direction = (_target-position).normalized()
	print(position)
	
