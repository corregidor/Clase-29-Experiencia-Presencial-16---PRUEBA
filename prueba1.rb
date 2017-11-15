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
      calculo_promedio = (arreglo[1].to_i + arreglo[2].to_i + arreglo[3].to_i + arreglo[4].to_i + arreglo[5].to_i)/5.0 # calcula el promedio con decimales (float) porque lo dividi por un decimal
      nombre = arreglo[0]
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
    puts "Se ha generado el archivo de promedios."
  end


  if opcion.to_i == 2
    file = File.open('notas.csv', 'r')
    data = file.readlines
    file.close

    arreglo_inasistencias_totales = []
    arreglo_cuenta = 0

    data.each do |line|
      arreglo = line.split (', ')
      nombre = arreglo[0]
      inasistencias = arreglo.count("A") + arreglo.count("A\n")
      puts(nombre, inasistencias)
    end
  end

end
