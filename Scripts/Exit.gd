extends Button
var TutorialTimer:float = 0
func _pressed():
	#New Tutorial if Clicked
	if Global.TutorialStepsComplete == 4:
		Global.TutorialStepsComplete = 5
		modulate = Color(1,1,1)
	if Global.TutorialStepsComplete == 7:
		Global.TutorialStepsComplete = 8
		modulate = Color(1,1,1)
	Global.SettingsTab = 0
	if Global.SettingsToPlay:
		get_tree().change_scene_to_file("res://Scenes/Play Scene.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/Start Screen.tscn")
func _process(delta):
	if Input.is_action_pressed("Escape"):
		get_tree().change_scene_to_file("res://Scenes/Start Screen.tscn")
	#Flashes if Tutorial
	if Global.TutorialStepsComplete == 4:
		modulate = Color(1,1,1+2*(sin(3.14*TutorialTimer)**2))
		TutorialTimer = TutorialTimer + delta
	if Global.TutorialStepsComplete == 7:
		modulate = Color(1,1,1+2*(sin(3.14*TutorialTimer)**2))
		TutorialTimer = TutorialTimer + delta
	if Global.SettingsTab == 0:
		$"../Screen Mode".visible = false
		$"../SpinBox1".visible = false
		$"../SpinBox2".visible = false
		$"../SpinBox3".visible = false
		$"../SpinBox4".visible = false
		$"../SpinBox5".visible = false
		$"../SpinBox6".visible = false
		$"../SpinBox7".visible = false
		$"../SpinBox8".visible = false
		$"../SpinBox9".visible = false
		$"../SpinBox10".visible = false
		$"../SpinBox11".visible = false
		$"../SpinBox12".visible = false
		$"../MaxValue Label".visible = false
func ResetSettings():
	#Text
	$"../SpinBox1".prefix = ""
	$"../SpinBox2".prefix = ""
	$"../SpinBox3".prefix = ""
	$"../SpinBox4".prefix = ""
	$"../SpinBox5".prefix = ""
	$"../SpinBox6".prefix = ""
	$"../SpinBox7".prefix = ""
	$"../SpinBox8".prefix = ""
	$"../SpinBox9".prefix = ""
	$"../SpinBox10".prefix = ""
	#Visibility
	$"../Screen Mode".visible = false
	$"../SpinBox1".visible = true
	$"../SpinBox2".visible = true
	$"../SpinBox3".visible = true
	$"../SpinBox4".visible = true
	$"../SpinBox5".visible = true
	$"../SpinBox6".visible = true
	$"../SpinBox7".visible = true
	$"../SpinBox8".visible = true
	$"../SpinBox9".visible = true
	$"../SpinBox10".visible = true
	$"../SpinBox11".visible = false
	$"../SpinBox12".visible = false
	$"../MaxValue Label".visible = false
	#Min Value
	$"../SpinBox1".min_value = 0
	$"../SpinBox2".min_value = 0
	$"../SpinBox3".min_value = 0
	$"../SpinBox4".min_value = 0
	$"../SpinBox5".min_value = 0
	$"../SpinBox6".min_value = 0
	$"../SpinBox7".min_value = 0
	$"../SpinBox8".min_value = 0
	$"../SpinBox9".min_value = 0
	$"../SpinBox10".min_value = 0
	#Max Value
	$"../SpinBox1".max_value = 1
	$"../SpinBox2".max_value = 1
	$"../SpinBox3".max_value = 1
	$"../SpinBox4".max_value = 1
	$"../SpinBox5".max_value = 1
	$"../SpinBox6".max_value = 1
	$"../SpinBox7".max_value = 1
	$"../SpinBox8".max_value = 1
	$"../SpinBox9".max_value = 1
	$"../SpinBox10".max_value = 1
	#Step Value (Typed)
	$"../SpinBox1".step = .01
	$"../SpinBox2".step = .01
	$"../SpinBox3".step = .01
	$"../SpinBox4".step = .01
	$"../SpinBox5".step = .01
	$"../SpinBox6".step = .01
	$"../SpinBox7".step = .01
	$"../SpinBox8".step = .01
	$"../SpinBox9".step = .01
	$"../SpinBox10".step = .01
	#Step Value (Arrows)
	$"../SpinBox1".custom_arrow_step = .05
	$"../SpinBox2".custom_arrow_step = .05
	$"../SpinBox3".custom_arrow_step = .05
	$"../SpinBox4".custom_arrow_step = .05
	$"../SpinBox5".custom_arrow_step = .05
	$"../SpinBox6".custom_arrow_step = .05
	$"../SpinBox7".custom_arrow_step = .05
	$"../SpinBox8".custom_arrow_step = .05
	$"../SpinBox9".custom_arrow_step = .05
	$"../SpinBox10".custom_arrow_step = .05
