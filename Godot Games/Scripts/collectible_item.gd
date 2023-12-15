extends Node

var isWithinRange: bool
@export var item: InventoryItem
var player = null

func _ready():
	isWithinRange = false

func _process(delta):
	if isWithinRange == true:
		if Input.is_action_just_pressed("ui_down"):
			print("Calling player.collect()")
			player.collect(item)
			queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		print("Entered pick-up range.")
		player = body
		isWithinRange = true
	
func _on_area_2d_body_exited(body):
	print("Exited pick-up range.")
	if body.is_in_group("Player"):
		player = null
