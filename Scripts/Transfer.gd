extends Button
var TutorialTimer:float = 0
var AP_History_Min_Score:int
var AP_Physics_Min_Score:int
var AP_Calculus_Min_Score:int
var AP_Language_Min_Score:int
var AP_History_Credits:int
var AP_Physics_Credits:int
var AP_Calculus_Credits:int
var AP_Language_Credits:int
func _ready():
	AP_History_Min_Score = Global.Transfer_AP_History_Min_Score
	AP_Physics_Min_Score = Global.Transfer_AP_Physics_Min_Score
	AP_Calculus_Min_Score = Global.Transfer_AP_Calculus_Min_Score
	AP_Language_Min_Score = Global.Transfer_AP_Language_Min_Score
	AP_History_Credits = Global.Transfer_AP_History_Credits
	AP_Physics_Credits = Global.Transfer_AP_Physics_Credits
	AP_Calculus_Credits = Global.Transfer_AP_Calculus_Credits
	AP_Language_Credits = Global.Transfer_AP_Language_Credits
func _pressed():
	#New Tutorial if Clicked
	if Global.TutorialStepsComplete == 3:
		Global.TutorialStepsComplete = 4
		modulate = Color(1,1,1)
	Global.SettingsTab = 4
	#New UI Setup
	$"../Exit".ResetSettings()
	$"../SpinBox1".prefix = "AP History (Min Score)"
	$"../SpinBox2".prefix = "AP History (Transfer Credits)"
	$"../SpinBox3".prefix = "AP Physics (Min Score)"
	$"../SpinBox4".prefix = "AP Physics (Transfer Credits)"
	$"../SpinBox5".prefix = "AP Calculus (Min Score)"
	$"../SpinBox6".prefix = "AP Calculus (Transfer Credits)"
	$"../SpinBox7".prefix = "AP Language (Min Score)"
	$"../SpinBox8".prefix = "AP Language (Transfer Credits)"
	$"../SpinBox9".visible = false
	$"../SpinBox10".visible = false
	#Min Values
	$"../SpinBox1".min_value = 2
	$"../SpinBox3".min_value = 2
	$"../SpinBox5".min_value = 2
	$"../SpinBox7".min_value = 2
	#Max Values
	$"../SpinBox1".max_value = 5
	$"../SpinBox2".max_value = 10
	$"../SpinBox3".max_value = 5
	$"../SpinBox4".max_value = 10
	$"../SpinBox5".max_value = 5
	$"../SpinBox6".max_value = 10
	$"../SpinBox7".max_value = 5
	$"../SpinBox8".max_value = 10
	#Set Values
	$"../SpinBox1".value = AP_History_Min_Score
	$"../SpinBox2".value = AP_History_Credits
	$"../SpinBox3".value = AP_Physics_Min_Score
	$"../SpinBox4".value = AP_Physics_Credits
	$"../SpinBox5".value = AP_Calculus_Min_Score
	$"../SpinBox6".value = AP_Calculus_Credits
	$"../SpinBox7".value = AP_Language_Min_Score
	$"../SpinBox8".value = AP_Language_Credits
func _process(delta):
	#Flashes if Tutorial
	if Global.TutorialStepsComplete == 3:
		modulate = Color(1,1,1+2*(sin(3.14*TutorialTimer)**2))
		TutorialTimer = TutorialTimer + delta
	if Global.SettingsTab == 4:
		flat = true
		#Call values from Value Boxes
		AP_History_Min_Score = $"../SpinBox1".value
		AP_History_Credits = $"../SpinBox2".value
		AP_Physics_Min_Score = $"../SpinBox3".value
		AP_Physics_Credits = $"../SpinBox4".value
		AP_Calculus_Min_Score = $"../SpinBox5".value
		AP_Calculus_Credits = $"../SpinBox6".value
		AP_Language_Min_Score = $"../SpinBox7".value
		AP_Language_Credits = $"../SpinBox8".value
		#Saves values to Global
		Global.Transfer_AP_History_Min_Score = AP_History_Min_Score
		Global.Transfer_AP_Physics_Min_Score = AP_Physics_Min_Score
		Global.Transfer_AP_Calculus_Min_Score = AP_Calculus_Min_Score
		Global.Transfer_AP_Language_Min_Score = AP_Language_Min_Score
		Global.Transfer_AP_History_Credits = AP_History_Credits
		Global.Transfer_AP_Physics_Credits = AP_Physics_Credits
		Global.Transfer_AP_Calculus_Credits = AP_Calculus_Credits
		Global.Transfer_AP_Language_Credits = AP_Language_Credits
	else:
		flat = false
