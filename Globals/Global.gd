extends Node
#region Setting UI
##This variable controls what tab the settings are on.
var SettingsTab:int = 0
##This variable controls where the setting button was accessed from and controls where to exit out to.
var SettingsToPlay: = false
#endregion Setting UI

#region Saved Settings
##This variable controls how the save file is read.
var FileVersion:float = 1.0
##This variable controls what version the current version of the game is.
const Version:float = 1.2
##This is the amount of money in dollars that the character controls.
var Money = 1000000
##This controls how much of the tutorial the character has already completed.
var TutorialStepsComplete = 0
#endregion Saved Settings

#region Saved Admission Settings
##This variable stores what affect a student's GPA has on admission.
var Admissions_GPA_Weight:float = 0
##This variable stores what affect a student's class difficulty has on admission.
var Admissions_Difficulty_Weight:float = 0
##This variable stores what affect a student's AP History scores has on admission.
var Admissions_AP_History_Weight:float = 0
##This variable stores what affect a student's AP Physics scores has on admission.
var Admissions_AP_Physics_Weight:float = 0
##This variable stores what affect a student's AP Calculus scores has on admission.
var Admissions_AP_Calculus_Weight:float = 0
##This variable stores what affect a student's AP Language scores has on admission.
var Admissions_AP_Language_Weight:float = 0
##This variable stores what affect a student's lowest AP score has on admission.
var Admissions_AP_Consistency_Weight:float = 0
##This variable stores what affect a student's SAT score has on admission.
var Admissions_SAT_Weight:float = 0
##This variable stores what affect a student's financial need has on admission.
var Admissions_Financial_Need_Weight:float = 0
##This variable stores what affect a student's legacy status has on admission.
var Admissions_Legacy_Weight:float = 0
##This variable stores the selectivity of the college in relation to static numbers instead of comparisons.
var Admissions_Min_Score:int = 0
##This variable stores the selectivty of the college in relation to the students who apply to it.
var Admissions_Max_Acceptance:int = 0
#endregion Saved Admission Settings

#region Saved Financial Settings
##This variable considers the effect of GPA has on a student's financial aid.
var Financial_Tuition_Cost:int = 0
##This variable considers the effect of class difficulty has on a student's financial aid.
var Financial_Food_Cost:int = 0
##This variable considers the effect of AP History has on a student's financial aid.
var Financial_Housing_Cost:int = 0
##This variable considers the effect of AP Physics has on a student's financial aid.
var Financial_Max_Aid:int = 0
##This variable considers the effect of AP Calculus has on a student's financial aid.
var Financial_Income_Weight:float = 0
##This variable considers the effect of AP Language has on a student's financial aid.
var Financial_Base_Aid:int = 0
##This variable considers the effect of lowest AP score has on a student's financial aid.
var Financial_SAT_Weight:int = 0
##This variable considers the effect of SAT score has on a student's financial aid.
var Financial_GPA_Weight:int = 0
##This variable considers the effect of financial need on a student's financial aid.
var Financial_Difficulty_Weight:float = 0
##This variable considers the effect of legacy status on a student's financial aid.
var Financial_Legacy_Weight:float = 0
#endregion Saved Financial Settings

#region Saved Transfer Settings
##This variable stores the minimum score a student must get on AP History to get college credit.
var Transfer_AP_History_Min_Score:int = 0
##This variable stores the minimum score a student must get on AP Physics to get college credit.
var Transfer_AP_Physics_Min_Score:int = 0
##This variable stores the minimum score a student must get on AP Calculus to get college credit.
var Transfer_AP_Calculus_Min_Score:int = 0
##This variable stores the minimum score a student must get on AP Language to get college credit.
var Transfer_AP_Language_Min_Score:int = 0
##This variable stores the amount of credits recieved from getting at least the minimum score on AP History.
var Transfer_AP_History_Credits:int = 0
##This variable stores the amount of credits recieved from getting at least the minimum score on AP Physics.
var Transfer_AP_Physics_Credits:int = 0
##This variable stores the amount of credits recieved from getting at least the minimum score on AP Calculus.
var Transfer_AP_Calculus_Credits:int = 0
##This variable stores the amount of credits recieved from getting at least the minimum score on AP Language.
var Transfer_AP_Language_Credits:int = 0
#endregion Saved Transfer Settings

#region Saved Cost Settings
##This is the amount of admission officers that college has to pay every year. Each admission officer costs around $50,000 per year.
var Cost_Admission_Officers:int = 0
##This is the amount of professors that college has to pay every year. Each professor cost is different depending on the type of institution that they came from. However, a higher cost may result in better students and more donations.
var Cost_Professors:int = 0
##This is an array of the colleges that the professors attended. The better then institution the more they cost but the better teachers they may be.
var Cost_Professors_College_Attended:Array = []
##This is an array of the degree the professors carry which changes what can be taught at this college.
var Cost_Professors_Degree:Array = []
##This is the amount of money the college has to pay the professors every year.
var Cost_Professors_Salary:Array = []
##This is the largest class the professor may be able to teach.
var Cost_Professors_Class_Size:Array = []
##This is the amount of donations that the college recieves from better students donating back to their college.
var Cost_Professors_Donation:Array = []
##This is the amount of research programs that the college has. Each research programs costs about $250,000 per year.
var Cost_Research_Programs:int = 0
##This is the amount of students the college can house at any given moment. As a result, only one quarter of this amount can commit to this college every year.
var Cost_Max_Housing:int = 0
#endregion Saved Cost Settings

#region Student Loans

var SLoans_APR:float = 1
var SLoans_MaxLoanPerYear:int = 0
var SLoans_MinDeposit:float = 0
var SLoans_MeanDeposit:int = 0
var SLoans_TotalLoanMoney:int = 0

#endregion

#region College Stats
##This is the acceptance rate of the college. This is the amount of students admitted over the amount of students applied.
var Stats_AR:float = 100.0
##This is the yeild rate of the college. This is the amount of students commited over the amount of students admitted.
var Stats_Yeild:float = 0
##This is the average SAT score of admitted students at this college.
var Stats_AvgSAT:float = 0
##This is the average GPA of admitted students at this college.
var Stats_AvgGPA:float = 0
##This is the amount of applicants that this college recieves every year.
var Stats_Applicants:int = 0
##This is the amount of new students that this college recieves every year.
var Stats_NewStudents:int = 0
##this is the average amount that students value this college at.
var Stats_StudentValue:int = 0
##This is the amount of aid the average student recieves from this college.
var Stats_AverageAid:int = 0
##This is the amount of legacy students who are currently enrolled.
var Stats_Legacy_Students:int = 0

#endregion College Stats

#region Saving Process
##This is the file path at which a save file is saved.
var filepath = "user://CollegeTycoonGameSave.CTSave"
##This is the timer used to ensure that this game gets saved every two seconds.
var savetimer:float = 0

var LegacyFileVersion:float = Version
#endregion

#region Run-Time Functions
func _ready():
	if FileAccess.file_exists(filepath):
		loadfile()
func _process(_delta):
	savetimer = (savetimer + _delta)
	if savetimer > 2:
		savefile()
		savetimer = 0
#endregion Run-Time Functions

#region FileSystem
##This function stores all game information into a save file that can be accessed by the "loadfile()" function.
func savefile() -> void:
	var file = FileAccess.open(filepath,FileAccess.WRITE)
	file.store_line("".join(["FileVersion = ", Version]))
	#Admissions Save Variables
	file.store_line("".join(["Admissions_GPA_Weight = ", Admissions_GPA_Weight]))
	file.store_line("".join(["Admissions_Difficulty_Weight = ", Admissions_Difficulty_Weight]))
	file.store_line("".join(["Admissions_AP_History_Weight = ", Admissions_AP_History_Weight]))
	file.store_line("".join(["Admissions_AP_Physics_Weight = ", Admissions_AP_Physics_Weight]))
	file.store_line("".join(["Admissions_AP_Calculus_Weight = ", Admissions_AP_Calculus_Weight]))
	file.store_line("".join(["Admissions_AP_Language_Weight = ", Admissions_AP_Language_Weight]))
	file.store_line("".join(["Admissions_AP_Consistency_Weight = ", Admissions_AP_Consistency_Weight]))
	file.store_line("".join(["Admissions_SAT_Weight = ", Admissions_SAT_Weight]))
	file.store_line("".join(["Admissions_Financial_Need_Weight = ", Admissions_Financial_Need_Weight]))
	file.store_line("".join(["Admissions_Legacy_Weight = ", Admissions_Legacy_Weight]))
	file.store_line("".join(["Admissions_Min_Score = ", Admissions_Min_Score]))
	file.store_line("".join(["Admissions_Max_Acceptance = ", Admissions_Max_Acceptance]))
	#Financial Save Variables
	file.store_line("".join(["Financial_Tuition_Cost = ", Financial_Tuition_Cost]))
	file.store_line("".join(["Financial_Food_Cost = ", Financial_Food_Cost]))
	file.store_line("".join(["Financial_Housing_Cost = ", Financial_Housing_Cost]))
	file.store_line("".join(["Financial_Max_Aid = ", Financial_Max_Aid]))
	file.store_line("".join(["Financial_Income_Weight = ", Financial_Income_Weight]))
	file.store_line("".join(["Financial_Base_Aid = ", Financial_Base_Aid]))
	file.store_line("".join(["Financial_SAT_Weight = ", Financial_SAT_Weight]))
	file.store_line("".join(["Financial_GPA_Weight = ", Financial_GPA_Weight]))
	file.store_line("".join(["Financial_Difficulty_Weight = ", Financial_Difficulty_Weight]))
	file.store_line("".join(["Financial_Legacy_Weight = ", Financial_Legacy_Weight]))
	#Transfer Save Variables
	file.store_line("".join(["Transfer_AP_History_Min_Score = ", Transfer_AP_History_Min_Score]))
	file.store_line("".join(["Transfer_AP_Physics_Min_Score = ", Transfer_AP_Physics_Min_Score]))
	file.store_line("".join(["Transfer_AP_Calculus_Min_Score = ", Transfer_AP_Calculus_Min_Score]))
	file.store_line("".join(["Transfer_AP_Language_Min_Score = ", Transfer_AP_Language_Min_Score]))
	file.store_line("".join(["Transfer_AP_History_Credits = ", Transfer_AP_History_Credits]))
	file.store_line("".join(["Transfer_AP_Physics_Credits = ", Transfer_AP_Physics_Credits]))
	file.store_line("".join(["Transfer_AP_Calculus_Credits = ", Transfer_AP_Calculus_Credits]))
	file.store_line("".join(["Transfer_AP_Language_Credits = ", Transfer_AP_Language_Credits]))
	#Save Progression
	file.store_line("".join(["Money = ", Money]))
	file.store_line("".join(["Tutorial Steps Completed = ", TutorialStepsComplete]))
	#Save Costs
	file.store_line("".join(["Cost_Admission_Officers = ", Cost_Admission_Officers]))
	file.store_line("".join(["Cost_Professors = ", Cost_Professors]))
	file.store_line("".join(["Cost_Research_Programs = ", Cost_Research_Programs]))
	file.store_line("".join(["Cost_Max_Housing = ", Cost_Max_Housing]))
	#Student Loans
	file.store_line("".join(["Student Loans APR = ",SLoans_APR]))
	file.store_line("".join(["Student Loans MaxLoanPerYear = ",SLoans_MaxLoanPerYear]))
	file.store_line("".join(["Student Loans MinDeposit = ",SLoans_MinDeposit]))
	file.store_line("".join(["Student Loans Total Loan Money = ",SLoans_TotalLoanMoney]))
	#College Stats
	file.store_line("".join(["Acceptance Rate = ", Stats_AR]))
	file.store_line("".join(["Yeild Rate = ", Stats_Yeild]))
	file.store_line("".join(["Average SAT = ", Stats_AvgSAT]))
	file.store_line("".join(["Average GPA = ", Stats_AvgGPA]))
	file.store_line("".join(["Applicants = ", Stats_Applicants]))
	file.store_line("".join(["New Students = ", Stats_NewStudents]))
	file.store_line("".join(["Average Aid = ", Stats_AverageAid]))
	file.store_line("".join(["Average Ability to Pay = ", Stats_StudentValue]))
	file.store_line("".join(["Amount of Legacy Students = ",Stats_Legacy_Students]))
	#Saved Array Variables
	file.store_csv_line(Cost_Professors_College_Attended,",")
	file.store_csv_line(Cost_Professors_Degree,",")
	file.store_csv_line(Cost_Professors_Salary,",")
	file.store_csv_line(Cost_Professors_Class_Size,",")
	file.store_csv_line(Cost_Professors_Donation,",")
	#Saves to Disk
	file.flush()
##This function reads all "Variable = integer|float" lines that are found in save files.
func readline(LineText:String) -> float:
	var ReadLine_Array = LineText.rsplit(" = ",true,1)
	return float(ReadLine_Array[1])


func loadfile() -> void:
	var file = FileAccess.open(filepath,FileAccess.READ)
	var LegacyVersionReader = file.get_line()
	if LegacyVersionReader.contains("Version"):
		LegacyFileVersion = readline(LegacyVersionReader)
	else:
		LegacyFileVersion = 1
	if LegacyFileVersion == 1.2:
		load1_2()
		return
	if LegacyFileVersion == 1.1:
		load1_1()
		return
	if LegacyFileVersion == 1:
		load1_0()
		return

##This function loads up a file according to the v1.2 beta file syntax. This should only be used on v1.2 files, as it may corrupt other file versions.
func load1_2():
	var file = FileAccess.open(filepath,FileAccess.READ)
	FileVersion = float(readline(file.get_line()))
	#Load Admission Variables
	Admissions_GPA_Weight = float(readline(file.get_line()))
	Admissions_Difficulty_Weight = float(readline(file.get_line()))
	Admissions_AP_History_Weight = float(readline(file.get_line()))
	Admissions_AP_Physics_Weight = float(readline(file.get_line()))
	Admissions_AP_Calculus_Weight = float(readline(file.get_line()))
	Admissions_AP_Language_Weight = float(readline(file.get_line()))
	Admissions_AP_Consistency_Weight = float(readline(file.get_line()))
	Admissions_SAT_Weight = float(readline(file.get_line()))
	Admissions_Financial_Need_Weight = float(readline(file.get_line()))
	Admissions_Legacy_Weight = float(readline(file.get_line()))
	Admissions_Min_Score = int(readline(file.get_line()))
	Admissions_Max_Acceptance = int(readline(file.get_line()))
	#Load Financial Variables
	Financial_Tuition_Cost = int(readline(file.get_line()))
	Financial_Food_Cost = int(readline(file.get_line()))
	Financial_Housing_Cost = int(readline(file.get_line()))
	Financial_Max_Aid = int(readline(file.get_line()))
	Financial_Income_Weight = readline(file.get_line())
	Financial_Base_Aid = int(readline(file.get_line()))
	Financial_SAT_Weight = int(readline(file.get_line()))
	Financial_GPA_Weight = int(readline(file.get_line()))
	Financial_Difficulty_Weight = float(readline(file.get_line()))
	Financial_Legacy_Weight = float(readline(file.get_line()))
	#Load Transfer Variables
	Transfer_AP_History_Min_Score = int(readline(file.get_line()))
	Transfer_AP_Physics_Min_Score = int(readline(file.get_line()))
	Transfer_AP_Calculus_Min_Score = int(readline(file.get_line()))
	Transfer_AP_Language_Min_Score = int(readline(file.get_line()))
	Transfer_AP_History_Credits = int(readline(file.get_line()))
	Transfer_AP_Physics_Credits = int(readline(file.get_line()))
	Transfer_AP_Calculus_Credits = int(readline(file.get_line()))
	Transfer_AP_Language_Credits = int(readline(file.get_line()))
	#Load Progression Variables
	Money = int(readline(file.get_line()))
	TutorialStepsComplete = int(readline(file.get_line()))
	#Load Cost Variables
	Cost_Admission_Officers = int(readline(file.get_line()))
	Cost_Professors = int(readline(file.get_line()))
	Cost_Research_Programs = int(readline(file.get_line()))
	Cost_Max_Housing = int(readline(file.get_line()))
	#Student Loan Stats
	SLoans_APR = float(readline(file.get_line()))
	SLoans_MaxLoanPerYear = int(readline(file.get_line()))
	SLoans_MinDeposit = int(readline(file.get_line()))
	SLoans_TotalLoanMoney = int(readline(file.get_line()))
	#College Stats
	Stats_AR = float(readline(file.get_line()))
	Stats_Yeild = float(readline(file.get_line()))
	Stats_AvgSAT = float(readline(file.get_line()))
	Stats_AvgGPA = float(readline(file.get_line()))
	Stats_Applicants = int(readline(file.get_line()))
	Stats_NewStudents = int(readline(file.get_line()))
	Stats_AverageAid = int(readline(file.get_line()))
	Stats_StudentValue = int(readline(file.get_line()))
	Stats_Legacy_Students = int(readline(file.get_line()))
	#Load Array Variables
	Cost_Professors_College_Attended = file.get_csv_line()
	Cost_Professors_Degree = file.get_csv_line()
	Cost_Professors_Salary = file.get_csv_line()
	Cost_Professors_Class_Size = file.get_csv_line()
	Cost_Professors_Donation = file.get_csv_line()

##This function loads up a file according to the v1.1 release file syntax. This should only be used on v1.1 files, as it may corrupt other file versions.
func load1_1():
	var file = FileAccess.open(filepath,FileAccess.READ)
	FileVersion = float(readline(file.get_line()))
	#Load Admission Variables
	Admissions_GPA_Weight = float(readline(file.get_line()))
	Admissions_Difficulty_Weight = float(readline(file.get_line()))
	Admissions_AP_History_Weight = float(readline(file.get_line()))
	Admissions_AP_Physics_Weight = float(readline(file.get_line()))
	Admissions_AP_Calculus_Weight = float(readline(file.get_line()))
	Admissions_AP_Language_Weight = float(readline(file.get_line()))
	Admissions_AP_Consistency_Weight = float(readline(file.get_line()))
	Admissions_SAT_Weight = float(readline(file.get_line()))
	Admissions_Financial_Need_Weight = float(readline(file.get_line()))
	Admissions_Legacy_Weight = float(readline(file.get_line()))
	Admissions_Min_Score = int(readline(file.get_line()))
	Admissions_Max_Acceptance = int(readline(file.get_line()))
	#Load Financial Variables
	Financial_Tuition_Cost = int(readline(file.get_line()))
	Financial_Food_Cost = int(readline(file.get_line()))
	Financial_Housing_Cost = int(readline(file.get_line()))
	Financial_Max_Aid = int(readline(file.get_line()))
	Financial_Income_Weight = readline(file.get_line())
	Financial_Base_Aid = int(readline(file.get_line()))
	Financial_SAT_Weight = int(readline(file.get_line()))
	Financial_GPA_Weight = int(readline(file.get_line()))
	Financial_Difficulty_Weight = float(readline(file.get_line()))
	Financial_Legacy_Weight = float(readline(file.get_line()))
	#Load Transfer Variables
	Transfer_AP_History_Min_Score = int(readline(file.get_line()))
	Transfer_AP_Physics_Min_Score = int(readline(file.get_line()))
	Transfer_AP_Calculus_Min_Score = int(readline(file.get_line()))
	Transfer_AP_Language_Min_Score = int(readline(file.get_line()))
	Transfer_AP_History_Credits = int(readline(file.get_line()))
	Transfer_AP_Physics_Credits = int(readline(file.get_line()))
	Transfer_AP_Calculus_Credits = int(readline(file.get_line()))
	Transfer_AP_Language_Credits = int(readline(file.get_line()))
	#Load Progression Variables
	Money = int(readline(file.get_line()))
	TutorialStepsComplete = int(readline(file.get_line()))
	#Load Cost Variables
	Cost_Admission_Officers = int(readline(file.get_line()))
	Cost_Professors = int(readline(file.get_line()))
	Cost_Research_Programs = int(readline(file.get_line()))
	Cost_Max_Housing = int(readline(file.get_line()))
	#College Stats
	Stats_AR = float(readline(file.get_line()))
	Stats_Yeild = float(readline(file.get_line()))
	Stats_AvgSAT = float(readline(file.get_line()))
	Stats_AvgGPA = float(readline(file.get_line()))
	Stats_Applicants = int(readline(file.get_line()))
	Stats_NewStudents = int(readline(file.get_line()))
	Stats_AverageAid = int(readline(file.get_line()))
	Stats_StudentValue = int(readline(file.get_line()))
	#Load Array Variables
	Cost_Professors_College_Attended = file.get_csv_line()
	Cost_Professors_Degree = file.get_csv_line()
	Cost_Professors_Salary = file.get_csv_line()
	Cost_Professors_Class_Size = file.get_csv_line()
	Cost_Professors_Donation = file.get_csv_line()
	Cost_Professors_Donation = Math.MultiplyArray(Cost_Professors_Donation,.35)

##This function loads up a file according to the v1 legacy file syntax. This should only be used on v1 files that do not have a version indication header, as it may corrupt other file versions.
func load1_0():
	var file = FileAccess.open(filepath,FileAccess.READ)
	FileVersion = 1
	#Load Admission Variables
	Admissions_GPA_Weight = float(readline(file.get_line()))
	Admissions_Difficulty_Weight = float(readline(file.get_line()))
	Admissions_AP_History_Weight = float(readline(file.get_line()))
	Admissions_AP_Physics_Weight = float(readline(file.get_line()))
	Admissions_AP_Calculus_Weight = float(readline(file.get_line()))
	Admissions_AP_Language_Weight = float(readline(file.get_line()))
	Admissions_AP_Consistency_Weight = float(readline(file.get_line()))
	Admissions_SAT_Weight = float(readline(file.get_line()))
	Admissions_Financial_Need_Weight = float(readline(file.get_line()))
	Admissions_Legacy_Weight = float(readline(file.get_line()))
	Admissions_Min_Score = int(readline(file.get_line()))
	Admissions_Max_Acceptance = int(readline(file.get_line()))
	#Load Financial Variables
	Financial_Tuition_Cost = int(readline(file.get_line()))
	Financial_Food_Cost = int(readline(file.get_line()))
	Financial_Housing_Cost = int(readline(file.get_line()))
	Financial_Max_Aid = int(readline(file.get_line()))
	Financial_Income_Weight = readline(file.get_line())
	Financial_Base_Aid = int(readline(file.get_line()))
	Financial_SAT_Weight = int(readline(file.get_line()))
	Financial_GPA_Weight = int(readline(file.get_line()))
	Financial_Difficulty_Weight = float(readline(file.get_line()))
	Financial_Legacy_Weight = float(readline(file.get_line()))
	#Load Transfer Variables
	Transfer_AP_History_Min_Score = int(readline(file.get_line()))
	Transfer_AP_Physics_Min_Score = int(readline(file.get_line()))
	Transfer_AP_Calculus_Min_Score = int(readline(file.get_line()))
	Transfer_AP_Language_Min_Score = int(readline(file.get_line()))
	Transfer_AP_History_Credits = int(readline(file.get_line()))
	Transfer_AP_Physics_Credits = int(readline(file.get_line()))
	Transfer_AP_Calculus_Credits = int(readline(file.get_line()))
	Transfer_AP_Language_Credits = int(readline(file.get_line()))
	#Load Progression Variables
	Money = int(readline(file.get_line()))
	TutorialStepsComplete = 0
	#Load Cost Variables
	Cost_Admission_Officers = int(readline(file.get_line()))
	Cost_Professors = int(readline(file.get_line()))
	Cost_Research_Programs = int(readline(file.get_line()))
	Cost_Max_Housing = int(readline(file.get_line()))
	#College Stats
	Stats_AR = float(readline(file.get_line()))
	Stats_Yeild = float(readline(file.get_line()))
	Stats_AvgSAT = float(readline(file.get_line()))
	Stats_AvgGPA = float(readline(file.get_line()))
	Stats_Applicants = int(readline(file.get_line()))
	Stats_NewStudents = int(readline(file.get_line()))
	Stats_AverageAid = 0
	Stats_StudentValue = 0
	#Load Array Variables
	Cost_Professors_College_Attended = []
	Cost_Professors_Degree = []
	Cost_Professors_Salary = []
	Cost_Professors_Class_Size = []
	Cost_Professors_Donation = []
#endregion FileSystem
