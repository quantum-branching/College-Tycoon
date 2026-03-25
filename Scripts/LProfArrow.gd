extends TextureButton
func _pressed():
	if $"../Professor Info".ProfNo > 1:
		$"../Professor Info".ProfNo = $"../Professor Info".ProfNo - 1
