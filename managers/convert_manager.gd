extends Node

var _convert_screen_path = "res://load_screen/convert_screen_ifc.tscn"
var _convert_screen = load(_convert_screen_path)
var _ifc_file_path: String


func convert_process(ifc_path:String) -> void:
	_ifc_file_path = ifc_path
	
	var new_convert_screen = _convert_screen.instantiate()
	get_tree().root.add_child(new_convert_screen)
	
	await Signal(new_convert_screen,"convert_screen_has_full_coverage")
	
	convert_model(_ifc_file_path)
	
	new_convert_screen._start_outro_animation()
	
	
func convert_model(ifc_file_path: String) -> void:
	var output: Array[String] = []
	OS.execute("modelreader/IfcToGlftWin.exe",[ifc_file_path],output,true,false)
	print(output)
	GlobalProps.gltf_file_path = Global.change_extension(ifc_file_path, ".gltf")
	GlobalProps.model_data_file_path = Global.change_extension(ifc_file_path, ".json")
			
