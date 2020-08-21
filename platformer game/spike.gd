extends Area2D



func _on_spike_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
