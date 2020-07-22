extends Sprite

const SmoothLookAt2D = preload("res://smoothlookat2d.gd")

func _process(delta):
	SmoothLookAt2D.SmoothLookAt(self, Vector2(200, 0), 1)
