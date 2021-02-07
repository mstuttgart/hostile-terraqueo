extends Node2D

func _on_PressSpaceTimer_timeout():
    $PressSpaceButton.show_behind_parent = not $PressSpaceButton.show_behind_parent


func _on_PressSpaceButton_pressed():
    pass # Replace with function body.
