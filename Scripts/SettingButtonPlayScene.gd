extends TextureButton
var TutorialTimer:float = 0
func _pressed():
	#New Tutorial if Clicked
	if Global.TutorialStepsComplete == 6:
		Global.TutorialStepsComplete = 7
		modulate = Color(1,1,1)
	Global.SettingsTab = 0
	Global.SettingsToPlay = true
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")
func _process(delta):
	if Input.is_action_pressed("Escape"):
		get_tree().change_scene_to_file("res://Scenes/Start Screen.tscn")
	#Flashes if Tutorial
	if Global.TutorialStepsComplete == 6:
		modulate = Color(1,1,1+2*(sin(3.14*TutorialTimer)**2))
		TutorialTimer = TutorialTimer + delta
