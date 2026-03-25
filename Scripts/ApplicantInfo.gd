extends Label
#Known Variables
var CollegeAttended:String
var Degree:String
var MaxClassSize:int
var ExpectedSalary:int
#Hidden Variables
var DegreeNumber:int
var Level:int
var Big:bool
var Public:bool
var Donations:int
#Button Pressed
var ButtonPressed:bool = false

func _process(_delta):
	Global.Cost_Professors = len(Global.Cost_Professors_Salary)
	if ButtonPressed:
		NewApplicant()
		UpdateLabel()
		ButtonPressed = false

func _ready():
	NewApplicant()
	UpdateLabel()

##This function updates the values read on the application.
func UpdateLabel() -> void:
	var Lines:Array = []
	Lines.append("\nCollege Attended: ")
	Lines.append(CollegeAttended)
	Lines.append("\nDegree: ")
	Lines.append(Degree)
	Lines.append("\nMax Class Size: ")
	Lines.append(MaxClassSize)
	Lines.append("\nExpected Salary: $")
	Lines.append(Math.NumToText(ExpectedSalary))
	$".".text = "".join(Lines)

##This function creates a new professor which applied to be a professor at your college.
func NewApplicant() -> void:
	var ApplicantMod:float = min(1.25,max((Global.Stats_AvgSAT-1200)/400,-.2))
	Level = 1+int(3*(randf()**(.25+ApplicantMod)))
	Big = (randf() > .5)
	Public = (randf() > 1/(Level+.25))
	CollegeAttended= Database.getschool(Level,Big,Public)
	DegreeNumber = randi_range(1,20)
	Degree=Database.getdegree(DegreeNumber)
	ExpectedSalary = int(80_000-10_000*Level+(.1+randf()/10)*(Database.AverageDegreeSalary(DegreeNumber)-40_000))
	Donations = int(((.25*Database.AverageDegreeSalary(DegreeNumber))-10_000)*(((100-MaxClassSize)*0.01)**2)*(5-Level))
	MaxClassSize = 20-2*Level
	if Big==true:
		MaxClassSize = (6-Level)*MaxClassSize
	else:
		MaxClassSize = int((5-Level)*(randf()**2)*MaxClassSize)+MaxClassSize
