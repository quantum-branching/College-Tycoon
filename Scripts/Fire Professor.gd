extends Button
func _pressed():
	Global.Cost_Professors_College_Attended.remove_at($"../Professor Info".ProfNo)
	Global.Cost_Professors_Degree.remove_at($"../Professor Info".ProfNo)
	Global.Cost_Professors_Salary.remove_at($"../Professor Info".ProfNo)
	Global.Cost_Professors_Class_Size.remove_at($"../Professor Info".ProfNo)
	Global.Cost_Professors_Donation.remove_at($"../Professor Info".ProfNo)
	$"../Professor Info".ProfNo = $"../Professor Info".ProfNo - 1
