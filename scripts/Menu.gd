extends Control

@onready var load_file_dialog = $VBoxContainer/LoadFile

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_load_file_button_pressed():
	load_file_dialog.visible = true
	


func _on_load_file_file_selected(path):
	 # Replace with function body.
	await ConvertManager.convert_process(path)
	LoadManager.load_scene("res://scenes/main.tscn") # Replace with function body.


