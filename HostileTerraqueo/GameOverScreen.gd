extends CanvasLayer

func _on_ReplayButton_pressed():
    get_tree().change_scene("res://Game.tscn")
    queue_free()


func _on_QuitButton_pressed():
    get_tree().change_scene("res://TitleScreen.tscn")
    queue_free()
