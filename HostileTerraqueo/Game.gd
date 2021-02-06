extends Node2D

const SPEED = 200


# Called when the node enters the scene tree for the first time.
func _ready():
    $Player.position = $InitialPosition.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

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

    $Player.position += velocity * delta


