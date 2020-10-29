extends VehicleBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var jumpCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
#	print(engine_force)

	
	$octane.get_surface_material(5).emission_energy = linear_velocity.length() *.2
	if Input.is_action_pressed("ui_accelerate"):
		set_engine_force(17)
	elif Input.is_action_pressed("ui_brake"):
		set_engine_force(-17)		
	else:
		set_engine_force(0)
		
#	if Input.is_action_pressed("ui_left") && steering < .7:
#		set_steering(steering + 0.05)
#
#	if Input.is_action_pressed("ui_right") && steering > - .7:
#		set_steering(steering - 0.05)	
		
		
	if Input.is_action_pressed("ui_left"):
		set_steering(.5)	
	elif Input.is_action_pressed("ui_right"):
		set_steering(-.5)		
	else:
		set_steering(0)		
		
	
	print(jumpCount)
	
	print($VehicleWheel.is_in_contact())
	print($VehicleWheel2.is_in_contact())
	print($VehicleWheel3.is_in_contact())
	print($VehicleWheel4.is_in_contact())
		
#	$VehicleWheel.get_node("CSGMesh").rotation.z -= (linear_velocity.length() / 60)	* (engine_force/engine_force)
	
#	print(linear_velocity.length())
		
		
	if Input.is_action_just_pressed("ui_jump"):
		if jumpCount == 0:
			apply_impulse(Vector3(0,0,0), Vector3(0,17,0))	
			jumpCount = 1	
		elif jumpCount == 1:
			apply_impulse(Vector3(-.2,0,0), Vector3(0,15,0))	
			jumpCount = 2		
			
	elif ( 
		$VehicleWheel.is_in_contact() ||	
		$VehicleWheel2.is_in_contact() || 
		$VehicleWheel3.is_in_contact() || 
		$VehicleWheel4.is_in_contact()
		) && linear_velocity.y < 0:
		jumpCount = 0		


func _input(event):

	pass

func carControl():
	pass
