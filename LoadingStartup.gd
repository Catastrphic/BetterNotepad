extends Control

func _ready():
	get_node("VideoPlayer").play()
	if OS.get_cmdline_args():
		while true:
			yield(get_tree().create_timer(0.5), "timeout")
			$Text.text = "Opening " + OS.get_cmdline_args()[0] + "."
			print($VideoPlayer.is_playing())
			yield(get_tree().create_timer(0.5), "timeout")
			$Text.text = "Opening " + OS.get_cmdline_args()[0] + ".."
			yield(get_tree().create_timer(0.5), "timeout")
			$Text.text = "Opening " + OS.get_cmdline_args()[0] + "..."
	else:
		while true:
			yield(get_tree().create_timer(0.5), "timeout")
			$Text.text = "Better Notepad"
			print($VideoPlayer.is_playing())
			yield(get_tree().create_timer(0.5), "timeout")
			$Text.text = "Better Notepad"
			yield(get_tree().create_timer(0.5), "timeout")
			$Text.text = "Better Notepad"

func _on_TextureButton_pressed():
	get_tree().quit(1337)
