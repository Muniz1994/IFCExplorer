extends RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if self.is_colliding():
		
		var obj = self.get_collider()
		
		#$InteractUI.show()
		
		GlobalProps.aim_color = Color(0.639,0.204,0.545)
		
		if Input.is_action_just_pressed("interact"):
			if obj.has_method("interact"):
				obj.interact()
		
	else:

		#$InteractUI.hide()
		GlobalProps.aim_color = Color(1,1,1)
