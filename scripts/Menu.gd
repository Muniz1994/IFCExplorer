extends Control

@onready var load_file_dialog = $VBoxContainer/LoadFile

func _on_load_file_button_pressed() -> void:
	load_file_dialog.visible = true
	
func _on_load_file_file_selected(path: String) -> void:
	 # Replace with function body.
	await GlobalFunctions._convert_process(path)
	
	LoadManager._load_scene("res://scenes/main.tscn") # Replace with function body.


