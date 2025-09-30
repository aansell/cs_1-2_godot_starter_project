extends CharacterBody2D


func _ready():
	_on_area_2d_body_entered.connect(_on_area_2d_body_entered)
	pass

func _process(delta: float) -> void:
	pass


	


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
