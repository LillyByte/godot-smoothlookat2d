extends RigidBody2D

const SmoothLookAt2D = preload("res://smoothlookat2d.gd")

func _integrate_forces(_state):
	SmoothLookAt2D.SmoothLookAtRigid(self, get_global_mouse_position(), 1)
