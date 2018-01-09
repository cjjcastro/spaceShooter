extends Node

const GRUPO_INIMIGO = "inimigos"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func getCamera():
	return get_tree().get_root().get_node("main").get_node("camera")
	