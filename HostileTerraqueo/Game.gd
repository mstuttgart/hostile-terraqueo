extends Node2D

var junk_list = [
    preload("res://JunkSword.tscn"),
]

# Called when the node enters the scene tree for the first time.
func _ready():

    # Init random seed
    randomize()

    # Start timers
    $JunkTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _on_JunkTimer_timeout():
    # Time to spawn junk in game scene

    var idx = rand_range(0, junk_list.size() - 1)

    # Instance junk
    var junk = junk_list[idx].instance()

    # Choose a random location on Path2D
    $JunkPath/JunkSpawnPosition.offset = randi()

    # Move the junk
    junk.move($JunkPath/JunkSpawnPosition.position,
              $JunkPath/JunkSpawnPosition.rotation)

    # Add junk to scene
    add_child(junk)
