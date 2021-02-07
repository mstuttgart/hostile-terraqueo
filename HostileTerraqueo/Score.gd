extends CanvasLayer

# Declare member variables here.
var score

# Init nodes
func start():
    # Init score counter
    score = 0

    # Init nodes
    $ScoreLabel.text =  str(score)
    $ScoreTimer.start()

# Stop nodes
func stop():
    $ScoreTimer.stop()


func _on_ScoreTimer_timeout():
    # Update score
    score += 5

    # Set text to score label
    $ScoreLabel.text = str(score)
