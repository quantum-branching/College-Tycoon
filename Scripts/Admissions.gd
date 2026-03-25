extends Button
var TutorialTimer:float = 0
var MaxValue:float
var GPA_Weight:float = 0
var Difficulty_Weight:float = 0
var AP_History_Weight:float = 0
var AP_Physics_Weight:float = 0
var AP_Calculus_Weight:float = 0
var AP_Language_Weight:float = 0
var AP_Consistency_Weight:float = 0
var SAT_Weight:float = 0
var Financial_Need_Weight:float = 0
var Legacy_Weight:float = 0
var Min_Score:int = 0
var Max_Acceptance:int = 0
func _ready():
	GPA_Weight = Global.Admissions_GPA_Weight
	Difficulty_Weight = Global.Admissions_Difficulty_Weight
	AP_History_Weight = Global.Admissions_AP_History_Weight
	AP_Physics_Weight = Global.Admissions_AP_Physics_Weight
	AP_Calculus_Weight = Global.Admissions_AP_Calculus_Weight
	AP_Language_Weight = Global.Admissions_AP_Language_Weight
	AP_Consistency_Weight = Global.Admissions_AP_Consistency_Weight
	SAT_Weight = Global.Admissions_SAT_Weight
	Financial_Need_Weight = Global.Admissions_Financial_Need_Weight
	Legacy_Weight = Global.Admissions_Legacy_Weight
	Min_Score = Global.Admissions_Min_Score
	Max_Acceptance = Global.Admissions_Max_Acceptance
func _pressed():
	#New Tutorial if Clicked
	if Global.TutorialStepsComplete == 1:
		Global.TutorialStepsComplete = 2
		TutorialTimer = 0
		modulate = Color(1,1,1)
	#Sets Active Setting Tab to 1
	Global.SettingsTab = 1
	#New UI Setup
	$"../Exit".ResetSettings()
	$"../SpinBox1".prefix = "GPA Weight: "
	$"../SpinBox2".prefix = "Class Difficulty Weight: "
	$"../SpinBox3".prefix = "AP History Weight: "
	$"../SpinBox4".prefix = "AP Physics Weight: "
	$"../SpinBox5".prefix = "AP Calculus Weight: "
	$"../SpinBox6".prefix = "AP Language Weight: "
	$"../SpinBox7".prefix = "Min AP Score Weight: "
	$"../SpinBox8".prefix = "SAT Weight: "
	$"../SpinBox9".prefix = "Financial Aid Weight: "
	$"../SpinBox10".prefix = "Legacy Weight: "
	$"../MaxValue Label".visible = true
	$"../SpinBox11".visible = true
	$"../SpinBox12".visible = true
	#Range
	$"../SpinBox9".min_value = -1
	$"../SpinBox9".max_value = 1
	$"../SpinBox10".max_value = 5
	$"../SpinBox11".max_value = 250*((Difficulty_Weight+4*GPA_Weight)/5+SAT_Weight+(AP_History_Weight+AP_Physics_Weight+AP_Calculus_Weight+AP_Language_Weight)/4+AP_Consistency_Weight)
	$"../SpinBox12".max_value = int(float(Global.Cost_Max_Housing)/4)
	#Set Value
	$"../SpinBox1".value = GPA_Weight
	$"../SpinBox2".value = Difficulty_Weight
	$"../SpinBox3".value = AP_History_Weight
	$"../SpinBox4".value = AP_Physics_Weight
	$"../SpinBox5".value = AP_Calculus_Weight
	$"../SpinBox6".value = AP_Language_Weight
	$"../SpinBox7".value = AP_Consistency_Weight
	$"../SpinBox8".value = SAT_Weight
	$"../SpinBox9".value = Financial_Need_Weight
	$"../SpinBox10".value = Legacy_Weight
	$"../SpinBox11".value = Min_Score
	$"../SpinBox12".value = Max_Acceptance
func _process(delta):
	#Flashes if Tutorial
	TutorialTimer = TutorialTimer + delta
	if Global.TutorialStepsComplete == 1:
		modulate = Color(1,1,1+2*(sin(3.14*TutorialTimer)**2))
	if Global.SettingsTab == 1:
		#Show that tab is open
		flat = true
		#Calls values from Value Boxes
		GPA_Weight = $"../SpinBox1".value
		Difficulty_Weight = $"../SpinBox2".value
		AP_History_Weight = $"../SpinBox3".value
		AP_Physics_Weight = $"../SpinBox4".value
		AP_Calculus_Weight = $"../SpinBox5".value
		AP_Language_Weight = $"../SpinBox6".value
		AP_Consistency_Weight = $"../SpinBox7".value
		SAT_Weight = $"../SpinBox8".value
		Financial_Need_Weight = $"../SpinBox9".value
		Legacy_Weight = $"../SpinBox10".value
		Min_Score = $"../SpinBox11".value
		Max_Acceptance = $"../SpinBox12".value
		#Saves values to Global
		Global.Admissions_GPA_Weight = GPA_Weight
		Global.Admissions_Difficulty_Weight = Difficulty_Weight
		Global.Admissions_AP_History_Weight = AP_History_Weight
		Global.Admissions_AP_Physics_Weight = AP_Physics_Weight
		Global.Admissions_AP_Calculus_Weight = AP_Calculus_Weight
		Global.Admissions_AP_Language_Weight = AP_Language_Weight
		Global.Admissions_AP_Consistency_Weight = AP_Consistency_Weight
		Global.Admissions_SAT_Weight = SAT_Weight
		Global.Admissions_Financial_Need_Weight = Financial_Need_Weight
		Global.Admissions_Legacy_Weight = Legacy_Weight
		Global.Admissions_Min_Score = Min_Score
		Global.Admissions_Max_Acceptance = Max_Acceptance
		#Calculates Max Admit Value
		MaxValue = 250*((Difficulty_Weight+4*GPA_Weight)/5+SAT_Weight+(AP_History_Weight+AP_Physics_Weight+AP_Calculus_Weight+AP_Language_Weight)/4+AP_Consistency_Weight)
		$"../SpinBox11".max_value = MaxValue
		$"../SpinBox12".max_value = int(float(Global.Cost_Max_Housing)/4)
		$"../MaxValue Label".text = "".join(["Max Value: ",MaxValue])
		#Use tab to change selection
	else:
		#shows that tab is closed
		flat = false
