extends CharacterBody2D

var speed
var health


var projectile_original = preload("res://scenes/enemy_arrow.tscn")

var melee = false
var chase = false
var ranged = false

var player 
var shot_timer = 1
var timer = shot_timer



func _ready():
	pass
	
func _process(delta):
	timer-=delta
	
	
	if ranged:
		print("in arrow range")
		if timer<0:
			shoot()
			timer = shot_timer
	elif !ranged and chase:
		print("chase the player")
	



func _on_melee_body_entered(body):
	if body.name == "Player":
		chase = false
		melee = true
		

func _on_melee_body_exited(body):
	if body.name == "Player":
		chase = true
		melee = false


func _on_chase_body_entered(body):
	if body.name == "Player":
		chase = true
		ranged = false

func _on_chase_body_exited(body):
	if body.name == "Player":
		chase = false
		ranged = true


func _on_ranged_body_entered(body):
	if body.name == "Player":
		player = body
		ranged = true


func _on_ranged_body_exited(body):
	if body.name == "Player":
		ranged = false


func shoot():
	# TODO: Create a new projectile instance
	var projectile_clone = projectile_original.instantiate()
	
	# TODO: Set projectile position to player position
	projectile_clone.global_position = position
	
	#TODO: change sprite direction based on position reletive to the target
	
	# TODO: Set projectile direction using facing variable
	projectile_clone.set_direction(player.position)
	
	# TODO: Add projectile to the game world
	get_tree().get_root().add_child(projectile_clone)

	pass
