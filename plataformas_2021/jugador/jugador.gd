extends KinematicBody2D

export (int) var speed = 1200
export (int) var jump_speed = -1800
export (int) var gravity = 4000
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25
var velocity = Vector2.ZERO

func get_input():
	var dir = 0
	if Input.is_action_pressed("ui_right"):
		dir += 1
	if Input.is_action_pressed("ui_left"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
	animar(velocity.x)

func animar(velo):
	if velo<0:
		$AnimationPlayer.play("caminar_izquierda")
	elif velo>0:
		$AnimationPlayer.play("caminar_derecha")
	else:
		pass				
#func _physics_process(delta):
#	get_input()
#	velocity.y += gravity * delta
#	velocity = move_and_slide(velocity, Vector2.UP)
#	if Input.is_action_just_pressed("ui_select"):
#		if is_on_floor():
#			velocity.y = jump_speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	var snap = Vector2.DOWN * 16 if is_on_floor() else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP)
	if Input.is_action_just_pressed("ui_select"):
		if is_on_floor():
			velocity.y = jump_speed
#extends KinematicBody2D
#
#export (int) var run_speed = 400
#export (int) var jump_speed = -900
#export (int) var gravity = 2000
#
#var velocity = Vector2()
#var jumping = false
#
#func get_input():
#	velocity.x = 0
#	var right = Input.is_action_pressed('ui_right')
#	var left = Input.is_action_pressed('ui_left')
#	var jump = Input.is_action_just_pressed('ui_select')
#
#	if jump and is_on_floor():
#		jumping = true
#		velocity.y = jump_speed
#	if right:
#		velocity.x += run_speed
#	if left:
#		velocity.x -= run_speed
#
#func _physics_process(delta):
#	get_input()
#	velocity.y += gravity * delta
#	if jumping and is_on_floor():
#		jumping = false
#	velocity = move_and_slide(velocity, Vector2(0, -1))
#
func _on_Area2D_body_entered(body):
	print(body)

