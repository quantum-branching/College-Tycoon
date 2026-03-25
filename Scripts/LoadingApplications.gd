extends Sprite2D
#region Acceptance
var AR:float = 100
var Accepted = 1
var Applicants = 1
var NewStudents = 0
#endregion Acceptance

#region Loans
var MeanDeposit:int = 0
var MeanLoan:int = 0
var MeanLoanPeriod:int = 0
var TotalLoanMoney:int = 0
#endregion

#region Student Variables
var IQ:float = 0
var Class_Difficulty:float = 0
var GPA:float = 0
var AP_History:float = 0
var AP_Physics:float = 0
var AP_Calculus:float = 0
var AP_Language:float = 0
var SAT:float = 0
var Income:float = 0
var Cost_Living:float = 0
var Scholarships:float = 0
var MaxCoA:float = 0
var MinAR:float = 0
var Legacy:int = 0
var StudentValue:float = 0
var Admit_Score:float = 0
var Financial_Aid:float = 0
#endregion Student Variables

#region Array Variables
var Array_IQ:PackedFloat64Array = []
var Array_Class_Difficulty:PackedFloat64Array = []
var Array_GPA:PackedFloat64Array = []
var Array_AP_History:PackedFloat64Array = []
var Array_AP_Physics:PackedFloat64Array = []
var Array_AP_Calculus:PackedFloat64Array = []
var Array_AP_Language:PackedFloat64Array = []
var Array_SAT:PackedFloat64Array = []
var Array_Income:PackedFloat64Array = []
var Array_Cost_Living:PackedFloat64Array = []
var Array_Scholarships:PackedFloat64Array = []
var Array_MaxCoA:PackedFloat64Array = []
var Array_MinAR:PackedFloat64Array = []
var Array_StudentValue:PackedFloat64Array = []
var Array_Legacy:PackedFloat64Array = []
var Array_Admit_Score:PackedFloat64Array = []
var Array_Financial_Aid:PackedFloat64Array = []
#endregion Array Variables

#region NArray Variables
var NArray_IQ:PackedFloat64Array = []
var NArray_Class_Difficulty:PackedFloat64Array = []
var NArray_GPA:PackedFloat64Array = []
var NArray_AP_History:PackedFloat64Array = []
var NArray_AP_Physics:PackedFloat64Array = []
var NArray_AP_Calculus:PackedFloat64Array = []
var NArray_AP_Language:PackedFloat64Array = []
var NArray_SAT:PackedFloat64Array = []
var NArray_Income:PackedFloat64Array = []
var NArray_Cost_Living:PackedFloat64Array = []
var NArray_Scholarships:PackedFloat64Array = []
var NArray_MaxCoA:PackedFloat64Array = []
var NArray_MinAR:PackedFloat64Array = []
var NArray_StudentValue:PackedFloat64Array = []
var NArray_Legacy:PackedFloat64Array = []
var NArray_Admit_Score:PackedFloat64Array = []
var NArray_Financial_Aid:PackedFloat64Array = []
#endregion

#region Min Admit Score
var Sorted_Admit_Score:Array = []
var MinAdmitScore
#endregion Min Admit Score

#region Other Variables
var Cost_Attendance:int = 0
var LegacyStudentBody:int = 0
var Step:int = 0
var Step1:int = 0
#endregion Other Variables

#region Runtime Functions
func _ready():
	AR = Global.Stats_AR
	Cost_Attendance = Global.Financial_Tuition_Cost+Global.Financial_Food_Cost+Global.Financial_Housing_Cost
	ResetApplicants()
	Step = 1

func _process(_delta):
	for i in range(50+(Step1**.2)):
		run()

func run():
	$"../Loading Applicants".value = float((Step1 + Step)*100)/(Applicants+5)
	if Step ==5:
		Global.Stats_Yeild = float(100*NewStudents)/max(Accepted,1)
		Global.Stats_NewStudents = NewStudents
		if NewStudents > Global.Admissions_Max_Acceptance:
			Global.Admissions_Max_Acceptance = NewStudents
			Global.Cost_Max_Housing = 4*NewStudents
		Global.Stats_Legacy_Students = LegacyStudentBody + int(float(Global.Stats_Legacy_Students*3)/4)
		get_tree().change_scene_to_file("res://Scenes/Play Scene.tscn")
	if Step == 4:
		RemoveNonCommited()
	if Step == 3:
		AR = 100*float(Accepted)/Applicants
		Global.Stats_AR = AR
		Global.Stats_AvgSAT = Math.mean(Array_SAT)
		Global.Stats_AvgGPA = Math.mean(Array_GPA)
	if Step == 2:
		LimitApplicationPool(Global.Admissions_Max_Acceptance)
	if Step == 1:
		Applicants = (250*Global.Cost_Research_Programs)+(10*Global.Cost_Professors*(1+0.25*Global.Cost_Research_Programs))+500-(float(Cost_Attendance)/100)
		if Applicants > 100+int(Global.Cost_Max_Housing**1.35):
			Applicants = int(Global.Cost_Max_Housing**1.35)+100
		Global.Stats_Applicants = int(Applicants)
		if Step1 < Applicants:
			applicants()
			AppendApplicants()
			Step1 = Step1 + 1
			Step = 0
	Step = Step + 1
#endregion Runtime Functions

#region New Functions
##Resets the values from the last applicant pool so that new students may apply.
func ResetApplicants() -> void:
	Array_IQ = []
	Array_Class_Difficulty = []
	Array_GPA = []
	Array_AP_History = []
	Array_AP_Physics = []
	Array_AP_Calculus = []
	Array_AP_Language = []
	Array_SAT = []
	Array_Income = []
	Array_Cost_Living = []
	Array_Scholarships = []
	Array_MaxCoA = []
	Array_MinAR = []
	Array_StudentValue = []
	Array_Admit_Score = []
	NArray_IQ = []
	NArray_Class_Difficulty = []
	NArray_GPA = []
	NArray_AP_History = []
	NArray_AP_Physics = []
	NArray_AP_Calculus = []
	NArray_AP_Language = []
	NArray_SAT = []
	NArray_Income = []
	NArray_Cost_Living = []
	NArray_Scholarships = []
	NArray_MaxCoA = []
	NArray_MinAR = []
	NArray_StudentValue = []
	NArray_Admit_Score = []
	NArray_Financial_Aid = []

##Creates a new applicant.
func applicants() -> void:
	if Global.Stats_AvgSAT > 1000:
		SAT = Global.Stats_AvgSAT
	else:
		SAT = 1000
	IQ = 100+40*((.1*((SAT-1000)/600)+(0.75-0.05*Cost_Attendance/min(Global.Financial_Base_Aid+Global.Financial_SAT_Weight,Global.Financial_Max_Aid)))**2)
	for i in range((log(Global.Stats_Applicants)**3)/2.5):
		if randf() > .5:
			IQ = IQ + 1
		else:
			IQ = IQ - 1
	for i in range(10):
		IQ = IQ-((IQ-100)*.2*randf())
	#Academic Stats
	Class_Difficulty = max(0,min(1,(IQ-100)*randf()/20))
	GPA = min(4,max(0,(IQ-(60+(10*Class_Difficulty)+(20*randf())))/(10+(4*Class_Difficulty))))
	AP_History = min(5,max(0,(GPA+Class_Difficulty)*((randf()+Class_Difficulty)/1.25)))
	AP_Physics = min(5,max(0,(GPA+Class_Difficulty)*((randf()+Class_Difficulty)/1.25)))
	AP_Calculus = min(5,max(0,(GPA+Class_Difficulty)*((randf()+Class_Difficulty)/1.25)))
	AP_Language = min(5,max(0,(GPA+Class_Difficulty)*((randf()+Class_Difficulty)/1.25)))
	SAT = min(1600,max(400,(8+Class_Difficulty)*(AP_Calculus+AP_Language+1.1*IQ)))
	SAT = SAT-((SAT-1200)*0.1*randf())
	GPA = GPA-((GPA-2)*0.1*randf())
	#Legacy Status
	var LegacyFrq = (1+Global.Admissions_Legacy_Weight)*Global.Stats_AR/2000
	Legacy = 0
	if randf() < LegacyFrq:
		Legacy = 1
	#Financial Stats
	Income = 0
	for i in range(250):
		if randf() > .5:
			Income = Income + 1
		else:
			Income = Income - 1
	Income = (25000 + (250*Income*Income))*(1+Legacy)
	Cost_Living = min(Income,40000 + ((Income-40000)*(.5*randf()+.5)))
	Scholarships = max(0,(10*(SAT-1000))+((750+(5*IQ))*GPA))
	MaxCoA = max(0,(Income-Cost_Living)*(1.2-(.1*GPA))+Scholarships)*(1+Legacy)
	MinAR = 2*(1700-(SAT+(15*GPA)))/15
	StudentValue = max(4*MaxCoA*(.925**((AR-MinAR)/MinAR))-10000+10*Global.Stats_NewStudents,0)
	Admit_Score = 250*(Legacy*Global.Admissions_Legacy_Weight+1)*((((Class_Difficulty*Global.Admissions_Difficulty_Weight)+(GPA*Global.Admissions_GPA_Weight))/5)+((Global.Admissions_SAT_Weight*(SAT-400))/1200)+(((AP_History*Global.Admissions_AP_History_Weight)+(AP_Physics*Global.Admissions_AP_Physics_Weight)+(AP_Calculus*Global.Admissions_AP_Calculus_Weight)+(AP_Language*Global.Admissions_AP_Language_Weight)+(4*Global.Admissions_AP_Consistency_Weight*min(AP_Calculus,AP_History,AP_Language,AP_Physics)))/20))
	Financial_Aid = (Legacy*(Global.Financial_Legacy_Weight-1)+1)*min(max(Global.Financial_Base_Aid-Income*Global.Financial_Income_Weight,0) + max((SAT-1200)*Global.Financial_SAT_Weight/400,0) + max(Global.Financial_GPA_Weight*(GPA+Class_Difficulty*Global.Financial_Difficulty_Weight-3)/(1+Global.Financial_Difficulty_Weight),0),Global.Financial_Max_Aid)

##Stores all the values of the new applicant generated by "applicants()".
func AppendApplicants() -> void:
	Array_IQ.append(IQ)
	Array_Class_Difficulty.append(Class_Difficulty)
	Array_GPA.append(GPA)
	Array_AP_History.append(AP_History)
	Array_AP_Physics.append(AP_Physics)
	Array_AP_Calculus.append(AP_Calculus)
	Array_AP_Language.append(AP_Language)
	Array_SAT.append(SAT)
	Array_Income.append(Income)
	Array_Cost_Living.append(Cost_Living)
	Array_Scholarships.append(Scholarships)
	Array_MaxCoA.append(MaxCoA)
	Array_MinAR.append(MinAR)
	Array_Legacy.append(Legacy)
	Array_StudentValue.append(StudentValue)
	Array_Admit_Score.append(Admit_Score)
	Array_Financial_Aid.append(Financial_Aid)

##Sets all arrays to the new versions of the arrays.
func narray():
	Array_IQ = NArray_IQ.duplicate()
	Array_Class_Difficulty = NArray_Class_Difficulty.duplicate()
	Array_GPA = NArray_GPA.duplicate()
	Array_AP_History = NArray_AP_History.duplicate()
	Array_AP_Physics = NArray_AP_Physics.duplicate()
	Array_AP_Calculus = NArray_AP_Calculus.duplicate()
	Array_AP_Language = NArray_AP_Language.duplicate()
	Array_SAT = NArray_SAT.duplicate()
	Array_Income = NArray_Income.duplicate()
	Array_Cost_Living = NArray_Cost_Living.duplicate()
	Array_Scholarships = NArray_Scholarships.duplicate()
	Array_MaxCoA = NArray_MaxCoA.duplicate()
	Array_MinAR = NArray_MinAR.duplicate()
	Array_StudentValue = NArray_StudentValue.duplicate()
	Array_Legacy = NArray_Legacy.duplicate()
	Array_Admit_Score = NArray_Admit_Score.duplicate()
	Array_Financial_Aid = NArray_Financial_Aid.duplicate()
	NArray_IQ = []
	NArray_Class_Difficulty = []
	NArray_GPA = []
	NArray_AP_History = []
	NArray_AP_Physics = []
	NArray_AP_Calculus = []
	NArray_AP_Language = []
	NArray_SAT = []
	NArray_Income = []
	NArray_Cost_Living = []
	NArray_Scholarships = []
	NArray_MaxCoA = []
	NArray_MinAR = []
	NArray_StudentValue = []
	NArray_Legacy = []
	NArray_Admit_Score = []
	NArray_Financial_Aid = []

##Limits the application pool to the maximum class size.
func LimitApplicationPool(MaxPoolSize) -> void:
	LegacyStudentBody = 0
	Sorted_Admit_Score = Array_Admit_Score.duplicate()
	Sorted_Admit_Score.sort()
	MinAdmitScore = Sorted_Admit_Score[max(Applicants-(MaxPoolSize+1),0)]
	MinAdmitScore = max(MinAdmitScore,Global.Admissions_Min_Score)
	var Array2 = Array_Admit_Score.duplicate()
	Accepted = 0
	for i in range(Applicants):
		if Array2[i] >= MinAdmitScore:
			NArray_IQ.append(Array_IQ[i])
			NArray_Class_Difficulty.append(Array_Class_Difficulty[i])
			NArray_GPA.append(Array_GPA[i])
			NArray_AP_History.append(Array_AP_History[i])
			NArray_AP_Physics.append(Array_AP_Physics[i])
			NArray_AP_Calculus.append(Array_AP_Calculus[i])
			NArray_AP_Language.append(Array_AP_Language[i])
			NArray_SAT.append(Array_SAT[i])
			NArray_Income.append(Array_Income[i])
			NArray_Cost_Living.append(Array_Cost_Living[i])
			NArray_Scholarships.append(Array_Scholarships[i])
			NArray_MaxCoA.append(Array_MaxCoA[i])
			NArray_MinAR.append(Array_MinAR[i])
			NArray_StudentValue.append(Array_StudentValue[i])
			NArray_Legacy.append(Array_Legacy[i])
			NArray_Admit_Score.append(Array_Admit_Score[i])
			NArray_Financial_Aid.append(Array_Financial_Aid[i])
			Accepted = Accepted + 1
	narray()

##Simulates the process of admitted students choosing other schools.
func RemoveNonCommited() -> void:
	NewStudents = 0
	var Array2 = Array_MaxCoA.duplicate()
	var Array3 = Array_Financial_Aid.duplicate()
	var Array4 = Array_StudentValue.duplicate()
	Global.Stats_StudentValue = int(Math.median(Array4))
	Global.Stats_AverageAid = int(Math.mean(Array3))
	for i in range(len(Array2)):
		if Cost_Attendance < (Array4[i-1] + Array3[i-1]):
			NArray_IQ.append(Array_IQ[i])
			NArray_Class_Difficulty.append(Array_Class_Difficulty[i])
			NArray_GPA.append(Array_GPA[i])
			NArray_AP_History.append(Array_AP_History[i])
			NArray_AP_Physics.append(Array_AP_Physics[i])
			NArray_AP_Calculus.append(Array_AP_Calculus[i])
			NArray_AP_Language.append(Array_AP_Language[i])
			NArray_SAT.append(Array_SAT[i])
			NArray_Income.append(Array_Income[i])
			NArray_Cost_Living.append(Array_Cost_Living[i])
			NArray_Scholarships.append(Array_Scholarships[i])
			NArray_MaxCoA.append(Array_MaxCoA[i])
			NArray_MinAR.append(Array_MinAR[i])
			NArray_StudentValue.append(Array_StudentValue[i])
			NArray_Legacy.append(Array_Legacy[i])
			NArray_Admit_Score.append(Array_Admit_Score[i])
			NArray_Financial_Aid.append(Array_Financial_Aid[i])
			NewStudents = NewStudents + 1
			if Array_Legacy[i] == 1:
				LegacyStudentBody = LegacyStudentBody + 1
	narray()
	Array2 = Array_Financial_Aid.duplicate()
	Global.SLoans_TotalLoanMoney = 0
	for i in range(len(Array2)):
		Global.SLoans_TotalLoanMoney = Global.SLoans_TotalLoanMoney + payloans(i)
		Global.Money = Global.Money + 4*max(0,Cost_Attendance - (3000 + Array_Financial_Aid[i-1])) + payloans(i)

func payloans(index) -> int:
	MeanLoan = Cost_Attendance - min(Array_MaxCoA[index]+Array_Financial_Aid[index],Cost_Attendance)
	MeanDeposit = int(MeanLoan*Global.SLoans_MinDeposit + 750 + 500*randf())
	if MeanLoan > 0 and MeanDeposit > 0:
		MeanLoanPeriod = int((log((float(MeanDeposit)/MeanLoan)-(Global.SLoans_APR-1))**2)*sqrt(2))
	else:
		MeanLoanPeriod = 0
	if MeanLoanPeriod > 100:
		MeanLoanPeriod = 100
	if MeanLoanPeriod < 0:
		MeanLoanPeriod = 0
	TotalLoanMoney = MeanDeposit*MeanLoanPeriod
	return TotalLoanMoney
#endregion New Functions
