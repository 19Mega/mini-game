extends CharacterBody2D

var speed = 100
var player_chase = false
var player = null
var health = 100

func _physics_process(delta):
	if player_chase:
		var direction = (player.position - position).normalized()
		velocity = direction * speed
		move_and_slide() # Usa el sistema de físicas en lugar de modificar position directamente

		$AnimatedSprite2D.play('walk')
		if(velocity.x < 0):
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play('idle')
	
func apply_damage(amount: int):
	print("ESTOY EN APPLY DMG")
	health -= amount
	if health <= 0:
		die()
		
func die():
	$AnimatedSprite2D.play('die')
	queue_free()

func _on_area_2d_body_entered(body):
	print("hola: ", body.name)
	if body.name == "player_scene" :
		player = body
		player_chase = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("player_scene"):
		player = null
		player_chase = false
