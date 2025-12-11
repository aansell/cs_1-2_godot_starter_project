extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	pass
	if body.name == "Player":
		body.change_coins(1)
		queue_free()
	
	
	
	
	
	
	
