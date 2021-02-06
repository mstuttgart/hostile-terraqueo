extends RigidBody2D

# Declare const here
const MIN_SPEED = 50
const MAX_SPEED = 70


func start(pos, direction):

    # Set the junk position
    position = pos

    # Set junk rotation
    rotation = direction + PI/2

    # Set the velocity vectior (speed and direction)
    linear_velocity = Vector2(1, 1).normalized() * rand_range(MIN_SPEED, MAX_SPEED)
    linear_velocity = linear_velocity.rotated(direction)

# Emmited when VisiblityNotifier2D exits the screen
func _on_VisibilityNotifier2D_screen_exited():

    # Queues a node for deletion at the end of the current frame
    queue_free()
