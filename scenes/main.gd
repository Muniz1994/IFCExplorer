extends Node3D

var output: Array[String] = []

var model_data: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	load_model()
	load_model_data()
	
func spawn_player():
	# load scene
	# Calculate spawn place
	# Instatiate 
	pass
	
func load_model() -> void:
	
	# Load an existing glTF scene.
	# GLTFState is used by GLTFDocument to store the loaded scene's state.
	# GLTFDocument is the class that handles actually loading glTF data into a Godot node tree,
	# which means it supports glTF features such as lights and cameras.
	var gltf_document_load = GLTFDocument.new()
	var gltf_state_load = GLTFState.new()
	var error = gltf_document_load.append_from_file(GlobalProps.gltf_file_path, gltf_state_load)
	if error == OK:
		var gltf_scene_root_node = gltf_document_load.generate_scene(gltf_state_load)
		add_child(gltf_scene_root_node)
		
		# Create the collision objects to make the model walkable and interactable
		for i in gltf_scene_root_node.get_children():
			for y in i.get_children():
				var mesh_name = y.name.split(GlobalProps.name_split)
				if mesh_name.size() > 1:
					if mesh_name[1] in GlobalProps.collidable_types:
						var StaticBody = StaticBody3D.new()
						
						# Layer for the interaction
						if mesh_name[1] in GlobalProps.interactable_types:
							StaticBody.set_collision_layer_value(4,true) 
						# Layer for the collision
						StaticBody.set_collision_layer_value(1,true)
						
						var Collider = CollisionShape3D.new()
						var meshShape = y.mesh.create_trimesh_shape()
						Collider.shape = meshShape
						Collider.name = y.name
						StaticBody.add_child(Collider)
							
						y.add_child(StaticBody)
					if mesh_name[1] in GlobalProps.excluded_types:
						y.queue_free()
					
	else:
		print("Couldn't load glTF scene (error code: %s)." % error_string(error))
		
func load_model_data() -> void:
	
	var json_as_text = FileAccess.get_file_as_string(GlobalProps.model_data_file_path)
	
	var json_dict = JSON.parse_string(json_as_text)
	
	GlobalProps.model_data = json_dict
	
