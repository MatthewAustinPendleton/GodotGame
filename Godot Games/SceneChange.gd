extends Area2D
var playerEnteredFromLeft: bool = false

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print(body.name + " has entered " + get_name())
		
		# Set the direction based on the entrance side
		playerEnteredFromLeft = body.position.x < position.x
		Global.isPlayerFacingRight = playerEnteredFromLeft

		# Construct the path to the next scene
		var sceneName = "res://" + get_name() + ".tscn"
		print(sceneName)

		# Change scene
		get_tree().change_scene_to_file(sceneName)
		if get_name() == "Area2":
			Global.hasEnteredArea1 = true
		if get_name() == "Area1":
			Global.hasEnteredArea2 = true

