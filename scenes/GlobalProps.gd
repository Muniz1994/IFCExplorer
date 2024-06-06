extends Node

var ifc_file_path: String = ""

var gltf_file_path: String = ""

var model_data_file_path: String = ""

var model_data: Dictionary

var collidable_types: Array[String] = [
	"IfcSite",
	"IfcWall",
	"IfcSlab",
	"IfcWallStandardCase",
	"IfcRailing",
	"IfcStair",
	"IfcStairFlight",
	"IfcCovering"
]

var interactable_types: Array[String] = [
	"IfcWall",
	"IfcSlab",
	"IfcWallStandardCase",
	"IfcRailing",
	"IfcStair",
	"IfcStairFlight",
	"IfcCovering"
]

var excluded_types: Array[String] = [
	"IfcBuildingElementProxy",
	"IfcAnnotation",
	"IfcGrid"
]

var name_split: String = "_$_"

var aim_color: Color = Color(1,1,1)

var console_text: String = ""
