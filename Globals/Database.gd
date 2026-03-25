extends Node

#Level Variables
#Level 1 ----- Acceptance Rate < 10%
#Level 2 ----- Acceptance Rate < 25%
#Level 3 ----- Acceptance Rate < 50%
#Level 4 ----- Acceptance Rate < 75%
#Level 5 ----- Acceptance Rate < 90%
#Level 6 ----- Acceptance Rate > 90%

#Size Variables
#Big --------- Undergraduates > 1500
#Small ------- Undergraduates < 1500

##This function gets a random school given it's prestige, size, and if it is public. The higher the Level value (anywhere from 1 to 6) is the more presitigous the school is.
func getschool(Level:int,Big:bool,Public:bool) -> String:
	var RandSchool = randi_range(1,5)
	if Level == 1:
		if Big == true:
			if Public == true:
				return "University of California - Los Angeles"
			else:
				return "Cornell University"
		else:
			if Public == true:
				return "University of California - Los Angeles"
			else:
				if RandSchool == 1:
					return "Harvard University"
				if RandSchool == 2:
					return "Yale University"
				if RandSchool == 3:
					return "Stanford University"
				if RandSchool == 4:
					return "Princeton University"
				if RandSchool == 5:
					return "Massachussets Institute of Technology"
	if Level == 2:
		if Big == true:
			if Public == true:
				if RandSchool == 1 or RandSchool == 4:
					return "University of California - Berkeley"
				if RandSchool == 2 or RandSchool == 5:
					return "University of California - Irvine"
				if RandSchool == 3:
					return "University of Michigan - Ann Arbor"
			else:
				if RandSchool == 1:
					return "Carnegie Mellon University"
				if RandSchool == 2:
					return "University of Notre Dame"
				if RandSchool == 3:
					return "University of South California"
				if RandSchool == 4:
					return "New York University"
				if RandSchool == 5:
					return "Boston University"
		else:
			if Public == true:
				return "University of South Florida - St. Petersburg"
			else:
				if RandSchool == 1 or RandSchool == 4:
					return "Wellesley College"
				if RandSchool == 2 or RandSchool == 5:
					return "Harvey Mudd College"
				if RandSchool == 3:
					return "Amherst College"
	if Level == 3:
		if Big == true:
			if Public == true:
				if RandSchool == 1:
					return "University of Texas - Austin"
				if RandSchool == 2:
					return "University of Washington"
				if RandSchool == 3:
					return "University of Georgia"
				if RandSchool == 4:
					return "University of South Florida"
				if RandSchool == 5:
					return "California State University - Long Beach"
			else:
				if RandSchool == 1 or RandSchool == 4:
					return "George Washington University"
				if RandSchool == 2 or RandSchool == 5:
					return "Worcester Polytechnic Institute"
				if RandSchool == 3:
					return "Rensselaer Polytechnic Institute"
		else:
			if Public == true:
				if RandSchool == 1 or RandSchool == 4:
					return "Florida A&M University"
				if RandSchool == 2 or RandSchool == 5:
					return "University of Missouri - St. Louis"
				if RandSchool == 3:
					return "University of Montana - Western"
			else:
				if RandSchool == 1:
					return "Trinity College - Connecticut"
				if RandSchool == 2:
					return "Whitman College"
				if RandSchool == 3:
					return "University of Dallas"
				if RandSchool == 4:
					return "Oberlin College"
				if RandSchool == 5:
					return "Fordham University"
	return ""
##This function takes a number and converts it into a degree
func getdegree(DegreeNumber) -> String:
	if DegreeNumber == 1:
		return "Anthropology"
	if DegreeNumber == 2:
		return "Art"
	if DegreeNumber == 3:
		return "Biology"
	if DegreeNumber == 4:
		return "Business"
	if DegreeNumber == 5:
		return "Chemistry"
	if DegreeNumber == 6:
		return "Computer Science"
	if DegreeNumber == 7:
		return "Economics"
	if DegreeNumber == 8:
		return "Engineering"
	if DegreeNumber == 9:
		return "English"
	if DegreeNumber == 10:
		return "Environmental Science"
	if DegreeNumber == 11:
		return "Food and Nutrition"
	if DegreeNumber == 12:
		return "Film and Photography"
	if DegreeNumber == 13:
		return "Foreign Language"
	if DegreeNumber == 14:
		return "History"
	if DegreeNumber == 15:
		return "Math"
	if DegreeNumber == 16:
		return "Physics"
	if DegreeNumber == 17:
		return "Political Science"
	if DegreeNumber == 18:
		return "Psychology"
	if DegreeNumber == 19:
		return "Public Health"
	if DegreeNumber == 20:
		return "Sociology"
	return ""

##This function gets the average salary for someone with a specific degree.
func AverageDegreeSalary(DegreeNumber) -> int:
	if DegreeNumber == 1:
		return 63_800
	if DegreeNumber == 2:
		return 51_660
	if DegreeNumber == 3:
		return 60_000
	if DegreeNumber == 4:
		return 71_000
	if DegreeNumber == 5:
		return 84_650
	if DegreeNumber == 6:
		return 88_250
	if DegreeNumber == 7:
		return 70_000
	if DegreeNumber == 8:
		return 91_250
	if DegreeNumber == 9:
		return 58_500
	if DegreeNumber == 10:
		return 78_750
	if DegreeNumber == 11:
		return 69_750
	if DegreeNumber == 12:
		return 48_000
	if DegreeNumber == 13:
		return 58_750
	if DegreeNumber == 14:
		return 62_000
	if DegreeNumber == 15:
		return 98_750
	if DegreeNumber == 16:
		return 61_000
	if DegreeNumber == 17:
		return 90_000
	if DegreeNumber == 18:
		return 92_750
	if DegreeNumber == 19:
		return 80_000
	if DegreeNumber == 20:
		return 65_000
	return 0
