extends Node2D

onready var transition = $UI/Transition
onready var tilemap = $WorldMap

onready var marca_img = $"Location-pointer-16X16"
onready var marca_area = $"Location-Area"

func _ready():
	#$"Fase1".visible = true
	#$"Fase1+".visible = false
	Global.text_box = ""
	calculate_switch_blocks()
	var _error = Global.connect("blocks_switched",self,"calculate_switch_blocks")
	transition.open()

func _unhandled_input(_event):
	if Input.is_action_just_pressed("pause"):
		var _error = get_tree().change_scene("res://UI/Menu.tscn")
		
	elif Input.is_action_just_pressed("ui_accept"):
		# Move the sprite and collision shape to the player position
		var player = get_node("Player")
		marca_img.position = player.position
		marca_area.position = player.position

func calculate_switch_blocks():
	if Global.block_switch:
		#4 to 2
		for b in .get_used_cells_by_id(4):
			tilemap.set_cellv(b,2)
		#3 to 5
		for b in tilemap.get_used_cells_by_id(3):
			tilemap.set_cellv(b,5)
	else:
		#2 to 4
		for b in tilemap.get_used_cells_by_id(2):
			tilemap.set_cellv(b,4)
		#5 to 3
		for b in tilemap.get_used_cells_by_id(5):
			tilemap.set_cellv(b,3)

func Despedida():
	transition.close(1.0)

