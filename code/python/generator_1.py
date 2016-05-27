class generator:

	filename = raw_input("Where should I save the file? (Warning: If this file already exists, I'll delete it!\n")
	chaptertitle = raw_input("Chapter title?\n")
	exercises = raw_input("Number of exercises? (0 is fine!)\n")
	problems = raw_input("Number of problems? (0 is fine!)\n")
	
	file = open(filename,'w')
	file.write(r"\chapter{" + str(chaptertitle) + "}\n\n")
	if int(exercises) > 0:
		file.write(r"\section*{Exercises}"+"\n\n" + r"\begin{enumerate}" + "\n\n")
		for i in range(1,int(exercises) + 1):
			file.write(r"%-------------------------- EXERCISE " + str(i) + " --------------------------------\n\n" + r"\item" + "\n\n")
		file.write(r"\end{enumerate}" + "\n\n")
	if int(problems) > 0:
		file.write(r"\section*{Problems}"+"\n\n" + r"\begin{enumerate}" + "\n\n")
		for i in range(1,int(problems) + 1):
			file.write(r"%-------------------------- PROBLEM " + str(i) + " ---------------------------------\n\n" + r"\item" + "\n\n")
		file.write(r"\end{enumerate}" + "\n\n")
	file.close()
		

#	
#	LINUX INSTRUCTIONS:
#		Save the file, for instance as generator_1.py
#		Open a terminal, navigate to the correct directory
#		Run the command "python generator_1.py"
#		Follow the instructions.
#	WINDOWS INSTRUCTIONS:
#		Install linux
#		Follow linux instructions
#	
#	Code written by Andrew Maurer.  Anyone is free to use, modify
#	and distribute code with or without acknowledgement. Andrew's
#	(soon to be moved) website is "people.umass.edu/abmaurer" and
#	his contact information is available there.
#
