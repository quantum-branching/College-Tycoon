extends Button

func _pressed():
	Global.Cost_Professors_College_Attended.append($"../Applicant Info".CollegeAttended)
	Global.Cost_Professors_Degree.append($"../Applicant Info".DegreeNumber)
	Global.Cost_Professors_Salary.append($"../Applicant Info".ExpectedSalary)
	Global.Cost_Professors_Class_Size.append($"../Applicant Info".MaxClassSize)
	Global.Cost_Professors_Donation.append($"../Applicant Info".Donations)
	$"../Applicant Info".ButtonPressed = true
