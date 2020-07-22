# This can't be a tool script because the physics server is not running in the editor.
extends RigidBody

const SmoothLookAt3D = preload("res://smoothlookat3d.gd")

export(NodePath) var target

func _integrate_forces(_state):
	var target_node = get_node(target)
	SmoothLookAt3D.SmoothLookAtRigid(self, target_node.transform.origin, 1)
