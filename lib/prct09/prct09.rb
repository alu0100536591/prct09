require "lib/prct09/Matriz.rb"


	MatrizMadre = Matriz.new()
	puts "MATRICES DENSAS"
	puts ""
	puts "Mat_A"
	Mat_A = MatrizMadre.convert([[1, 2], [3, 4]])
	puts "#{Mat_A}"
	puts "Clase de Mat_A: #{Mat_A.class}"
	
	puts ""
	
	puts "Mat_B"
	Mat_B = MatrizMadre.convert([[2, 3], [7, 1]])
	puts "#{Mat_B}"
	puts "Clase de Mat_B: #{Mat_B.class}"
	
	puts ""
	
	puts "Sum A+B:"
	puts "#{(Mat_A + Mat_B)}"
	
	puts ""
	
	puts "Prod A*B:"
	puts "#{(Mat_A * Mat_B)}"
	
	#---------------------------------------------
	
	puts "MATRICES DISPERSAS"
	puts ""
	puts "Mat_C"
	Mat_C = MatrizMadre.convert([[1, 0], [0, 0]])
	puts "#{Mat_C.to_s}"
	puts "Clase de Mat_C: #{Mat_C.class}"

	puts ""
	
	puts "Mat_D"
	Mat_D = MatrizMadre.convert([[4, 0], [0, 0]])
	puts "#{Mat_D}"
	puts "Clase de Mat_D: #{Mat_D.class}"
	
	puts ""
	puts "Sum C+D:"
	puts "#{(Mat_C + Mat_D)}"
	
	puts ""
	puts "Prod C*D:"
	puts "#{(Mat_C * Mat_D)}"
	
	

