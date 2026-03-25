extends Button
var TutorialTimer:float = 0
func _process(delta):
	if Global.TutorialStepsComplete == 0:
		TutorialTimer = TutorialTimer + delta
		modulate = Color(1,1,1+2*(sin(3.14*TutorialTimer)**2))
func _pressed():
	if Global.TutorialStepsComplete == 0:
		Global.TutorialStepsComplete = 1
		modulate = Color(1,1,1)
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")
