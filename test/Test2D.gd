extends Sprite

const SmoothLookAt2D = preload("res://smoothlookat2d.gd")

func _process(_delta):
	SmoothLookAt2D.SmoothLookAt(self, get_global_mouse_position(), _delta)
