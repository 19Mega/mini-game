extends CharacterBody2D

var speed = 300.0
var direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.flip_h = true
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.flip_h = false
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	if direction.length() > 0:
		direction = direction.normalized()

	#print("direction: ", direction)
	# Mover al personaje
	velocity = direction * speed
	move_and_slide()
