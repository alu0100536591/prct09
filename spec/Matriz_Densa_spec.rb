# require "lib/prct09/Matriz.rb"
require_relative '../lib/prct09/Matriz.rb'

describe Matriz_Densa do
  before :each do
    matrizMadre = Matriz.new()
    @mat_A = matrizMadre.convert([[1, 2], [3, 4]])
    @mat_B = matrizMadre.convert([[2, 3], [7, 1]])
	 @mat_Datos = matrizMadre.convert([[1, 2], [3, 4]])
	 @result_sum = matrizMadre.convert([[3, 5], [10, 5]])
	 @result_mult = matrizMadre.convert([[16, 5], [34, 13]])
  end
  
  describe "# Tamanyo de la matriz " do
		it "Debe existir un numero de filas" do
			@mat_B._fil.should eq(2)
		end
		it "Debe existir un numero de columnas" do
			@mat_B._fil.should eq(2)
		end
	end
  
	describe "# Comprobando que la matriz no esta vacia" do
		it "La matriz debe contener datos" do
			@mat_A.should == @mat_Datos
		end
	end
	
	describe "# Suma de matrices" do
		it "Se deben poder sumar dos matrices" do
			sum = (@mat_A + @mat_B)
			sum.should == @result_sum
		end
	end
	
	describe "# Multiplicacion de matrices" do
		it "Se deben poder multiplicar dos matrices" do
			mult = (@mat_A * @mat_B)
			mult.should == @result_mult
		end
	end
	
end
