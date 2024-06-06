extends CanvasLayer


signal convert_screen_has_full_coverage

@onready var animationPlayer : AnimationPlayer = $AnimationPlayer

	
func _start_outro_animation() -> void:
	await Signal(animationPlayer, "animation_finished")
	animationPlayer.play("end_load")
	$TextureRect.queue_free()
	$Label.queue_free()
	await Signal(animationPlayer, "animation_finished")
	self.queue_free()
