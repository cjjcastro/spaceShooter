extends Area2D

var vel = 250
var rot = 0
var vida = 4

func _ready():
	add_to_group(game.GRUPO_INIMIGO)
	randomize()
	set_process(true)
	rot = rand_range(-2, 2)
	pass
	
func _process(delta):
	set_pos(get_pos() + Vector2(0, 1) * vel * delta)
	rotate(rot * delta)
	pass

func aplica_dano(valor):
	get_node("anim").play("hit")
	vida -= valor
	if vida <= 0:
		get_node("sample").play("explosao")
		set_process(false)
		set_z(10)
		remove_from_group(game.GRUPO_INIMIGO)
		get_node("anim").play("destroy")
		game.getCamera().shake()
		
	pass