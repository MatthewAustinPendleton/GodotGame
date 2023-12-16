extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/Item_Display
@onready var amount_text: Label = $CenterContainer/Panel/Label
@onready var click_area: Area2D = $CenterContainer/Panel/Click_Area

var currentSlot: InventorySlot

func update(slot: InventorySlot):
	
	currentSlot = slot
	
	if !slot.item:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		amount_text.visible = true
		amount_text.text = str(slot.amount)
	click_area.set_process_input(slot.item != null) 

func _input(event):
	if event.is_action_pressed("mouse_left") and click_area.is_inside_tree():
		on_item_click()

func on_item_click():
	if currentSlot.item:
		var itemName = currentSlot.item.name
		itemName = capitalize_words(itemName.replace("_", " "))
		print(itemName, ": ", currentSlot.item.description)

func capitalize_words(inputString: String) -> String:
	var words = inputString.split(" ")
	for i in range(words.size()):
		words[i] = words[i].capitalize()
	var stringOfWords = ""
	for i in range(words.size()):
		if(i >= words.size() - 1):
			stringOfWords += words[i]
		else:
			stringOfWords += words[i] + " "
	return stringOfWords
