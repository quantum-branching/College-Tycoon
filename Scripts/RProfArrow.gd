extends TextureButton
func _pressed():
	if $"../Professor Info".ProfNo < len(Global.Cost_Professors_College_Attended) - 1:
		$"../Professor Info".ProfNo = $"../Professor Info".ProfNo + 1
