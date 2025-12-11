extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var is_on = false
var in_range = false
@onready var player: CharacterBody2D = %Player



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_range = true
		print("in range =", is_on)
	pass 


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_range = false
	pass 

func _physics_process(_delta):
	if Input.is_action_pressed("ui_filedialog_show_hidden") and in_range:
		if is_on == true:
			is_on = false
			player.lever3 = false
			animated_sprite_2d.play("on")
		elif is_on == false:
			is_on = true
			player.lever3 = true
			animated_sprite_2d.play("off")
