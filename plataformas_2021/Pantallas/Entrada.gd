extends Node2D


# Declare member variables here. Examples:
# var a = 2
var cont = 0


# Called when the node enters the scene tree for the first time.
func _ready():

	cont += 1
	$animaentrada/Timer.start()
	pass #
	


func _on_Timer_timeout():
	
	if cont == 1:
		$animaentrada/Audio1.play()
		$animaentrada/Sprite0.show()
		$animaentrada/Sprite1.show()
		cont += 1
	elif cont ==2:
		$animaentrada/Audio2.play()
		
		cont += 1
	elif cont ==3:
		$animaentrada/Audio3.play()
		$animaentrada/Sprite3.show()
		cont += 1
	elif cont ==4:
		$animaentrada/Audio4.play()
		$animaentrada/Sprite4.show()
		cont += 1
	elif cont ==5:
		$animaentrada/Audio5.play()
		$animaentrada/Sprite5.show()
		cont += 1

	print(cont)
	pass # Replace with function body.


func _on_Audio1_finished():
	$animaentrada/Timer.start()
	pass # Replace with function body.


func _on_Audio2_finished():
	$animaentrada/Timer.start()
	$animaentrada/Sprite1.hide()
	pass # Replace with function body.


func _on_Audio3_finished():
	$animaentrada/Timer.start()
	$animaentrada/Sprite3.hide()
	pass # Replace with function body.

func _on_Audio4_finished():
	$animaentrada/Timer.start()
	$animaentrada/Sprite4.hide()
	pass # Replace with function body.

func _on_Audio5_finished():
	$animaentrada/Timer.start()
	$animaentrada/Sprite5.hide()
	pass # Replace with function body.

