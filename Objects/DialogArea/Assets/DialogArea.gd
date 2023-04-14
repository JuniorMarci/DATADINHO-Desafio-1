extends Area2D

export(String, MULTILINE) var text = ""

func _on_DialogArea_body_entered(body):
	if body.has_method("is_player"):
		Global.text_box = text
		
func _on_DialogArea_body_exited(body):
	if body.has_method("is_player"):
		if Global.text_box == text:
			yield(get_tree().create_timer(10.0), "timeout")
			Global.text_box = ""


func _on_DialogArea_body_entered2(body):
	$"../../Player".jump_height = 970.0
	pass



func _on_DialogArea_body_exited2(body):
	$"../../Player".jump_height = 970.0
	pass


#Início da configuração dos menus
#-----------------------------------------------------------------------

func _saiu_Pg_Inicial(body):
	$"../../Fase1".visible = false
	$"../../Inserir".visible = false
	$"../../PgInicial".visible = true
	$"../../LayPg".visible = false
	$"../../Formulas".visible = false
	$"../../Dados".visible = false
	$"../../Revisao".visible = false
	pass

func _entrou_Pg_Inicial(body):
	$"../../Fase1".visible = true
	$"../../PgInicial".visible = false
	$"../../Inserir".visible = false
	$"../../LayPg".visible = false
	$"../../Formulas".visible = false
	$"../../Dados".visible = false
	$"../../Revisao".visible = false
	$"../../WorldMap".set_collision_layer(2)
	$"../../WorldMap2".set_collision_layer(1)
	$"../Voltar".set_collision_layer(1)
	$"../LibTab".set_collision_layer(1)
	pass

func _saiu_Inserir(body):
	$"../../Fase1".visible = false
	$"../../Inserir".visible = true
	$"../../PgInicial".visible = false
	$"../../LayPg".visible = false
	$"../../Formulas".visible = false
	$"../../Dados".visible = false
	$"../../Revisao".visible = false
	pass

func _entrou_Inserir(body):
	$"../../Fase1".visible = true
	$"../../PgInicial".visible = false
	$"../../Inserir".visible = false
	$"../../LayPg".visible = false
	$"../../Formulas".visible = false
	$"../../Dados".visible = false
	$"../../Revisao".visible = false
	$"../../WorldMap".set_collision_layer(2)
	$"../../WorldMap2".set_collision_layer(1)
	$"../Voltar".set_collision_layer(1)
	$"../LibTab".set_collision_layer(1)
	pass

func _saiu_LayPg(body):
	$"../../Fase1".visible = false
	$"../../Inserir".visible = false
	$"../../PgInicial".visible = false
	$"../../LayPg".visible = true
	$"../../Formulas".visible = false
	$"../../Dados".visible = false
	$"../../Revisao".visible = false
	pass

func _entrou_LayPg(body):
	$"../../Fase1".visible = true
	$"../../PgInicial".visible = false
	$"../../Inserir".visible = false
	$"../../LayPg".visible = false
	$"../../Formulas".visible = false
	$"../../Dados".visible = false
	$"../../Revisao".visible = false
	$"../../WorldMap".set_collision_layer(2)
	$"../../WorldMap2".set_collision_layer(1)
	$"../Voltar".set_collision_layer(1)
	$"../LibTab".set_collision_layer(1)
	pass

func _saiu_Formulas(body):
	$"../../Fase1".visible = false
	$"../../Inserir".visible = false
	$"../../PgInicial".visible = false
	$"../../LayPg".visible = false
	$"../../Formulas".visible = true
	$"../../Dados".visible = false
	$"../../Revisao".visible = false
	pass

func _entrou_Formulas(body):
	$"../../Fase1".visible = true
	$"../../PgInicial".visible = false
	$"../../Inserir".visible = false
	$"../../LayPg".visible = false
	$"../../Formulas".visible = false
	$"../../Dados".visible = false
	$"../../Revisao".visible = false
	$"../../WorldMap".set_collision_layer(2)
	$"../../WorldMap2".set_collision_layer(1)
	$"../Voltar".set_collision_layer(1)
	$"../LibTab".set_collision_layer(1)
	pass

func _saiu_Dados(body):
	$"../../Fase1".visible = false
	$"../../Inserir".visible = false
	$"../../PgInicial".visible = false
	$"../../LayPg".visible = false
	$"../../Formulas".visible = false
	$"../../Dados".visible = true
	$"../../Revisao".visible = false
	pass

func _entrou_Dados(body):
	$"../../Fase1".visible = true
	$"../../PgInicial".visible = false
	$"../../Inserir".visible = false
	$"../../LayPg".visible = false
	$"../../Formulas".visible = false
	$"../../Dados".visible = false
	$"../../Revisao".visible = false
	$"../../WorldMap".set_collision_layer(2)
	$"../../WorldMap2".set_collision_layer(1)
	$"../Voltar".set_collision_layer(1)
	$"../LibTab".set_collision_layer(1)
	pass

func _saiu_Revisao(body):
	$"../../Fase1".visible = false
	$"../../Inserir".visible = false
	$"../../PgInicial".visible = false
	$"../../LayPg".visible = false
	$"../../Formulas".visible = false
	$"../../Dados".visible = false
	$"../../Revisao".visible = true
	pass

func _entrou_Revisao(body):
	$"../../Fase1".visible = true
	$"../../PgInicial".visible = false
	$"../../Inserir".visible = false
	$"../../LayPg".visible = false
	$"../../Formulas".visible = false
	$"../../Dados".visible = false
	$"../../Revisao".visible = false
	$"../../WorldMap".set_collision_layer(2)
	$"../../WorldMap2".set_collision_layer(1)
	$"../Voltar".set_collision_layer(1)
	$"../LibTab".set_collision_layer(1)
	pass

func _entrou_Arquivo(body):
	pass

func _saiu_Arquivo(body):
	Global.max_coins = 0
	Global.current_coins = 0
	Global.block_switch = true
	var _error = get_tree().change_scene("res://World/Guia-Arquivo.tscn")



#----------------------------------------------------------------------
#Fim da configuração dos menus





func _on_DialogArea_body_entered_nao(body):
	$"../../WorldMap".set_collision_layer(2)
	$"../../WorldMap2".set_collision_layer(2)
	pass # Replace with function body.


func _on_DialogArea_body_exited_nao(body):
	$"../../WorldMap".set_collision_layer(2)
	$"../../WorldMap2".set_collision_layer(2)
	pass # Replace with function body.


func _on_DialogArea_body_entered_voltar(body):
	$"../../WorldMap".set_collision_layer(1)
	$"../../Fase1".visible = true
	$"../../Fase1+".visible = false
	pass # Replace with function body.


func _on_DialogArea_body_exited_voltar(body):
	#text = "Este nao eh o menu correto a se acessar."
	pass # Replace with function body.


func _on_DialogArea_body_lib_tab_in(body):
	$"../../Fase1".visible = true
	$"../../Fase1+".visible = false
	$"../../WorldMap2".set_collision_layer(2)
	$"../../Tab".set_collision_layer(1)
	$"../Coin".set_collision_layer(1)
	$"../Coin2".set_collision_layer(1)
	$"../Coin3".set_collision_layer(1)
	$"../Coin4".set_collision_layer(1)
	$"../Coin5".set_collision_layer(1)
	$"../Coin6".set_collision_layer(1)
	$"../Coin7".set_collision_layer(1)
	$"../Coin8".set_collision_layer(1)
	$"../Coin9".set_collision_layer(1)
	$"../Coin10".set_collision_layer(1)
	$"../Coin11".set_collision_layer(1)
	$"../Coin12".set_collision_layer(1)
	$"../Coin13".set_collision_layer(1)
	$"../Coin14".set_collision_layer(1)
	$"../Coin15".set_collision_layer(1)
	$"../Coin16".set_collision_layer(1)
	$"../Coin17".set_collision_layer(1)
	$"../Coin18".set_collision_layer(1)
	$"../Coin19".set_collision_layer(1)
	$"../Coin20".set_collision_layer(1)
	$"../Coin21".set_collision_layer(1)
	$"../Coin22".set_collision_layer(1)
	$"../Coin23".set_collision_layer(1)
	$"../Coin24".set_collision_layer(1)
	$"../Coin25".set_collision_layer(1)
	$"../Coin26".set_collision_layer(1)
	$"../Coin27".set_collision_layer(1)
	$"../Coin28".set_collision_layer(1)
	$"../Coin29".set_collision_layer(1)
	$"../Coin30".set_collision_layer(1)
	$"../Coin31".set_collision_layer(1)
	$"../Coin32".set_collision_layer(1)
	$"../Coin33".set_collision_layer(1)
	$"../Coin34".set_collision_layer(1)
	$"../Coin35".set_collision_layer(1)
	$"../Coin36".set_collision_layer(1)
	$"../Coin37".set_collision_layer(1)
	$"../Coin38".set_collision_layer(1)
	$"../Coin39".set_collision_layer(1)
	$"../Coin40".set_collision_layer(1)
	$"../Coin41".set_collision_layer(1)
	$"../Coin42".set_collision_layer(1)
	$"../Coin43".set_collision_layer(1)
	$"../Coin44".set_collision_layer(1)
	$"../Coin45".set_collision_layer(1)
	$"../Coin46".set_collision_layer(1)
	$"../Coin47".set_collision_layer(1)
	$"../Coin48".set_collision_layer(1)
	$"../Coin49".set_collision_layer(1)
	$"../Coin50".set_collision_layer(1)
	$"../Coin51".set_collision_layer(1)
	$"../Coin52".set_collision_layer(1)
	$"../Coin53".set_collision_layer(1)
	$"../Coin54".set_collision_layer(1)
	$"../Coin55".set_collision_layer(1)
	$"../Coin56".set_collision_layer(1)

	
	
	pass # Replace with function body.


func _on_DialogArea_body_lib_tab_out(body):
	$"../LibTab".set_collision_layer(2)
	pass # Replace with function body.
