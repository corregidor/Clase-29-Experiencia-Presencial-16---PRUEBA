continuar = true #variable es verdadera hasta que usuario decida que es falsa.
prompt = "> "

while continuar == true
  puts '-----------------------'
  puts '[1] Promedio del alumno'
  puts '[2] Inasisetncias'
  puts '[3] Alumnos aprobados'
  puts '[4] Salir'
  puts '-----------------------'

  print prompt

  opcion = gets # me permite ingresar en el temrinal un letra/número

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


  if opcion.to_i == 2
    file = File.open('notas.csv', 'r')
    data = file.readlines
    file.close

    # arreglo_inasistencias_totales = [] #NO SE SI ESTA DE MÁS
    arreglo_cuenta = 0

    data.each do |line|
      arreglo = line.split (', ')
      nombre = arreglo[0]
      calculo_inasistencias = arreglo.count("A") + arreglo.count("A\n")
      inasistencia_alumno = [nombre, calculo_inasistencias]
      puts(inasistencia_alumno)
    end
  end

  if opcion.to_i == 3 #CORREGIR!!! HAY QUE HACERLO CON UN MÉTODO
    file = File.open('notas.csv', 'r')
    data = file.readlines
    file.close

    arreglo_aprobado = []

    data.each do |line|
      arreglo = line.split(', ') # me sapara los datos por ", "
      nombre = arreglo[0]
      if aprobado = (arreglo[1].to_i + arreglo[2].to_i + arreglo[3].to_i + arreglo[4].to_i + arreglo[5].to_i)/5.0 >= 5.0
        puts nombre
      end
    end
  end

  if opcion.to_i == 4
    abort('¡Nos vemos pronto!') #termina el programa
  end

  if opcion.to_i > 4
    puts 'Opción Invalida. Por favor ingresa una opción del 1 al 4.'
  end

  if opcion.to_i < 1
    puts 'Opción Invalida. Por favor ingresa una opción del 1 al 4.'
  end

end
