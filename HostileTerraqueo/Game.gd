extends Node2D

var junk_scene = preload("res://Junk.tscn")
var gameover_scene = preload("res://GameOverScreen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
    # Init random seed
    randomize()

    new_game()

# Start game and configure scene
func new_game():

    # Set player inital position
    $Player.position = $PlayerPosition.position

    # Start timers
    $JunkSpawnTimer.start()

    # Start score and music
    $Score.start()
    $BackgroundMusic.play()



func game_over():

    # Stop junk spawn Timer
    $JunkSpawnTimer.stop()

    # Stop score count
    $Score.stop()

    # Stop music
    $BackgroundMusic.stop()
    $DeathSfx.play()

    # Remove player
    $Player.queue_free()

    # Instance GameOver message
    add_child(gameover_scene.instance())

# Time to spawn junk in game scene
func _on_JunkSpawnTimer_timeout():

    # Instance junk
    var junk = junk_scene.instance()

    # Choose a random location on Path2D
    $JunkPath/JunkSpawnPosition.offset = randi()

    # Move the junk
    junk.start($JunkPath/JunkSpawnPosition.position,
              $JunkPath/JunkSpawnPosition.rotation)

    # Add junk to scene
    add_child(junk)

# Get signal 'gameover' from Player node
func _on_Player_gameover():
    game_over()
