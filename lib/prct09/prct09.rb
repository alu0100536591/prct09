require 'Matriz.rb'


	MatrizMadre = Matriz.new()
	puts "MATRICES DENSAS"
	puts "Mat_A"
	Mat_A = MatrizMadre.convert([[1, 2], [3, 4]])
	puts Mat_A.to_s
	puts Mat_A.class
	
	puts "Mat_B"
	Mat_B = MatrizMadre.convert([[2, 3], [7, 1]])
	puts Mat_B.to_s
	puts Mat_B.class
	
	puts ""
	puts "Sum A+B:"
	puts (Mat_A + Mat_B).to_s
	
	puts ""
	puts "Prod A*B:"
	puts (Mat_A * Mat_B).to_s
	
	#---------------------------------------------
	
	puts "MATRICES DISPERSAS"
	puts "Mat_C"
	Mat_C = MatrizMadre.convert([[1, 0], [0, 0]])
	puts Mat_C.to_s
	puts Mat_C.class

	
	puts "Mat_D"
	Mat_D = MatrizMadre.convert([[4, 0], [0, 0]])
	puts Mat_D.to_s
	puts Mat_D.class
	
	puts ""
	puts "Sum C+D:"
	puts (Mat_C + Mat_D).to_s
	
	puts ""
	puts "Prod C*D:"
	puts (Mat_C * Mat_D).to_s
	
	

