# godot-smoothlookat2d

NOTICE! There is also a 3D version of the script here too!

This is a simple script for turning RigidBody2Ds/RigidBodies, KinematicBody2Ds/KinematicBodies, and Node2D/Spatials to smoothly turn to look at object over time using the shortest possible angle (rotating left or right). 3D Objects can be set to orient their up axis.

If used on a rigid body, it is best called from integrate_forces.
If used on a kinematic body, it is best called from _physics_process.
If used on a Node2D or Spatial, it is best called from _process.  

How To Use:

     Add the smoothlookat2d.gd to your AutoLoad (Projects->Project Settings->AutoLoad) and then call as needed.

     Example for KinematicBody2D/Node2D:
          smoothlookat2d.SmoothLookAt( self, Vector2( 0, 0 ), 2.0 )
     Example for RigidBody2D
          smoothlookat2d.SmoothLookAtRigid( self, Vector2( 0, 0 ), 2.0 )
          
     For 3D, add the smoothlookat3d.gd to your AutoLoad.


      
