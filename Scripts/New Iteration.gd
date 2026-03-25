extends Button
#region Initiating Variables
var Admission_Officers:int = 0
var Professors:int = 0
var Research_Programs:int = 0
var Max_Housing:int = 0
var Cost = 0
var Cost_Attendance = 0
var ProfessorCost:int = 0
var UpdateTime:float = 0
#endregion Initiating Variables

#region Run-Time Functions
func _ready():
	UpdateTime = 1.75
	Admission_Officers = Global.Cost_Admission_Officers
	Professors = Global.Cost_Professors
	Research_Programs = Global.Cost_Research_Programs
	Max_Housing = Global.Cost_Max_Housing
	$"../Admission Officers".value = Admission_Officers
	$"../Professors".value = Professors
	$"../Research Programs".value = Research_Programs
	$"../Max Students Housed".value = Max_Housing

func _process(delta):
	UpdateTime = UpdateTime + 1.5*delta
	if UpdateTime > 1:
		#Cost Values
		Admission_Officers = max($"../Admission Officers".value,ceil(float(Global.Stats_Applicants)/1500))
		$"../Admission Officers".min_value = ceil(float(Global.Stats_Applicants)/1500)
		Professors = $"../Professors".value
		Research_Programs = $"../Research Programs".value
		Max_Housing = $"../Max Students Housed".value
		if Math.sum(Global.Cost_Professors_Salary):
			ProfessorCost = int(Math.sum(Global.Cost_Professors_Salary)-(Math.sum(Math.ArrayMultiply(Global.Cost_Professors_Class_Size,Global.Cost_Professors_Donation))/Math.sum(Global.Cost_Professors_Class_Size)))
		else:
			ProfessorCost = 0
		Cost = (50000*Admission_Officers)+(250000*Research_Programs)+ProfessorCost+(300*Max_Housing)
		$".".disabled = false
		if Cost > Global.Money:
			$".".disabled = true
		#Cost of Attendance
		Cost_Attendance = Global.Financial_Tuition_Cost+Global.Financial_Food_Cost+Global.Financial_Housing_Cost
		#Save Cost Values
		Global.Cost_Admission_Officers = Admission_Officers
		Global.Cost_Professors = Professors
		Global.Cost_Research_Programs = Research_Programs
		Global.Cost_Max_Housing = Max_Housing
		if Global.Cost_Max_Housing > Global.Admissions_Max_Acceptance*4:
			Global.Admissions_Max_Acceptance = Global.Cost_Max_Housing/4
		$"../Cost Label".text = " ".join(["Costs: ","".join(["$",Math.NumToText(Cost)])])
		#Overview
		$"../Label".text = "".join(["Acceptance Rate: ",.01*round(100*Global.Stats_AR),"%\nYeild Rate: ",.01*round(100*Global.Stats_Yeild),"%\nAverage SAT: ",int(Global.Stats_AvgSAT),"\nAverage GPA: ",.001*round(1000*Global.Stats_AvgGPA),"\nApplicants: ",Math.NumToText(Global.Stats_Applicants),"\nNew Students: ",Math.NumToText(Global.Stats_NewStudents),"\nLegacy Students: ",Global.Stats_Legacy_Students,"\nCost of Attendance: $",Math.NumToText(Cost_Attendance),"\nAverage Aid: $",Math.NumToText(Global.Stats_AverageAid),"\nAverage Value: $",Math.NumToText(Global.Stats_StudentValue),"\nMoney from Loans: $",Math.NumToText(Global.SLoans_TotalLoanMoney)])
		UpdateTime = UpdateTime - 1

func _pressed():
	#Update Money
	Global.Money = Global.Money - Cost
	get_tree().change_scene_to_file("res://Scenes/Loading Applications.tscn")
#endregion Run-Time Functions
