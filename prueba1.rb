continuar = true #variable es verdadera hasta que usuario decida que es falsa.
prompt = "> "

while continuar == true
  puts '-----------------------'
  puts '[1] Promedio del alumno'
  puts '[2] Inasistencias'
  puts '[3] Alumnos aprobados'
  puts '[4] Salir'
  puts '-----------------------'

  print prompt

  opcion = gets # me permite ingresar en el temrinal un letra/número
print opcion
#[1] Promedio del alumno
  if opcion.to_i == 1
    file = File.open('notas.csv', 'r')
    data = file.readlines # retorna un arreglo donde cada linea es un elmento del archivo
    file.close

    arreglo_totales = []

    data.each do |line| # recorrer cada line
      arreglo = line.split(', ') # me sapara los datos por ", "
      nombre = arreglo[0]
      calculo_promedio = (arreglo[1].to_i + arreglo[2].to_i + arreglo[3].to_i + arreglo[4].to_i + arreglo[5].to_i)/5.0 # calcula el promedio con decimales (float) porque lo dividi por un decimal
      promedio_alumno = [nombre, calculo_promedio] # primera vuelta toma el caluclo de nota de la primera persona ej ['David', 3.6]
      arreglo_totales.push(promedio_alumno) # con el push agrego un elemento al final del arreglo, en este caso un nuevo arreglo [['David', 10], ['Mai', 7]]

      #arreglo_totales
      #[['David, 7.6'], ['Mai', 6.5], ['Gonzalo', 8], ['JP', 10]]
      file_calculo = File.open('notas_calculadas', 'w')
      arreglo_totales.each do |alumno_con_su_promedio|
        file_calculo.puts "#{alumno_con_su_promedio[0]}, #{alumno_con_su_promedio[1]}"
      end
      file_calculo.close
    end
    puts 'Se ha generado el archivo de promedios de los alumnos.'
  end

#[2] Inasistencias
  if opcion.to_i == 2
    file = File.open('notas.csv', 'r')
    data = file.readlines
    #puede haberse filtrado el \n aca con
    #  data = file.readlines.map{ |r| r.chomp}
    file.close

    inasistencia_alumno = []

    data.each do |line|
      arreglo = line.split (', ')
      nombre = arreglo[0]
      calculo_inasistencias = arreglo.count("A") + arreglo.count("A\n")
      # en el caso de filtrar no es necesario colocar  arreglo.count("A\n"
      #   calculo_inasistencias = arreglo.count("A")
      inasistencia_alumno.push([nombre, calculo_inasistencias])
    end

    inasistencia_alumno.each do |ele|
      puts "#{ele.first} tuvo #{ele.last} inasistencias."
    end
  end

#[3] Alumnos aprobados
def aprobados(nota = 5.0)
  file = File.open('notas.csv', 'r')
  data = file.readlines
  file.close

  data.each do |line|
    arreglo = line.split(', ') # me sapara los datos por ", "
    nombre = arreglo[0]
    if aprobado = (arreglo[1].to_i + arreglo[2].to_i + arreglo[3].to_i + arreglo[4].to_i + arreglo[5].to_i)/5.0 >= nota
      # puts nombre
      puts "#{nombre} aprobo."
      #sería bueno como código agregar un else, pese a que no lo pide el ejercicio, ya que te pones en el caso atipico
      #tenlo en consideración a futuro,
      #para programar siempre debes considerar casos nulos, cero o que se alejen de lo pedido como una posibilidad
    end
  end
end
  if opcion.to_i == 3
    aprobados(5)
  end

#[3] Salir
  if opcion.to_i == 4
    abort('¡Nos vemos pronto!') #termina el programa
  end

#[otra opción] al poner otra opción muestra que es inválida y arroja nuevamente el menú y la posibilidad de volver a ingresar una opción
  if opcion.to_i > 4
    #  if opcion.to_i > 4 || opcion.to_i < 1 es una opcion más corta, sin embargo resuelve el problema
    #trata de buscar no repetir codigo
    puts 'Opción Invalida. Por favor ingresa una opción del 1 al 4.'
  end


  if opcion.to_i < 1
    puts 'Opción Invalida. Por favor ingresa una opción del 1 al 4.'
  end

end
