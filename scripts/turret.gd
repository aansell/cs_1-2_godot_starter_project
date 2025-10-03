extends Node2D

# TODO: Add variables for turret state
# Track if player is in range, projectile scene, etc.
# Look at "Boolean Variables and State Tracking" documentation
var player_in_range = false
var my_position=global_position
#var target_position= target_object.global_position
#var distance = my_position.distance_to(target_position)
var target_object
var from_position = Vector2 (100,100)
var to_position = Vector2 (200,150)
var direction = (to_position-from_position).normalized()
var start_time = 2
var timer = start_time

var player
# TODO: Add projectile scene variable
var projectile_scene = preload("res://scenes/enemy_projectile.tscn")
# Look at "Reusing Projectile Systems" documentation

func _process(delta: float) -> void:
	if player_in_range:
		timer -= delta
		if timer<0:
			shoot_at_player()
			timer = start_time
	

#func _on_detection_area_body_exited(body):
	## TODO: Check if the body is the player  
	#if body.name == "Player":
	## Update player detection state
		#player_in_range = false
		#print ("Player lost!")
	# Look at "Boolean Variables and State Tracking" documentation

func shoot_at_player():
	# TODO: Get player's current position
	# Calculate direction from turret to player
	# Create and launch projectile
	# Look at "Getting Object Positions", "Direction Calculation", 
	# and "Reusing Projectile Systems" documentation
	
	var new_projectile = projectile_scene.instantiate()
	new_projectile.global_position = position
	get_parent().add_child(new_projectile)
	new_projectile.set_direction(player.position)
	print ("Player detected!")

func _on_area_2d_body_entered(body: Node2D) -> void:
	# TODO: Check if the body is the player
	if body.name == "Player":
	# Update player detection state
		player_in_range=true
		player = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	# TODO: Check if the body is the player
	if body.name == "Player":
	# Update player detection state
		player_in_range=false
		player = null
		
		
	
#func _on_body_entered (body):
	#if body.name == "Player":
		#Player = body
		#pass
	
