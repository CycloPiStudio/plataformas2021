extends KinematicBody2D

const GRAVITY = 200.0
const WALK_SPEED = 200
var direccion 
var velocity = Vector2()
func _ready():
	direccion = "left"
func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if direccion == "left":
		velocity.x = -WALK_SPEED
	elif direccion =="right":
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	if $RayIzquierda.is_colliding() == false :
		direccion = "right"
	elif $RayDerecha.is_colliding() == false :
		direccion = "left"
	else:
		pass
		
	
	# We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.

	# The second parameter of "move_and_slide" is the normal pointing up.
	# In the case of a 2D platformer, in Godot, upward is negative y, which translates to -1 as a normal.
	move_and_slide(velocity, Vector2(0, -1))
