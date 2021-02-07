extends Node2D

func _ready():
    $BackgroundMusic.play()

func _on_PressSpaceTimer_timeout():
    # Create blink effect in button
    $PressSpaceButton.show_behind_parent = not $PressSpaceButton.show_behind_parent


func _on_PressSpaceButton_pressed():
    $BackgroundMusic.stop()

    # Change to game scene
    get_tree().change_scene("res://Game.tscn")
    queue_free()


func _on_PressSpaceButtonTimer_timeout():
    # Create blink effect in button
    $PressSpaceButton.show_behind_parent = not $PressSpaceButton.show_behind_parent
