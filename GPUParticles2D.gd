extends GPUParticles2D

var lastPos = Vector2(0,0)

func _process(delta):
	var currentPos = get_global_position()
	if (lastPos != currentPos):
		lastPos = currentPos
		modulate.a = 1
	elif (lastPos == currentPos):
		modulate.a -= .005
