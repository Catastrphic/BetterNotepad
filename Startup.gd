extends Control

func _ready():
	OS.min_window_size = Vector2(550, 350)
	OS.window_size = Vector2(800, 600)
	OS.window_position = Vector2(400, 150)

func _physics_process(delta):
	print(OS.window_position.distance_to(get_viewport().get_mouse_position()))
	get_node("Text").set_size(Vector2(OS.window_size.x, OS.window_size.y - 50))
	get_node("Top").set_size(Vector2(OS.window_size.x, 50))
	get_node("Top/Background").set_size(Vector2(OS.window_size.x, 50))
	get_node("TitleBar").set_size(Vector2(OS.window_size.x - 200, 50))
	get_node("TitleBar/Middle").set_size(Vector2(OS.window_size.x - 400, 50))
	get_node("TitleBar/Exit").set_position(Vector2(get_node("TitleBar").rect_size.x - 50, 0))
	get_node("TitleBar/Fullscreen").set_position(Vector2(get_node("TitleBar").rect_size.x - 100, 0))
	get_node("TitleBar/Minimize").set_position(Vector2(get_node("TitleBar").rect_size.x - 150, 0))


func _on_Button_pressed():
	print("ok")
