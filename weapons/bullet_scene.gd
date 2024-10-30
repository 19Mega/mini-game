extends Area2D

@export var speed: float = 400.0
var direction: Vector2 

func setup(new_direction: Vector2):
	direction = new_direction
	rotation = direction.angle()

# Movimiento del proyectil
func _physics_process(delta):
	position += direction * speed * delta

# Revisa colisiones
func _on_body_entered(body):
	print("Colisión con: ", body)
	if body.has_method("apply_damage"):
		body.apply_damage(50)
		queue_free()  # Destruye el proyectil después del impacto


func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
