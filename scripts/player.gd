extends CharacterBody2D
@onready var _animation_player: AnimatedSprite2D = $AnimatedSprite2D
var projectile_original = preload("res://scenes/projectile.tscn")
var you_died = preload("res://scenes/game_over.tscn")

var player
var current_enemy = null
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
@onready var melee_hitbox: CollisionShape2D = $Melee/Melee_hitbox
@onready var minotaur: CharacterBody2D = $"."

var lever = false
var lever2 = false
var lever3 = false
var lever4 = false

var maxHealth = 10
var health = maxHealth

func _ready() -> void:
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept"):
		is_attacking = true
	if is_attacking:
		attack_timer -= delta
		if attack_timer < 0:
			is_attacking = false
			attack_timer = 0.67
			print("timer over")
			print("attacked")

	xDirection = Input.get_axis("ui_left", "ui_right")
	
	
	yDirection = Input.get_axis("ui_up", "ui_down")
	
	if !lever and lever2 and lever3 and !lever4:
		print("You win!")
	
	velocity.x = xDirection * xSpeed
	velocity.y = yDirection * ySpeed
	
	
	if xDirection > 0:
		facing = "right"
		melee_hitbox.position = Vector2(30,0)
	elif xDirection < 0:
		facing = "left"
		melee_hitbox.position = Vector2(-30,0)
	elif yDirection < 0:
		facing = "up"
		melee_hitbox.position = Vector2(0,-30)
	elif yDirection > 0:
		facing = "down"
		melee_hitbox.position = Vector2(0,30)
	
	if Input.is_action_pressed("ui_select"):
		shoot()
		print("shoot")
	 
	update_animation()
	
	
	move_and_slide()

			
		

func update_animation():
	if is_attacking:
		_animation_player.play("attack_" + facing)
		pass
	elif !is_attacking:
		if velocity.is_zero_approx():
			_animation_player.play("idle_" + facing)
			pass
		elif !velocity.is_zero_approx():
			_animation_player.play("walk_" + facing)
			pass
		
	


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
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	#get_tree().reload_current_scene()
	print("you died!")
func shoot():
	var projectile_clone = projectile_original.instantiate()
	
	projectile_clone.global_position = position + offset
	
	projectile_clone.set_direction(facing)
	
	get_tree().get_root().add_child(projectile_clone)

	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		in_range = true
		current_enemy = body
		print("near enemy")
	pass 


func _on_melee_body_exited(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		in_range = false
		current_enemy = null

func _process(_delta: float) -> void:
	if current_enemy != null and is_attacking and in_range:
		if attack_timer > 0:
			#current_enemy.queue_free()
			current_enemy.change_health(-2)
