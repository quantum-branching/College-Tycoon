extends Label
#region Variables
var ProfNo:int = 1
var Professors_College_Attended:String = ""
var Professors_Degree:int = 0
var Professors_Salary:int = 0
var Professors_Class_Size:int = 0
var Professors_Donation:int = 0
#endregion Variables

#region Run-Time Functions
func _ready():
	pass
func  _process(_delta):
	var LabelText = ""
	Professors_College_Attended = String(Global.Cost_Professors_College_Attended[ProfNo])
	LabelText = "".join(["College Attended: ",Professors_College_Attended])
	Professors_Degree = int(Global.Cost_Professors_Degree[ProfNo])
	LabelText = "".join([LabelText,"\nDegree: ",Database.getdegree(Professors_Degree)])
	Professors_Salary = int(Global.Cost_Professors_Salary[ProfNo-1])
	LabelText = "".join([LabelText,"\nExpected Salary: $",Math.NumToText(Professors_Salary)])
	Professors_Class_Size = int(Global.Cost_Professors_Class_Size[ProfNo])
	LabelText = "".join([LabelText,"\nClass Size: ",Professors_Class_Size])
	text = LabelText
#endregion Run-Time Functions
