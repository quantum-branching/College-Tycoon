extends Button
var APR:float = 1
var MaxLoanPerYear:int = 0
var MinDeposit:float = 0
var MeanLoanPeriod:int = 0
var MeanLoan:int = 0
var MeanDeposit:int = 0
var TotalLoanMoney:int = 0

func _ready():
	APR = Global.SLoans_APR
	MaxLoanPerYear = Global.SLoans_MaxLoanPerYear
	MinDeposit = Global.SLoans_MinDeposit
func _pressed():
	Global.SettingsTab = 3
	#New UI Setup
	$"../Exit".ResetSettings()
	$"../SpinBox1".prefix = "APR%: "
	$"../SpinBox2".prefix = "Max Loan Per Year: "
	$"../SpinBox3".prefix = "Min Deposit%: "
	#Visibility
	$"../SpinBox4".visible = false
	$"../SpinBox5".visible = false
	$"../SpinBox6".visible = false
	$"../SpinBox7".visible = false
	$"../SpinBox8".visible = false
	$"../SpinBox9".visible = false
	$"../SpinBox10".visible = false
	#Range
	$"../SpinBox1".min_value = 0
	$"../SpinBox1".max_value = 50
	$"../SpinBox2".min_value = 0
	$"../SpinBox2".max_value = 100000
	$"../SpinBox3".min_value = 0
	$"../SpinBox3".max_value = 100
	#Step Value (Typed)
	$"../SpinBox1".step = .01
	$"../SpinBox2".step = 50
	$"../SpinBox3".step = .1
	#Step Value (Arrows)
	$"../SpinBox1".custom_arrow_step = .1
	$"../SpinBox2".custom_arrow_step = 250
	$"../SpinBox3".custom_arrow_step = 1
	#Set Value
	$"../SpinBox1".value = 100*(APR-1)
	$"../SpinBox2".value = MaxLoanPerYear
	$"../SpinBox3".value = 100*MinDeposit
func _process(_delta):
	if Global.SettingsTab == 3:
		flat = true
		#Calls values from Value Boxes
		APR = 1+(0.01*$"../SpinBox1".value)
		MaxLoanPerYear = $"../SpinBox2".value
		MinDeposit = 0.01*$"../SpinBox3".value
		#Saves values to Global
		Global.SLoans_APR = APR
		Global.SLoans_MaxLoanPerYear = MaxLoanPerYear
		Global.SLoans_MinDeposit = MinDeposit
	else:
		flat = false
