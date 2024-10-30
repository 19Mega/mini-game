extends Timer

const ENEMY = preload("res://characters/enemy.tscn")

func _on_timeout() -> void:
	var root = get_tree().current_scene
	var enemy_instance = ENEMY.instantiate()
	root.call_deferred("add_child", enemy_instance)
