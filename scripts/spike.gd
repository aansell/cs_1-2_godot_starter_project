extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	pass

func _on_body_entered(body):
	if body.name == "Player":
		body.change_health(-2)
	pass
	
