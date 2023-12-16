extends Node
var hasEnteredArea1: bool = false
var hasEnteredArea2: bool = false
var area2SpawnPoint : Vector2 = Vector2(56, 560)
var area1SpawnPoint : Vector2 = Vector2(1248, 552)
var isPlayerFacingRight = true
var itemsInRange : Array = []

@onready var inventory: Inventory = preload("res://Inventory/player_inventory.tres")

# Define a dictionary to store the player's inventory
#var playerInventory : Dictionary = {}

func _ready():
	print("Global script ready. inventory: ", inventory)
