# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Matriz_Densa

require_relative '../lib/prct09/Matriz.rb'
require 'test/unit'

class Test_Matriz_Densa < Test::Unit::TestCase
  
  def setup
    matrizMadre = Matriz.new()
    @mat_A = matrizMadre.convert([[1, 2], [3, 4]])
    @mat_B = matrizMadre.convert([[2, 3], [7, 1]])
  end
  
  def test_initialize
    assert_equal("1 2 \n3 4 \n", @mat_A.to_s)
    assert_equal("2 3 \n7 1 \n", @mat_B.to_s)
  end
  
  def test_clase
    assert_equal("Matriz_Densa", @mat_A.class.to_s)
    assert_equal("Matriz_Densa", @mat_B.class.to_s)
  end
  
  def test_sum
    m_sum = @mat_A + @mat_B
    assert_equal("3 5 \n10 5 \n", m_sum.to_s)
  end
  
  def test_mult
    m_mult = @mat_A * @mat_B
    assert_equal("16 5 \n34 13 \n", m_mult.to_s)
  end
  
end
