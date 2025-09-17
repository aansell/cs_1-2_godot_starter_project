extends Node
func _on_body_entered(body):
	# TODO: Check if the object that touched the coin is the player
	if body.name == "player":
		# TODO: Print a message when the coin is collected
		print("coin collected")
		# TODO: Remove the coin from the game
		self.queue_free()
	
