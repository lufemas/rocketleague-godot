extends Camera

func _physics_process(delta):
	look_at(get_parent().get_node("Ball").translation, Vector3.UP)
	
	translation = ( get_parent().get_node("VehicleBody").translation + 
	get_parent().get_node("VehicleBody").translation.direction_to(get_parent().get_node("Ball").translation).normalized()*
	Vector3(-10,0,-10))
	
	translation.y = 5
