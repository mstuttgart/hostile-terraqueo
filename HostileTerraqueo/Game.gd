extends Node2D

var junk_list = [
    preload("res://JunkSword.tscn"),
]

var game_over_screen = preload("res://GameOverScreen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():

    # Init random seed
    randomize()

    # Set player inital position
    $Player.position = $PlayerPosition.position

    # Start timers
    $JunkSpawnTimer.start()

    # Start score
    $Score.start()

# Time to spawn junk in game scene
func _on_JunkSpawnTimer_timeout():

    var idx = rand_range(0, junk_list.size() - 1)

    # Instance junk
    var junk = junk_list[idx].instance()

    # Choose a random location on Path2D
    $JunkPath/JunkSpawnPosition.offset = randi()

    # Move the junk
    junk.start($JunkPath/JunkSpawnPosition.position,
              $JunkPath/JunkSpawnPosition.rotation)

    # Add junk to scene
    add_child(junk)

# Get signal 'gameover' from Player node
func _on_Player_gameover():

    # Stop junk spawn Timer
    $JunkSpawnTimer.stop()

    # Stop score count
    $Score.stop()

    # Remove player
    $Player.queue_free()

    # Instance GameOver message
    add_child(game_over_screen.instance())
