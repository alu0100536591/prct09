require 'Matriz.rb'

	puts "MATRICES DENSAS"
	puts "Mat_A"
	Mat_A = Matriz_Densa.new(2,2)
	Mat_A.copy!([[1, 2], [3, 4]])
	puts Mat_A.to_s
	Mat_A.read()
	puts Mat_A.to_s
	
	puts "Mat_B"
	Mat_B = Matriz_Densa.new(2,2)
	Mat_B.read()
	puts Mat_B.to_s
	
	puts ""
	puts "Sum A+B:"
	puts (Mat_A + Mat_B).to_s
	
	puts ""
	puts "Prod A*B:"
	puts (Mat_A * Mat_B).to_s
	
	#---------------------------------------------
	
	puts "MATRICES DISPERSAS"
	puts "Mat_C"
	Mat_C = Matriz_Dispersa.new(2,2)
	Mat_C.copy!([[1, 0], [0, 0]])
	puts Mat_C.to_s
	Mat_C.read()
	puts Mat_C.to_s
	
	puts "Mat_D"
	Mat_D = Matriz_Dispersa.new(2,2)
	Mat_D.read()
	puts Mat_D.to_s
	
	puts ""
	puts "Sum C+D:"
	puts (Mat_C + Mat_D).to_s
	
	puts ""
	puts "Prod C*D:"
	puts (Mat_C * Mat_D).to_s
	
	

