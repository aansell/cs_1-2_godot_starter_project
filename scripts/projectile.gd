extends CharacterBody2D

# TODO: Add speed variable for how fast projectile moves
var speed = 300

# TODO: Add direction variable to store which way to move
var direction = Vector2.ZERO


func _physics_process(_delta):
	# TODO: Calculate movement using direction and speed
	# Similar to player movement: velocity = direction * speed
	velocity.x = speed*direction
	velocity.y = speed*direction

	
	# TODO: Apply the movement
	# Use: move_and_slide()
	move_and_slide()
	
	# TODO: Print movement for debugging
	# print("Projectile moving: ", velocity)
	print("Projectile moving:", velocity)
	

# TODO: Create function to set projectile direction
func set_direction(facing_direction):
	# TODO: Convert facing string to Vector2 direction
	# Use if statements: "up" -> Vector2.UP, "down" -> Vector2.DOWN, etc.
	# Set direction = the Vector2 result
	
	# TODO: Print the direction for debugging
	# print("Projectile direction set to: ", direction)
	
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	# TODO: Remove projectile when it goes off screen
	# Use: queue_free()
	
	# TODO: Print when projectile is removed
	# print("Projectile removed - went off screen")
	
	pass
