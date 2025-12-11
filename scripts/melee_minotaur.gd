extends CharacterBody2D

var projectile_original = preload("res://scenes/arrow.tscn")
var in_range = false
var chasing = false
var attacking = false
var timer = 0.67
var melee_timer = 1
var direction
var speed = 225
var facing = "down"
var maxHealth = 10
var health = maxHealth
@onready var player: CharacterBody2D = %Player



@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if abs(position.x - player.position.x) > abs(position.y - player.position.y):
		if position.x > player.position.x:
			facing = "left"
		else:
			facing = "right"
	else:
		if position.y > player.position.y:
			facing = "up"
		else:
			facing = "down"
	if in_range:
		sprite.play("crossbow_shoot_" + facing)
		timer -= delta
	if timer < 0:
		shoot()
		timer = 0.67
		print("in range")
	if chasing and !attacking:
		sprite.play("walk_" + facing)
		direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
	if chasing and attacking:
		sprite.play("attack_" + facing)
		melee_timer -= delta
	if melee_timer < 0:
		player.change_health(-3)
		melee_timer = 1
	if !in_range and !chasing and !attacking:
		sprite.play("idle_" + facing)


func _on_melee_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		attacking = true
		pass # Replace with function body.


func _on_melee_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		attacking = false
		
		pass # Replace with function body.




func _on_chase_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		chasing = true
		in_range = false
		pass # Replace with function body.


func _on_chase_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		chasing = false
		in_range = true
		
		pass # Replace with function body.




func _on_range_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_range = true
		pass # Replace with function body.


func _on_range_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_range = false
		pass # Replace with function body.

func shoot():
	
	var projectile_clone = projectile_original.instantiate()
	
	projectile_clone.global_position = position
	
	projectile_clone.set_direction(player.position)
	
	get_tree().get_root().add_child(projectile_clone)


func change_health(_amount:int):
		health += _amount
		if health < 1:
			queue_free()
		if health > maxHealth:
			health = maxHealth
		print("Enemy Health: ", health)
