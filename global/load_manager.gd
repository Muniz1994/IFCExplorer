extends Node

signal load_started
signal progress_changed(progress)
signal load_done

var _load_screen_path = "res://load_screen/loading_screen_ifc.tscn"
var _load_screen = load(_load_screen_path)
var _loaded_resource: PackedScene
var _scene_path: String
var _progress: Array = []
var use_sub_treads: bool = true

func _load_scene(scene_path:String) -> void:
	_scene_path = scene_path
	
	var new_loading_screen = _load_screen.instantiate()
	get_tree().root.add_child(new_loading_screen)
	
	self.progress_changed.connect(new_loading_screen._update_progress_bar)
	
	self.load_done.connect(new_loading_screen._start_outro_animation)
	
	await Signal(new_loading_screen, "loading_screen_has_full_coverage")

	_start_load()
	
func _start_load() -> void:
	var state = ResourceLoader.load_threaded_request(_scene_path,"",use_sub_treads)
	
	if state == OK:
		set_process(true)

func _process(_delta):
	var load_status = ResourceLoader.load_threaded_get_status(_scene_path, _progress)
	match load_status:
		0, 2:
			set_process(false)
			return
		1:
			emit_signal("load_started")
			emit_signal("progress_changed", _progress[0])
		3:
			_loaded_resource = ResourceLoader.load_threaded_get(_scene_path)
			emit_signal("progress_changed", 1.0)
			emit_signal("load_done")
			get_tree().change_scene_to_packed(_loaded_resource)
			
