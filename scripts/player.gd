extends CharacterBody2D
@onready var _animation_player: AnimatedSprite2D = $AnimatedSprite2D
var projectile_scene = preload("res://scenes/projectile.tscn")

var xSpeed = 200.0
var xDirection = 0
var facing = "down"
var ySpeed = 200.0
var yDirection = 0
var coins = 0

# TODO: Add health system variables
@export var maxHealth = 10
@export var health = maxHealth

# TODO: Add projectile scene for shooting
# var projectile_scene = preload("res://scenes/projectile.tscn")

	
func change_coins(amount:int):
	coins += amount
	print ("you have collected " + str(coins) + " coins")

func _physics_process(_delta):
	# TODO: Get horizontal input (left/right keys)
	# Input.get_axis checks two keys and gives us a number:
	# - When LEFT is pressed: returns -1.0
	# - When RIGHT is pressed: returns 1.0  
	# - When NOTHING is pressed: returns 0.0
	xDirection = Input.get_axis("ui_left", "ui_right")
	
	# TODO: Get vertical input (up/down keys)  
	# Same idea, but for up and down movement
	yDirection = Input.get_axis("ui_up", "ui_down")
	

	# TODO: Calculate X movement by multiplying direction × speed
	# This gives us the actual pixels to move this frame
	# If direction is 1 and speed is 300, we get 300 pixels right
	# If direction is -1 and speed is 300, we get -300 pixels (left)
	velocity.x = xSpeed*xDirection
	
	# TODO: Calculate Y movement the same way
	velocity.y = ySpeed*yDirection
	
	# TODO: Set the player's velocity (how fast they're moving)
	# Godot's CharacterBody2D uses a velocity system
	
	
	
	# TODO: Update facing direction based on movement
	# Use if statements to check xDirection and yDirection
	# Set facing to "right", "left", "down", or "up"
	# Only update facing when actually moving (direction != 0)
	if xDirection>0:
		facing = "right"
	elif xDirection<0:
		facing = "left"
	elif yDirection >0:
		facing = "down"	
	elif yDirection <0:
		facing = "up"	
		
		
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
		
	# TODO: Update animation based on facing direction
	# Call your update_animation() function here
	update_animation()
	# TODO: Actually apply the movement
	# This is a special Godot function that makes the movement happen
	move_and_slide()
	
	
	
		
	
# TODO: Create animation function (add this outside of _physics_process)
func update_animation():
	if xDirection == 0 && yDirection == 0:
		_animation_player.play("idle_"+ facing)
	else: _animation_player.play("walk_"+ facing)
		
		# TODO: Set the animation based  on the facing direction
		# Use: _animation_player.play("idle_" + facing)
		# This combines "idle_" with whatever direction we're facing
	


# TODO: Create health change function for interactions
func change_health(amount):
	# TODO: Add amount to health (positive = heal, negative = damage)
	health += amount
	# TODO: Make sure health stays between 0 and maxHealth
	if health > maxHealth:
		health=maxHealth
	elif health <= 0 :
		health = 0
		print ("Player died!")
		queue_free()
	# TODO: Print the new health value
	# TODO: Check if health <= 0 for death (optional challenge)
	print ("Player health:", str(health))
	print("Health changed by: ", amount)
	
	if health == 0:
		die()
# TODO: Create shooting function
func shoot():
	# TODO: Create a new projectile instance
	# Look at the documentation examples in the lesson
	
	var new_projectile = projectile_scene.instantiate()
	get_parent().add_child(new_projectile)
	new_projectile.set_direction(facing)
	# TODO: Set projectile position to player position
	# Look at the "Setting Object Position" example
	new_projectile.global_position = position
	new_projectile.position += Vector2(0,-25)
	
	# TODO: Set projectile direction using facing variable
	# Look at the "Calling Functions on Other Objects" example
	
	
	# TODO: Add projectile to the game world
	# Look at the "Adding Objects to the Game World" example
	get_parent().add_child(new_projectile)
	add_child(new_projectile)
	# TODO: Print shooting confirmation
	# print("Shot projectile facing: ", facing)
	print("Shot projectile facing:", facing)

func die():
		var game_over_scene = preload("res://scenes/game_over.tscn")
		var new_game_over = game_over_scene.instantiate()
		get_parent().add_child(new_game_over)
		new_game_over.global_position = position
		new_game_over.position += Vector2(330,330)
		#scale_amount_set_param(4)

	
