# require "lib/prct09/Matriz.rb"
require_relative '../lib/prct09/Matriz.rb'

describe Matriz_Dispersa do
  before :each do
    matrizMadre = Matriz.new()
    @mat_C = matrizMadre.convert([[1, 0], [0, 0]])
    @mat_D = matrizMadre.convert([[4, 0], [0, 0]])
	 @mat_Datos = matrizMadre.convert([[1, 0], [0, 0]])
	 @result_sum = matrizMadre.convert([[5, 0], [0, 0]])
	 @result_mult = matrizMadre.convert([[8, 0], [0, 0]])
  end
  
  describe "# Tamanyo de la matriz " do
		it "Debe existir un numero de filas" do
			@mat_D._fil.should eq(2)
		end
		it "Debe existir un numero de columnas" do
			@mat_D._fil.should eq(2)
		end
	end
  
	describe "# Comprobando que la matriz no esta vacia" do
		it "La matriz debe contener datos" do
			@mat_C.should == @mat_Datos
		end
	end
	
	describe "# Suma de matrices" do
		it "Se deben poder sumar dos matrices" do
			sum = (@mat_C + @mat_D)
			sum.should == @result_sum
		end
	end
	
	describe "# Multiplicacion de matrices" do
		it "Se deben poder multiplicar dos matrices" do
			mult = (@mat_C * @mat_D)
			mult.should == @result_mult
		end
	end
	
end
