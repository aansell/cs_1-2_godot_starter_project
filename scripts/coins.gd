extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	pass
	# TODO: Check if the object that touched the coin is the player
	if body.name == "Player":
		body.change_coins(1)
		queue_free()
	
	
	# TODO: Print a message when the coin is collected
	
	
	
	# TODO: Remove the coin from the game
	
	
