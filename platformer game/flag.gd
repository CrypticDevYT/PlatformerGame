extends Area2D




func _on_flag_body_entered(body):
	if body.has_method("win"):
		body.changelvl()
		body.win()
		
