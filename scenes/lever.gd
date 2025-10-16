extends Area2D
@onready var radius: CollisionShape2D = $Area2D/radius

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var in_range = false
var on = false
var player
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_select")and in_range == true:
		on=true
		animated_sprite_2d.play("on")
		print("lever on")
	if Input.is_action_just_pressed("ui_select")and in_range == false:
		print("lever on")
		on=false
		animated_sprite_2d.play("on")
func _on_body_entered(body: Area2D):
	if body.name == "Player":
		in_range = true
