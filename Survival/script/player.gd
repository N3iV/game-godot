extends CharacterBody2D

@onready var sprite_2d = $AnimatedSprite2D
var speed = 100 
var player_state 

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down") 
	if direction.x == 0 and direction.y == 0:
		player_state = 'idle'
	elif direction.x !=0 or direction.y !=0:
		player_state = "walking"
	
	velocity = direction * speed 
	move_and_slide()
	play_anim(direction)
	
	
func play_anim(dir): 
	if player_state == 'idle': 
		sprite_2d.play("idle")
	if player_state == "walking": 
		if dir.y == -1: 
			sprite_2d.play("n-walk")
		if dir.x == 1: 
			sprite_2d.play("e-walk")
		if dir.y == 1: 
			sprite_2d.play("s-walk")
		if dir.x == -1: 
			sprite_2d.play("w-walk")
			
		if dir.x > 0.5 and dir.y < -0.5: 
			sprite_2d.play("ne-walk")
			
		if dir.x > 0.5 and dir.y > 0.5: 
			sprite_2d.play("se-walk")
			
		if dir.x < -0.5 and dir.y > 0.5: 
			sprite_2d.play("we-walk")
			
		if dir.x < 0.5 and dir.y < -0.5: 
			sprite_2d.play("nw-walk")
			
func player():
	pass
