#==================================================
# SmoothLookAt Function
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

static func SmoothLookAt( nodeToTurn, targetPosition, turnSpeed ):
	nodeToTurn.rotate( deg2rad( AngularLookAt( nodeToTurn.global_position, nodeToTurn.global_rotation, targetPosition, turnSpeed ) ) )
static func SmoothLookAtRigid( nodeToTurn, targetPosition, turnSpeed ):
	nodeToTurn.angular_velocity = AngularLookAt( nodeToTurn.global_position, nodeToTurn.global_rotation, targetPosition, turnSpeed )

#-------------------------
# these are only called from above functions
static func AngularLookAt( currentPosition, currentRotation, targetPosition, turnTime ):
	return GetAngle( currentRotation, TargetAngle( currentPosition, targetPosition ) )/turnTime
static func TargetAngle( currentPosition, targetPosition ):
	return (targetPosition - currentPosition).angle()
static func GetAngle( currentAngle, targetAngle ):
	return fposmod( targetAngle - currentAngle + PI, TAU ) - PI
