extends Button
var TutorialTimer:float = 0
var Tuition_Cost:int = 0
var Food_Cost:int = 0
var Housing_Cost:int = 0
var Max_Aid:int = 0
var Income_Weight:float = 0
var Base_Aid:int = 0
var SAT_Weight:int = 0
var GPA_Weight:int = 0
var Difficulty_Weight:float = 0
var Legacy_Weight:float = 0
func _ready():
	Tuition_Cost = Global.Financial_Tuition_Cost
	Food_Cost = Global.Financial_Food_Cost
	Housing_Cost = Global.Financial_Housing_Cost
	Max_Aid = Global.Financial_Max_Aid
	Income_Weight = Global.Financial_Income_Weight
	Base_Aid = Global.Financial_Base_Aid
	SAT_Weight = Global.Financial_SAT_Weight
	GPA_Weight = Global.Financial_GPA_Weight
	Difficulty_Weight = Global.Financial_Difficulty_Weight
	Legacy_Weight = Global.Financial_Legacy_Weight
func _pressed():
	#New Tutorial if Clicked
	if Global.TutorialStepsComplete == 2:
		Global.TutorialStepsComplete = 3
		modulate = Color(1,1,1)
	Global.SettingsTab = 2
	#New UI Setup
	$"../Exit".ResetSettings()
	$"../SpinBox1".prefix = "Tuition Cost: "
	$"../SpinBox2".prefix = "Food Cost: "
	$"../SpinBox3".prefix = "Housing Cost: "
	$"../SpinBox4".prefix = "Max Aid: "
	$"../SpinBox5".prefix = "Income Weight: "
	$"../SpinBox6".prefix = "Base Aid: "
	$"../SpinBox7".prefix = "SAT Weight: "
	$"../SpinBox8".prefix = "GPA Weight: "
	$"../SpinBox9".prefix = "Class Difficulty Weight: "
	$"../SpinBox10".prefix = "Legacy Weight: "
	#New Max
	$"../SpinBox1".max_value = 100000
	$"../SpinBox2".max_value = 100000
	$"../SpinBox3".max_value = 100000
	$"../SpinBox4".max_value = 100000
	$"../SpinBox6".max_value = 100000
	$"../SpinBox7".max_value = 100000
	$"../SpinBox8".max_value = 100000
	#New Step
	$"../SpinBox1".custom_arrow_step = 1000
	$"../SpinBox2".custom_arrow_step = 1000
	$"../SpinBox3".custom_arrow_step = 1000
	$"../SpinBox4".custom_arrow_step = 1000
	$"../SpinBox6".custom_arrow_step = 1000
	$"../SpinBox7".custom_arrow_step = 1000
	$"../SpinBox8".custom_arrow_step = 1000
	$"../SpinBox1".step = 250
	$"../SpinBox2".step = 250
	$"../SpinBox3".step = 250
	$"../SpinBox4".step = 250
	$"../SpinBox6".step = 250
	$"../SpinBox7".step = 250
	$"../SpinBox8".step = 250
	#Set Value
	$"../SpinBox1".value = Tuition_Cost
	$"../SpinBox2".value = Food_Cost
	$"../SpinBox3".value = Housing_Cost
	$"../SpinBox4".value = Max_Aid
	$"../SpinBox5".value = Income_Weight
	$"../SpinBox6".value = Base_Aid
	$"../SpinBox7".value = SAT_Weight
	$"../SpinBox8".value = GPA_Weight
	$"../SpinBox9".value = Difficulty_Weight
	$"../SpinBox10".value = Legacy_Weight
func _process(delta):
	#Flashes if Tutorial
	if Global.TutorialStepsComplete == 2:
		modulate = Color(1,1,1+2*(sin(3.14*TutorialTimer)**2))
		TutorialTimer = TutorialTimer + delta
	if Global.SettingsTab == 2:
		flat = true
		#Call values from Value Boxes
		Tuition_Cost = $"../SpinBox1".value
		Food_Cost = $"../SpinBox2".value
		Housing_Cost = $"../SpinBox3".value
		Max_Aid = $"../SpinBox4".value
		Income_Weight = $"../SpinBox5".value
		Base_Aid = $"../SpinBox6".value
		SAT_Weight = $"../SpinBox7".value
		GPA_Weight = $"../SpinBox8".value
		Difficulty_Weight = $"../SpinBox9".value
		Legacy_Weight = $"../SpinBox10".value
		#Saves values to Global
		Global.Financial_Tuition_Cost = Tuition_Cost
		Global.Financial_Food_Cost = Food_Cost
		Global.Financial_Housing_Cost = Housing_Cost
		Global.Financial_Max_Aid = Max_Aid
		Global.Financial_Income_Weight = Income_Weight
		Global.Financial_Base_Aid = Base_Aid
		Global.Financial_SAT_Weight = SAT_Weight
		Global.Financial_GPA_Weight = GPA_Weight
		Global.Financial_Difficulty_Weight = Difficulty_Weight
		Global.Financial_Legacy_Weight = Legacy_Weight
	else:
		flat = false
