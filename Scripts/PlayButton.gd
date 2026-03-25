extends Button
var TutorialTimer:float = 0
func _pressed():
	#New Tutorial if Clicked
	if Global.TutorialStepsComplete == 5:
		Global.TutorialStepsComplete = 6
		modulate = Color(1,1,1)
	get_tree().change_scene_to_file("res://Scenes/Play Scene.tscn")
func _process(delta):
	#Flashes if Tutorial
	if Global.TutorialStepsComplete == 5:
		modulate = Color(1,1,1+2*(sin(3.14*TutorialTimer)**2))
		TutorialTimer = TutorialTimer + delta
	#Version Label
	$"../Version Label".text = "".join(["v",Global.Version])
