extends Label
func _process(_delta):
	text = "".join(["$",Math.NumToText(Global.Money)])
