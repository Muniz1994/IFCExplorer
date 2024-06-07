extends RayCast3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if self.is_colliding():
		
		var obj = self.get_collider()
		
		#$InteractUI.show()
		
		GlobalProperties._aim_color = Color(0.639,0.204,0.545)
		
		GlobalProperties._console_text = str(GlobalProperties._model_data[obj.get_parent().name.split(GlobalProperties.NAME_SPLIT_STRING)[0]]) 
		
		if Input.is_action_just_pressed("interact"):
			if obj.has_method("interact"):
				obj.interact()
		
	else:
		GlobalProperties._console_text = ""
		#$InteractUI.hide()
		GlobalProperties._aim_color = Color(1,1,1)
