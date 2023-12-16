extends Node2D

var isWithinRange: bool
@export var item: InventoryItem
@export var pickup_sound: AudioStreamPlayer
var player = null
var isInteracting = false


# Animation variables
var floating_duration: float = 0.3
var shrinking_duration: float = 0.5

func _ready():
	isWithinRange = false

func _process(delta):
	if isWithinRange == true:
		if Input.is_action_just_pressed("ui_down"):
			if isInteracting == true:
				pass
			else:
				isInteracting = true
				print("Calling player.collect()")
				pickup_sound.play()
				handle_tween_animation()
				player.collect(item)
				

func handle_tween_animation():
	var tween_example = create_tween()
	var x_velocity_scale_factor = 0.3
	tween_example.tween_property(self, "position:y", player.position.y, floating_duration)
	var target_x = player.position.x
	if player.has_method("get_velocity"):
		var player_velocity = player.get_velocity()
		target_x += player_velocity.x * x_velocity_scale_factor
	tween_example.parallel().tween_property(self, "position:x", target_x, floating_duration)
	tween_example.parallel().tween_property(self, "scale", Vector2(0, 0), floating_duration)
	tween_example.connect("finished", on_tween_finished)
	

func on_tween_finished():
	isInteracting = false
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
		isWithinRange = false
