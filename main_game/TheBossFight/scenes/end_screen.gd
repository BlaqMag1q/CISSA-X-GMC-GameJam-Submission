extends Node2D
@onready var label: Label = $ResultLabel
@onready var lose_sprite: Sprite2D = $LoseSprite
@onready var win_sprite: Sprite2D = $WinSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	# Ensure everything starts hidden
	win_sprite.visible = false
	lose_sprite.visible = false
	$TryagainB.connect("pressed", Callable(self, "_on_restart_button_pressed"))
	$MenuB.connect("pressed", Callable(self, "_on_main_menu_button_pressed"))

func _on_restart_button_pressed():
	
	get_tree().change_scene_to_file("res://TheBossFight/scenes/boss_battle.tscn")

func set_result(condition: String) -> void:
	match condition:
		"win":
			label.text = "You won!"
			win_sprite.visible = true
		"lose":
			label.text = "You lost!"
			lose_sprite.visible = true
		_:
			lose_sprite.visible = true

			label.text = "Unknown result"
	
func _on_main_menu_button_pressed():
	print("MAIN MENU")
	#get_tree().change_scene_to_file("res://path_to_your_main_menu_scene.tscn")
