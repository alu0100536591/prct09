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
    
    @mat_block = matrizMadre.convert([[1,2,3],[4,5,6],[7,8,9]])
	 
	 
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
	
	describe "# Mayor y Menor lemento" do
	  it "Mayor elemento" do
	    @mat_A.max.should eq(4)
	  end
	  it "Menor elemento" do
	    @mat_B.min.should eq(1)
	  end
	end
	
	describe "# Espectativas para el comparador <=>" do
	  it "Las Matrices se deben de poder comparar con >" do
	    #@mat_B.should > @mat_A
	    (@mat_B > @mat_A).should eq(true)
	  end
	  it "Las Matrices se deben de poder comparar con <" do
# 	    @mat_A.should < @mat_B
	    (@mat_B < @mat_A).should eq(false)
	  end
	end
	
	describe "# Metodo encontrar con un bloque" do
	  it "Encontrar" do
	    (@mat_block.encontrar{ |e| e*e >= 16}).should == ([1,0])
	  end

	end
	
	
end
