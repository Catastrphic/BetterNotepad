extends Control

var following = false
var dragging_start_position
var fullscreen = false

func _on_TitleBar_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_position = get_local_mouse_position()

func _process(_delta):
	if following:
		OS.window_position = Vector2(OS.window_position.x + get_global_mouse_position().x - dragging_start_position.x - 200, OS.window_position.y + get_global_mouse_position().y - dragging_start_position.y)


func _on_Fullscreen_pressed():
	fullscreen = !fullscreen
	OS.set_window_maximized(fullscreen)
	if fullscreen == true:
		var image = Image.new()
		image.load("res://fullscreened.png")
		var t = ImageTexture.new()
		t.create_from_image(image)
		t.flags ^= Texture.FLAG_FILTER
		get_node("Fullscreen").texture_normal = t
	else:
		OS.min_window_size = Vector2(550, 350)
		var image = Image.new()
		image.load("res://[].png")
		var t = ImageTexture.new()
		t.create_from_image(image)
		t.flags ^= Texture.FLAG_FILTER
		get_node("Fullscreen").texture_normal = t


func _on_Minimize_pressed():
	OS.window_minimized = true
