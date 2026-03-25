##Allows additional math this there is no operator or function available for.
extends Node

##Returns an array that is the product of the two input arrays.[br][br][b]Example:[/b][codeblock]print(ArrayMultiply([1,2,3,4,5],[5,4,3,2,1])) #Returns [5,8,9,8,5][/codeblock]
func ArrayMultiply(Array1:Array,Array2:Array) -> Array:
	var length = min(len(Array1),len(Array2))
	var ResultArray = []
	for i in range(length):
		if Array1[i] is int or Array1[i] is float:
			if Array2[i] is int or Array2[i] is float:
				ResultArray.append((Array1[i])*(Array2[i]))
			else:
				ResultArray.append(0)
		else:
			ResultArray.append(0)
	return ResultArray

##Returns mean or average value of the input array.[br][br][b]Example:[/b][codeblock]print(mean([1,2,3,4,5,6,7])) #Returns 4[/codeblock]
func mean(Numbers:Array) -> float:
	if len(Numbers) > 0:
		return sum(Numbers)/len(Numbers)
	else:
		return 0


func median(Numbers:Array) -> float:
	var Num2:Array = Numbers.duplicate()
	Num2.sort()
	var NumIndex:float = float(len(Numbers))/2
	var Result:float = 0
	if not int(NumIndex) == NumIndex:
		Result = (Num2[NumIndex-1.5] + Num2[NumIndex-.5])/2
	else:
		if NumIndex > 0:
			Result = Num2[NumIndex-1]
		else:
			Result = 0
	return Result

##Multipies an [Array] by a constant (such as a [float] or [int]). This is a component-wise operation, meaning it multiplies each component separately of each other. [br][br][b]Example:[/b][codeblock]print(MultiplyArray([1,2,3,4],0.15)) #Returns [0.15,0.3,0.45,0.6][/codeblock]
func MultiplyArray(Numbers:Array,Constant:float) -> Array:
	var Result:Array = Numbers
	for i in range(len(Numbers)):
		if Numbers[i] is float or Numbers[i] is int:
			Result[i] = Constant*Numbers[i]
		else:
			Result[i] = Numbers[i]
	return Result

##Returns the sum of the input array.[br][br][b]Example:[/b][codeblock]print(sum([1,2,3,4,5,6,7])) #Returns 28[/codeblock]
func sum(Numbers:Array) -> float:
	var Sum = 0
	var length = len(Numbers)
	for index in range(length):
		if Numbers[index-1]:
			Sum = Sum + float(Numbers[index-1])
	return Sum


func NumToText(Number:float):
	var length:int = 0
	if abs(Number) > 0:
		length = 1+int(log(abs(Number))/log(10)+0.00001)
	if abs(Number)<1:
		length = 1
	var NumText = ""
	var Num:int = int(abs(Number))
	for i in length:
		if i%3 == 0 and not i == 0:
			NumText = "".join([",",NumText])
		NumText = "".join([Num%10,NumText])
		Num = int(float(Num)/10)
	if Number < 0:
		NumText = "".join(["-",NumText])
	return NumText

##Returns the distance between two [Vector2] variables.[br][br][b]Example:[/b][codeblock]var Distance:float = Vector2Distance(Vec1:Vector2,Vec2:Vector2)[/codeblock]
func Vector2Distance(Vec1:Vector2,Vec2:Vector2) -> float:
	return sqrt(((Vec1.x-Vec2.x)**2)+((Vec1.y-Vec2.y)**2))

##Returns the distance between two [Vector3] variables.[br][br][b]Example:[/b][codeblock]var Distance:float = Vector3Distance(Vec1:Vector3,Vec2:Vector3)[/codeblock]
func Vector3Distance(Vec1:Vector3,Vec2:Vector3):
	return sqrt(((Vec1.x-Vec2.x)**2)+((Vec1.y-Vec2.y)**2)+((Vec1.z-Vec2.z)**2))
