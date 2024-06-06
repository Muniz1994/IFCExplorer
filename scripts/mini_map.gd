extends Camera3D


@export  var target: NodePath

@onready var player = $"../../../../WorldEnvironment/Player/Player"

func _process(_delta:float) ->void:
	self.global_position = Vector3(player.global_position.x,player.global_position.y+1.2,player.global_position.z)
