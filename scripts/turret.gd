extends Node2D

# TODO: Add variables for turret state
# Track if player is in range, projectile scene, etc.
# Look at "Boolean Variables and State Tracking" documentation
var player_in_range = false
var my_position=global_position
var target_position=target_object.global_position
var distance = my_position.distance_to(target_position)
var target_object
var from_position = Vector2 (100,100)
var to_position = Vector2 (200,150)
var direction = (to_position-from_position).normalized()
# TODO: Add projectile scene variable
# Look at "Reusing Projectile Systems" documentation

func _ready():
	# TODO: Set up shooting timer
	# Look at "Working with Timers" documentation
	var shooting_timer = $ShootingTimer
	shooting_timer.wait_time = 2.0
	shooting_timer.timeout.connect (_on_shooting_timer_timeout)
	
func _on_detection_area_body_entered(body):
	# TODO: Check if the body is the player
	if body.name == "Player":
	# Update player detection state
		player_in_range=true
		print ("Player detected!")
	# Look at "Boolean Variables and State Tracking" documentation
	

func _on_detection_area_body_exited(body):
	# TODO: Check if the body is the player  
	if body.name == "Player":
	# Update player detection state
		player_in_range = false
		print ("Player lost!")
	# Look at "Boolean Variables and State Tracking" documentation
	

func _on_shooting_timer_timeout():
	# TODO: Check if player is in range
	if player_in_range==true:
		shoot_at_player()
	# If yes, shoot at player
	# Look at documentation for shooting logic
	print("timer finished - shoot")

func shoot_at_player():
	# TODO: Get player's current position
	# Calculate direction from turret to player
	# Create and launch projectile
	# Look at "Getting Object Positions", "Direction Calculation", 
	# and "Reusing Projectile Systems" documentation
	var projectile_scene = preload("res://scenes/projectile.tscn")
	var new_projectile = projectile_scene.instantiate()
	get_parent().add_child(new_projectile)
	new_projectile.set_direction_vector(direction)
