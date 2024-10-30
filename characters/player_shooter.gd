extends Node2D
#const BULLET_SCENE = preload("res://bullet_scene.tscn")
const BULLET_SCENE = preload("res://weapons/bullet_scene.tscn")


var shoot_direction = Vector2.RIGHT  
# HAY QUE INSTANCIAR Y INSERTARLO EN LA ESCENA PRINCIPAL, UNA VEZ POR CADA PROYECTIL
func shoot() -> void:
	var projectile_instance = BULLET_SCENE.instantiate()
	projectile_instance.global_position = global_position
	print("Bullet initial position:", projectile_instance.global_position)
	projectile_instance.setup(shoot_direction)
	
	# Obtiene la escena principal actual
	var root = get_tree().current_scene
	if root:
		print("Escena principal obtenida correctamente:", root.name)
		root.call_deferred("add_child", projectile_instance)  # Agrega el proyectil de forma diferida
	else:
		print("Error: No se pudo obtener la escena principal.")
		

@export var radius: float = 50.0  # Distancia desde el personaje para el spawn del proyectil
func shoot_random():
	# Genera un ángulo aleatorio entre 0 y 2π (360 grados)
	var random_angle = randf() * TAU  # TAU es 2π en Godot
	
	# Calcula la posición de salida del proyectil usando el ángulo y el radio
	var offset = Vector2(cos(random_angle), sin(random_angle)) * radius
	var spawn_position = global_position + offset  # Posición de spawn alrededor del personaje
	
	# Instancia y configura el proyectil
	var projectile_instance = BULLET_SCENE.instantiate()
	projectile_instance.global_position = spawn_position
	
	# Define la dirección inicial del proyectil en función del ángulo
	var shoot_direction = offset.normalized()
	projectile_instance.setup(shoot_direction)
	
	# Agrega el proyectil a la escena principal
	var root = get_tree().current_scene
	if root:
		root.call_deferred("add_child", projectile_instance)
	else:
		print("Error: No se pudo obtener la escena principal.")

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_just_pressed("shoot_2"):
		shoot_random()
		
