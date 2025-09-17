extends Node
func _on_body_entered(body):
	# TODO: Check if the object that touched the coin is the player
	if body.name == "Player":
		# TODO: Print a message when the coin is collected
	
		# TODO: Remove the coin from the game
		body.change_coins(1)
		queue_free()
	
