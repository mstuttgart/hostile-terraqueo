extends Area2D

# Declare const here
const SPEED = 50

# Declare member variables here
var screen_size
var player_size

# Called when the node enters the scene tree for the first time.
func _ready():

    # Get screen size
    screen_size = get_viewport_rect().size

    # Get player shape extents
    player_size = $CollisionShape2D.shape.get_extents()

# Get keyboard input
func _get_input():

    var velocity = Vector2()

    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1

    if Input.is_action_pressed("ui_right"):
        velocity.x += 1

    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1

    if Input.is_action_pressed("ui_down"):
        velocity.y += 1

    if velocity.length() > 0:
        velocity = velocity.normalized() * SPEED

    return velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

    # Set player position
    position += _get_input() * delta

    # Adjust player position to inside game screen
    position.x = clamp(position.x, player_size.x, screen_size.x - player_size.x)
    position.y = clamp(position.y, player_size.y, screen_size.y - player_size.y)
