# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Matriz_Dispersa

require "lib/prct09/Matriz.rb"
require "test/unit"

class Test_Matriz_Dispersa < Test::Unit::TestCase
  
  def setup
    matrizMadre = Matriz.new()
    @mat_C = matrizMadre.convert([[1, 0], [0, 0]])
    @mat_D = matrizMadre.convert([[4, 0], [0, 0]])
  end
  
  def test_initialize
    assert_equal("1 0 \n0 0", @mat_C.to_s)
    assert_equal("4 0 \n0 0", @mat_D.to_s)
  end
  
  def test_clase
    assert_equal("Matriz_Dispersa", @mat_C.class.to_s)
    assert_equal("Matriz_Dispersa", @mat_D.class.to_s)
  end
  
  def test_sum
    m_sum = @mat_C + @mat_D
    assert_equal("5 0 \n0 0", m_sum.to_s)
  end
  
  def test_mult
    m_mult = @mat_C * @mat_D
    assert_equal("8 0 \n0 0", m_mult.to_s)
  end
  
end
