extends ParallaxBackground

var scroll_speed = Vector2(100, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	# Move the ParallaxBackground to create a scrolling effect
	offset += scroll_speed * delta
	
