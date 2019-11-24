#==================================================
# SmoothLookAt Function
#==================================================
#    for RigidBody2D -> Call SmoothLookAt from integrate_forces()
#    for KinematicBody2D -> Call SmoothLookAt from _physics_process()
#    for Node2D -> Call SmoothLookAt from _process()
#    ----------
#    nodeToTurn = the node you want to turn
#    targetPosition = the Vector2 you want your nodeToTurn to face
#    turnSpeed = how quickly nodeToTurn will turn to face the direction you want it to face
#    ----------
#    X+ is assumed to be forward, the face/nose of your object

func SmoothLookAt( nodeToTurn, targetPosition, turnSpeed ):
	if nodeToTurn is KinematicBody2D or nodeToTurn is Node2D:
		nodeToTurn.rotate( deg2rad( AngularLookAt( nodeToTurn.global_position, nodeToTurn.global_rotation, targetPosition, turnSpeed ) ) )
	elif nodeToTurn is RigidBody2D:
		nodeToTurn.angular_velocity = AngularLookAt( nodeToTurn.global_position, nodeToTurn.global_rotation, targetPosition, turnSpeed )

#-------------------------
# these are only called from above functions
func AngularLookAt( currentPosition, currentRotation, targetPosition, turnTime ):
	return GetAngle( currentRotation, TargetAngle( currentPosition, targetPosition ) )/turnTime
func TargetAngle( currentPosition, targetPosition ):
	return (targetPosition - currentPosition).angle()
func GetAngle( currentAngle, targetAngle ):
	return fposmod( targetAngle - currentAngle + PI, PI * 2 ) - PI
