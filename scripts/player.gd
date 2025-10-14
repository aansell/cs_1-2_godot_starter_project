extends CharacterBody2D
@onready var _animation_player: AnimatedSprite2D = $AnimatedSprite2D
var projectile_original = preload("res://scenes/projectile.tscn")

var current_enemy
var in_range = false
var is_attacking = false
var attack_timer = 0.67
var xSpeed = 300.0
var xDirection = 0
var facing = "down"
var ySpeed = 300.0
var yDirection = 0
var coins = 0
@export var offset : Vector2 = Vector2(0, -25)
@onready var melee: Area2D = $Melee





# TODO: Add health system variables
var maxHealth = 10
var health = maxHealth

func _ready() -> void:
	pass

func _physics_process(_delta):
	if Input.is_action_pressed("ui_accept"):
		is_attacking = true
		print("attacked")
	
	if current_enemy != null and is_attacking:
		current_enemy.queue_free()
		
	
	if is_attacking:
		attack_timer = _delta
		if attack_timer < 0:
			is_attacking = false
			attack_timer = 0.67
	
	xDirection = Input.get_axis("ui_left", "ui_right")
	
	
	yDirection = Input.get_axis("ui_up", "ui_down")
	
	
	velocity.x = xDirection * xSpeed
	velocity.y = yDirection * ySpeed
	
	
	if xDirection > 0:
		facing = "right"
		melee_hitbox.position = Vector2(30,0)
	elif xDirection < 0:
		facing = "left"
		melee_hitbox.position = Vector2(0,30)
	elif yDirection < 0:
		facing = "up"
		melee_hitbox.position = Vector2(-30,0)
	elif yDirection > 0:
		facing = "down"
		melee_hitbox.position = Vector2(0,-30)
	
	if Input.is_action_pressed("ui_select"):
		shoot()
	
	# call the animation function
	update_animation()
	
	
	# This is a special Godot function that makes the movement happen
	move_and_slide()

			
		

# TODO: Create animation function (add this outside of _physics_process)
func update_animation():
	# TODO: Set the animation based on the facing direction
	if velocity.is_zero_approx():
		_animation_player.play("idle_" + facing)
	# This combines "idle_" with whatever direction we're facing
		pass
	elif !velocity.is_zero_approx():
		#walking animation here
		_animation_player.play("walk_" + facing)
		pass
		
	


# TODO: Create health change function for interactions
func change_health(_amount:int):
		health += _amount
		if health < 1:
			die()
		if health > maxHealth:
			health = maxHealth
		print("Health: ", health)

func change_coins(_amount:int):
	coins += _amount
	print("you have " +str(coins) +" coins")

func die():
	print("you died")
	
# TODO: Create shooting function
func shoot():
	# TODO: Create a new projectile instance
	var projectile_clone = projectile_original.instantiate()
	
	# TODO: Set projectile position to player position
	projectile_clone.global_position = position + offset
	
	# TODO: Set projectile direction using facing variable
	projectile_clone.set_direction(facing)
	
	# TODO: Add projectile to the game world
	get_tree().get_root().add_child(projectile_clone)

	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy") and is_attacking:
		current_enemy = body
		print("attack enemy")
	#if in_range:
		#if is_attacking:
			#queue_free()
	pass # Replace with function body.


func _on_melee_body_exited(body: Node2D) -> void:
	if body.is_in_group("enemy") and is_attacking:
		current_enemy = null
