# godot-smoothlookat2d
This is a simple script for turning RigidBody2Ds, KinematicBody2Ds, and Node2Ds to smoothly turn to look at object over time using the shortest possible angle (rotating left or right).

If used on a RigidBody2D, it is best called from integrate_forces.
If used on a KinematicBody2D, it is best called from _physics_process.
If used on a Node2D, it is best called from _process.  

How To Use:

     Add the smoothlookat2d.gd to your AutoLoad (Projects->Project Settings->AutoLoad) and then call as needed.

     Example for KinematicBody2D/Node2D:
          smoothlookat2d.SmoothLookAt( self, Vector2( 0, 0 ), 2.0 )
     Example for RigidBody2D
          smoothlookat2d.SmoothLookAtRigid( self, Vector2( 0, 0 ), 2.0 )


      
