extends CharacterBody2D

# TODO: Extend your enum from Lesson 7 to include CHASE state
# Look at "Understanding Enums" documentation
# You need IDLE, PATROL, and CHASE states

# TODO: Add all your variables from Lesson 7
# State tracking, timer variables, patrol variables

# TODO: Add new variables for distance-based behavior
# Look at "Getting References to Other Objects" documentation
# You need: player reference, chase distance values, chase speed

func _ready():
	# TODO: Set up starting conditions like in Lesson 7
	# Plus: Get reference to player object
	# Look at "Getting References to Other Objects" documentation
	pass

func _physics_process(delta):
	# TODO: Handle current state behavior
	# Look at "Organizing State Behavior" documentation
	# Now you need to handle IDLE, PATROL, and CHASE states
	
	# TODO: Calculate distance to player
	# Look at "Distance Calculations" documentation
	
	# TODO: Update state based on both timers AND distance
	# Look at "Combining Multiple Conditions" documentation
	pass

# TODO: Create state handler functions
# You'll need handle_idle_state, handle_patrol_state, handle_chase_state
# Look at "Moving Toward Targets" documentation for chase behavior

# TODO: Add debug print statements
# Print current state AND distance to player so you can see what's happening
