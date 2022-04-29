class_name SceneChanger1
extends CanvasLayer

export (String, FILE, "*.tscn") var target_scene
export (float) var fade_duration := 0.5

onready var color_rect: ColorRect = $ColorRect
onready var tween: Tween = $Tween


func _ready() -> void:
	preload("res://Window.tscn")
	yield(get_tree().create_timer(rand_range(3, 10)), "timeout")
	transition_to("res://Window.tscn")


func transition_to(_next_scene := target_scene) -> void:
	color_rect.show()
	tween.interpolate_property(color_rect, "modulate:a", 0, 1, fade_duration)
	tween.start()
	yield(tween, "tween_all_completed")
	get_tree().change_scene(_next_scene)
