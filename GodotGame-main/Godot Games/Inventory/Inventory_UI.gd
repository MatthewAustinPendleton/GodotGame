extends Control

@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


var is_open = false
var inventory: Inventory

func _ready():
	inventory = Global.inventory
	print("Inventory UI script ready. inventory: ", inventory)
	inventory.update.connect(update_slots)
	update_slots()
	close()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_inventory"):
		if is_open:
			close()
		else:
			open()

func update_slots():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])
	
func close():
	is_open = false
	visible = false

func open():
	is_open = true
	visible = true
