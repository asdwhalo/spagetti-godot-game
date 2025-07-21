class_name fps_counter
extends Label

func _process(delta: float) -> void:
  text += "fps: %s"%[ Engine.get_frames_per_second() ]
