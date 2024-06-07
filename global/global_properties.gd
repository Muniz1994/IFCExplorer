extends Node

# Consts -----------------------------------------------------------------------
 
const COLLIDABLE_TYPES: Array[String] = [
	"IfcSite",
	"IfcWall",
	"IfcSlab",
	"IfcWallStandardCase",
	"IfcRailing",
	"IfcStair",
	"IfcStairFlight",
	"IfcCovering"
]

const INTERACTABLE_TYPES: Array[String] = [
	"IfcWall",
	"IfcSlab",
	"IfcWallStandardCase",
	"IfcRailing",
	"IfcStair",
	"IfcStairFlight",
	"IfcCovering"
]

const EXCLUDED_TYPES: Array[String] = [
	"IfcBuildingElementProxy",
	"IfcAnnotation",
	"IfcGrid"
]

const NAME_SPLIT_STRING: String = "_$_"

# Variables --------------------------------------------------------------------

var _ifc_file_path: String = ""

var _gltf_file_path: String = ""

var _model_data_file_path: String = ""

var _model_data: Dictionary

var _aim_color: Color = Color(1,1,1)

var _console_text: String = ""

var _ifc_converter_output: Array[String] = []

var _convert_screen = load("res://load_screen/convert_screen_ifc.tscn")
