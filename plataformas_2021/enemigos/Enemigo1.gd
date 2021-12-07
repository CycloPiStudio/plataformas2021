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
	
	animacion(direccion)
	movimiento()
func animacion(di):
	if  di == "left":
		$AnimationPlayer.play("andar_izquierda")
	elif  di == "right":
		$AnimationPlayer.play("andar_derecha")
	else :
		pass
			
	
	# We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.

	# The second parameter of "move_and_slide" is the normal pointing up.
	# In the case of a 2D platformer, in Godot, upward is negative y, which translates to -1 as a normal.
	velocity = move_and_slide(velocity, Vector2(0, -1))

func movimiento():
	if $RayDer.is_colliding() or not $RayDerecha.is_colliding():
#		print("ver collider der", $RayDer.is_colliding())
		direccion = "left"
	elif $RayIzq.is_colliding() or not $RayIzquierda.is_colliding():
#		print("v er collider izq", $RayIzq.is_colliding() )
		direccion = "right"
	
		
