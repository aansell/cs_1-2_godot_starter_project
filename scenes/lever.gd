extends Area2D
var is_on = false
var in_range = false

#func update_animation():
	

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
	if Input.is_action_pressed("ui_accept"):
		if in_range:
			is_on = true
			print("is on")
	elif not in_range:
			is_on = false
	
