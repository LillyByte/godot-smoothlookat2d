#tool
extends Spatial

const SmoothLookAt3D = preload("res://smoothlookat3d.gd")

export(NodePath) var target

func _process(_delta):
	var target_node = get_node(target)
	SmoothLookAt3D.SmoothLookAt(self, target_node.transform.origin, _delta)
