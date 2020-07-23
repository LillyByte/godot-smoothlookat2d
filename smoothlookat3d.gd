#==================================================
# SmoothLookAt Function (3D)
#==================================================
#    SmoothLookAtRigid -> Call from integrate_forces()
#    SmoothLookAt for KinematicBody2D -> Call from _physics_process()
#    SmoothLookAt for Node2D -> Call from _process()
#    ----------
#    nodeToTurn = the node you want to turn
#    targetPosition = the target position (Vector2) you want your nodeToTurn to face
#    turnSpeed = how long it will take nodeToTurn to face the direction you want it to face
#    ----------
#    X+ is assumed to be forward, the face/nose of your object
tool

static func SmoothLookAt( nodeToTurn, targetPosition, turnSpeed ):
	var transf = Transform(Basis(), nodeToTurn.global_transform.origin).looking_at(targetPosition, Vector3.UP)
	nodeToTurn.global_transform = nodeToTurn.global_transform.interpolate_with(transf, turnSpeed)

static func SmoothLookAtRigid( nodeToTurn, targetPosition, turnSpeed, oriented = true ):
	var forward = nodeToTurn.transform.basis.z * -1
	var to = nodeToTurn.transform.origin.direction_to(targetPosition)
	var rotation_quat = Quat(forward.cross(to).normalized(), forward.angle_to(to))
	
	var spin = Quat()
	if oriented:
		var spin_orientation_euler = nodeToTurn.transform.basis.get_euler()
		spin_orientation_euler.z = 0
		var spin_orientation_desired = Quat(spin_orientation_euler)
		var from = nodeToTurn.transform.basis.xform(Vector3.UP)
		var to2 = spin_orientation_desired.xform(Vector3.UP)
		if from != to2:
			spin = Quat(from.cross(to2).normalized(), from.angle_to(to2))
	
	nodeToTurn.angular_velocity = (rotation_quat * spin).get_euler() * turnSpeed

static func ApplyLocalImpulse ( node: RigidBody, impulse ):
	node.apply_impulse(Vector3.ZERO, node.global_transform.xform(impulse))

static func ApplyLocalImpulsePosition ( node: RigidBody, impulse, position ):
	node.apply_impulse(node.global_transform.xform(position), node.global_transform.xform(impulse))

static func ApplyLocalTorqueImpulse ( node: RigidBody, impulse ):
	node.apply_torque_impulse(node.global_transform.xform(impulse))

static func ApplyLocalForce ( node: RigidBody, force ):
	node.add_force(node.global_transform.xform(force), Vector3.ZERO)

static func ApplyLocalForcePosition ( node: RigidBody, force, position ):
	node.add_force(node.global_transform.xform(force), node.global_transform.xform(position))
