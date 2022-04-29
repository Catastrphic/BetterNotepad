extends Control

func _on_File_toggled(button_pressed):
	if get_node("File").pressed == true:
		get_node("FileMenu").visible = true
	else:
		get_node("FileMenu").visible = false
	get_node("Edit").pressed = false
