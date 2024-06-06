extends Camera3D


@export  var target: NodePath

@onready var player = $"../../../../WorldEnvironment/Player/Player"

#func _process(delta:float) ->void:
	#self.translate(Vector3(0,20,0))
