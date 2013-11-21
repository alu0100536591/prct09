

class Matriz
	
	include Enumerable
	
	attr_reader :_fil, :_col, :_Matriz
	
	def initialize()
	end
	#-------------------------------------------------------------------
	def convert(array)
		@_fil = array.length
		@_col = array[0].length
		
		matriz_retorno = nil
		totalElementos = @_fil * @_col
		if (ContarCeros(array) % totalElementos) < 0.6
			matriz_retorno = Matriz_Densa.new(@_fil, @_col)
			matriz_retorno.copy!(array)
		else
			matriz_retorno = Matriz_Dispersa.new(@_fil, @_col)
			matriz_retorno.copy!(array)
		end	
		
		matriz_retorno
	end	
	#-------------------------------------------------------------------
	private
	def ContarCeros(array)
		nCeros = 0
		
		for i in (0...@_fil)
			for j in (0...@_col)
				if (array[i][j] == 0)
					nCeros+=1
				end
				
			end
		end 
	
		nCeros
	end
	#-------------------------------------------------------------------

end

########################################################################

class Matriz_Densa < Matriz

	def initialize(fil, col)
		@_fil, @_col = fil, col
		
		@_Matriz = Array.new{Array.new()}
		
		for i in (0...@_fil)
			@_Matriz[i] = Array.new()
		end		
	end
	#-------------------------------------------------------------------
	def read()
		for i in (0...@_fil)
			for j in (0...@_col)
				print "get element [#{i}][#{j}]: "
				value = gets
				@_Matriz[i][j] = value.to_i
			end
		end 
	end
	#-------------------------------------------------------------------
	def to_s()
		cad = ""
		for i in (0...@_fil)
			for j in (0...@_col)
				cad << "#{@_Matriz[i][j]} "
			end
			cad << "\n"
		end
		cad
	end
	#-------------------------------------------------------------------
	def copy!(other)
		@_fil = other.length
		@_col = other[0].length
		for i in (0...other.length)
			#arr = other[i]
			for j in (0...other[i].length)
				@_Matriz[i][j] = other[i][j]
			end #for j
		end #for i
	end
	#-------------------------------------------------------------------
	def +(other)
		sum = Matriz_Densa.new(@_fil, @_col)

		for i in (0...@_fil)
			for j in (0...@_col)
				sum._Matriz[i][j] = (@_Matriz[i][j] + other._Matriz[i][j])
			end			
		end

		sum
	end
	#-------------------------------------------------------------------
	def *(other)
		mult = Matriz_Densa.new(@_fil, @_col)	 
		 
		for i in (0...@_fil)
			for j in (0...other._col)
			
				aux = 0
				for k in (0...other._fil)
					aux += (@_Matriz[i][k] * other._Matriz[k][j])
				end #for 
				mult._Matriz[i][j] = aux
			
			end #for j

		end #for i
		
		mult
	end
	#-------------------------------------------------------------------
	def ==(other)
		raise TypeError, "Solo se pueden comparar matrices" unless other.is_a?Matriz_Densa
		raise RangeError, "Las filas deben ser iguales" unless @_fil == other._fil
		raise RangeError, "Las columnas deben ser iguales" unless @_col == other._col
		iguales = true
		for i in (0...@_fil)
			for j in (0...@_col)
				if (@_Matriz[i][j] != other._Matriz[i][j])
					iguales = false
				end #if
			end #for j
		end #for i
		iguales
	end
	#-------------------------------------------------------------------
	def to_mdisp() #conversion a Matriz_Dispersa
		mat_disp = Matriz_Dispersa.new(@_fil, @_col)
		mat_disp.copy!(@_Matriz)
		
		mat_disp
	end
	#-------------------------------------------------------------------
	def coerce(other) #other.class = Matriz_Dispersa
		[self, other.to_mdensa]
	end
	#-------------------------------------------------------------------	
	def each()
		for i in (0...@_fil)
			for j in (0...@_col)
				yield @_Matriz[i][j]
			end			
		end
	end
	#-------------------------------------------------------------------
end

########################################################################

class Matriz_Dispersa < Matriz

	def initialize(fil, col)
		@_fil, @_col = fil, col
		
		@_Matriz = Hash.new()
	end
	#-------------------------------------------------------------------
	def read()
		
		continue = true
		while (continue == true)
			print "intro row:"
			fil = gets
			
			print "intro column:"
			col = gets	
			
			print "intro value:"
			value = gets
			
			@_Matriz["#{fil.to_i},#{col.to_i}"] = value.to_i			
		
			#puts @_Matriz["#{fil.to_i},#{col.to_i}"]
			
			print "Continue read? true(1) or false(0): "
			otro_mas = gets
			if (otro_mas.to_i != 1)
				continue = false
			end	
		end
		
	end
	#-------------------------------------------------------------------
	def to_s()
		cad = ""
		for i in (0...@_fil)
			for j in (0...@_col)					
				if (@_Matriz.include?("#{i},#{j}"))
					value = @_Matriz["#{i},#{j}"]
					cad <<  "#{value} "
				else
					cad << "0 "
				end				
			end
			cad << "\n"
		end
		cad
	end
	#-------------------------------------------------------------------
	def copy!(other)
		@_fil = other.length
		@_col = other[0].length
		for i in (0...other.length)
			for j in (0...other[i].length)
				if (other[i][j] != 0)
					@_Matriz["#{i},#{j}"] = other[i][j].to_i
				end
			end #for j
		end #for i
	end
	#-------------------------------------------------------------------
	def +(other)
		sum = Matriz_Dispersa.new(@_fil, @_col)

		for i in (0...@_fil)
			for j in (0...@_col)
				valueA = 0
				if (@_Matriz.include?("#{i},#{j}"))
					valueA = @_Matriz["#{i},#{j}"]
				end
				
				valueB = 0
				if (other._Matriz.include?("#{i},#{j}"))
					valueB = other._Matriz["#{i},#{j}"]
				end
				
				sum._Matriz["#{i},#{j}"] = (valueA + valueB)
			end			
		end

		sum
	end
	#-------------------------------------------------------------------
	def *(other)
		mult = Matriz_Dispersa.new(@_fil, @_col)	 
		 
		for i in (0...@_fil)
			for j in (0...other._col)
			
				aux = 0
				for k in (0...other._fil)
				
					valueA, valueB = 0, 0
					if (@_Matriz.include?("#{i},#{j}")) and (other._Matriz.include?("#{i},#{j}"))
						aux += (@_Matriz["#{i},#{j}"] * other._Matriz["#{i},#{j}"])
					else
						aux += 0
					end		
					
				end #for 
				mult._Matriz["#{i},#{j}"] = aux
			
			end #for j

		end #for i
		
		mult
	end
	#-------------------------------------------------------------------
	def ==(other)
		raise TypeError, "Solo se pueden comparar matrices" unless other.is_a?Matriz_Dispersa
		raise RangeError, "Las filas deben ser iguales" unless @_fil == other._fil
		raise RangeError, "Las columnas deben ser iguales" unless @_col == other._col
		iguales = true

		if (@_Matriz != other._Matriz)
			iguales = false
		end

		iguales
	end
	#-------------------------------------------------------------------
	def each()
		for i in (0...@_fil)
			for j in (0...@_col)
				if (@_Matriz.include?("#{i},#{j}"))
					yield @_Matriz["#{i},#{j}"]
				end
			end			
		end
	end	
	#-------------------------------------------------------------------	
end


 
