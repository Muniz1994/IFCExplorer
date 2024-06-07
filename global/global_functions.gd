extends Node

var current_scene: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var root = get_tree().root
	
	current_scene = root.get_child(root.get_child_count() - 1)
	
func _goto_scene(path: String) -> void:
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:
	call_deferred("_deferred_goto_scene", path)
	
	
func _deferred_goto_scene(path: String) -> void:
	# It is now safe to remove the current scene.
	current_scene.queue_free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene
	
func _change_extension(file_path:String, extension:String) -> String:
	
	if file_path.ends_with(".ifc"):
		return file_path.substr(0, file_path.length() - 4) + extension
	else:
		return file_path
		
func _convert_process(ifc_path:String) -> void:
	
	GlobalProperties._ifc_file_path = ifc_path
	
	var new_convert_screen = GlobalProperties._convert_screen.instantiate()
	
	get_tree().root.add_child(new_convert_screen)
	
	await Signal(new_convert_screen,"convert_screen_has_full_coverage")
	
	_convert_model(GlobalProperties._ifc_file_path)
	
	new_convert_screen._start_outro_animation()
	
	
func _convert_model(ifc_file_path: String) -> void:
	
	OS.execute("modelreader/IfcToGlftWin.exe",[ifc_file_path],GlobalProperties._ifc_converter_output,true,true)
	
	GlobalProperties._gltf_file_path = _change_extension(ifc_file_path,".gltf")
	
	GlobalProperties._model_data_file_path = _change_extension(ifc_file_path, ".json")
	
