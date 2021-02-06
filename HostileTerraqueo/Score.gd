extends CanvasLayer

# Declare member variables here. Examples:
var score

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_ScoreTimer_timeout():
    # Update score
    score += 5

    # Set text to score label
    $ScoreLabel.text = str(score)
