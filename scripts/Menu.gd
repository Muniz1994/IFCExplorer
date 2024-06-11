extends Control

@onready var load_file_dialog = $VBoxContainer/LoadFile
@onready var load_gltf_dialog = $VBoxContainer/LoadGltf

func _on_load_file_button_pressed() -> void:
	load_file_dialog.visible = true
	
func _on_load_file_file_selected(path: String) -> void:
	 # Replace with function body.
	await GlobalFunctions._convert_process(path)
	
	LoadManager._load_scene("res://scenes/main.tscn") # Replace with function body.


func _on_load_gltf_button_pressed():
	load_gltf_dialog.visible = true


func _on_load_gltf_file_selected(path):
	if path:
		GlobalProperties._gltf_file_path = path
		
		GlobalProperties._model_data_file_path = GlobalFunctions._change_extension(path, ".json")
		
		LoadManager._load_scene("res://scenes/main.tscn") # Replace with function body.
	else:
		pass
