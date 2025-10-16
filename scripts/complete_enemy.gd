extends CharacterBody2D

# TODO: Extend your enum from Lesson 8 to include ATTACK state
# Look at "Understanding Enums" documentation
# You need IDLE, PATROL, CHASE, and ATTACK states
func on_body_entered(body):
	pass
# TODO: Add all your variables from Lesson 8
# State tracking, timers, patrol variables, player reference, chase distances

# TODO: Add new variables for attack behavior  
# Look at "Attack Timing and Cooldowns" documentation
# You need: attack distance, attack damage, attack timing variables

func _ready():
	# TODO: Set up starting conditions like in Lesson 8
	# Initialize all your variables and get player reference
	pass

func _physics_process(_delta):
	# TODO: Handle current state behavior for all four states
	# Look at "Organizing State Behavior" documentation
	# IDLE, PATROL, CHASE, and ATTACK all need different behaviors
	
	# TODO: Calculate distance to player
	# Look at "Distance Calculations" documentation
	
	# TODO: Update state based on multiple distance ranges
	# Look at "Multiple Distance Ranges" and "Complex State Switching" documentation
	# You need attack range, chase range, and patrol/detection range
	
	# TODO: Update attack timers
	# Look at "Attack Timing and Cooldowns" documentation
	pass

# TODO: Create state handler functions for all four states
# handle_idle_state, handle_patrol_state, handle_chase_state, handle_attack_state
# Look at "Attack Implementation Patterns" documentation for attack state

# TODO: Create attack function
# Look at "Calling Functions on Other Objects" documentation  
# This should call the player's change_health function with negative damage

# TODO: Add comprehensive debug print statements
# Print current state, distance to player, attack timers, etc.
