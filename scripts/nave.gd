extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pre_tiro = preload("res://scenes/tiro.tscn")

var vel = 300
var intervalo = .3
var ultimo_disparo = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	var d = 0
	var e = 0
	
	if Input.is_action_pressed("direita"):
		d = 1
		
	if Input.is_action_pressed("esquerda"):
		e = -1
		
	if get_pos().x > 640 - 50:
		d = 0
	
	if get_pos().x < 50:
		e = 0
	
	set_pos(get_pos() + Vector2(1, 0) * vel * delta * (d + e))
	
	#disparo
	if Input.is_action_pressed("tiro"):
		if ultimo_disparo <= 0:
			dispara(get_node("posCanhaoE"))
			dispara(get_node("posCanhaoD"))
			ultimo_disparo = intervalo
		pass
	
	if ultimo_disparo > 0:
		ultimo_disparo -= delta
	
	pass
	
func dispara(node):
	var tiro = pre_tiro.instance()
	tiro.set_global_pos(node.get_global_pos())
	get_owner().add_child(tiro)
	pass