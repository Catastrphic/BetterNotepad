extends Panel

var hasSaved = false
var saved = false
var f = File.new()
var filePath
var window_title = "Better Notepad"

func _process(delta):
	get_parent().get_parent().get_node("TitleBar/Middle/Title").text = window_title

func simulate_keypress():
	var a = InputEventKey.new()
	var b = InputEventKey.new()
	a.scancode = KEY_CONTROL
	b.scancode = KEY_Z
	a.pressed = true # change to false to simulate a key release
	b.pressed = true # change to false to simulate a key release
	Input.parse_input_event(a)
	Input.parse_input_event(b)

func _ready():
	visible = false
	get_node("SaveDialog").current_dir = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
	get_node("SaveDialog").set_filters(PoolStringArray(["*.txt ; Text Files"]))
	if OS.get_cmdline_args():
		print(OS.get_cmdline_args())
		var f = File.new()
		f.open(OS.get_cmdline_args()[0], File.READ)
		get_parent().get_parent().get_node("Text").text = f.get_as_text()
		print("test" + f)
		OS.set_window_title(f + " - Better Notepad")
		f.close()
	else:
		print("No cmdline args")

func save():
	if hasSaved == false:
		get_node("SaveDialog").popup_centered()
	else:
		saved = true
		f.open(filePath, 2)
		f.store_string(get_parent().get_parent().get_node("Text").text)
		f.close()
		OS.set_window_title("Better Notepad")
		window_title = "Better Notepad"

func _on_New_Window_pressed():
	visible = false
	get_parent().get_node("File").pressed = false
	var error = OS.shell_open("BetterNotepad.exe")
	if error:
		print(error)
	else:
		print("opened new window")


func _on_New_pressed():
	visible = false
	get_parent().get_node("File").pressed = false
	if saved == true:
		get_parent().get_parent().get_node("Text").text = ""
	elif get_parent().get_parent().get_node("Text").text == "":
		get_parent().get_parent().get_node("Text").text = ""
	elif get_parent().get_parent().get_node("Text").text != "" and saved == false:
		get_node("SaveWarn").popup_centered()


func _on_SaveWarn_confirmed():
	get_parent().get_parent().get_node("Text").text = ""


func _on_Text_text_changed():
	if get_parent().get_parent().get_node("Text").text != "":
		saved = false
		OS.set_window_title("*Better Notepad")
		window_title = "*Better Notepad"
	else:
		OS.set_window_title("Better Notepad")
		window_title = "Better Notepad"



func _on_Save_pressed():
	visible = false
	get_parent().get_node("File").pressed = false
	save()


func _on_SaveDialog_file_selected(path):
	saved = true
	f.open(path, 2)
	f.store_string(get_parent().get_parent().get_node("Text").text)
	filePath = path
	f.close()
	OS.set_window_title("Better Notepad")
	window_title = "Better Notepad"
	hasSaved = true

func _input(event):
	if event.is_action_pressed("save"):
		save()
	if event.is_action_pressed("ui_up"):
		simulate_keypress()


func _on_SaveAs_pressed():
	visible = false
	get_parent().get_node("File").pressed = false
	get_node("SaveDialog").popup_centered()


func _on_Exit_pressed():
	visible = false
	get_parent().get_node("File").pressed = false
	if saved == true:
		get_tree().quit()
	elif get_parent().get_parent().get_node("Text").text == "":
		get_tree().quit()
	elif get_parent().get_parent().get_node("Text").text != "" and saved == false:
		get_node("QuitWarn").popup_centered()



func _on_QuitWarn_confirmed():
	get_tree().quit()
