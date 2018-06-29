module InterfaceSupport
  def first_question_pack
    puts ' '
    puts '1 - работа со станциями'
    puts '2 - работа с маршрутами'
    puts '3 - работа с поездами'
    puts '0 - выход'
    puts '9 - seed'
    print '> '
    answer = gets.to_i
  end

  def station_question_pack
    puts ' '
    puts '1 - создать станцию'
    puts '2 - список поездов на станции'
    puts '0 - назад'
    print '> '
    answer = gets.to_i
  end

  def route_question_pack
    puts ' '
    puts '1 - создать маршрут'
    puts '2 - добавить станцию в маршрут'
    puts '3 - удалить станцию из маршрута'
    puts '4 - список станций маршрута'
    puts '0 - назад'
    print '> '
    answer = gets.to_i
  end

  def train_question_pack
    puts ' '
    puts '1 - создать грузовой поезд'
    puts '2 - создать пассажирский поезд'
    puts '3 - назначить маршрут поезду'
    puts '4 - добавить вагон'
    puts '5 - отцепить вагон'
    puts '6 - движение на одну станцию вперед'
    puts '7 - движение на одну станцию назад'
    puts '0 - назад'
    print '> '
    answer = gets.to_i
  end


  def station_name_input
    puts 'введите название станции'
    print '> '
  end

  def station_number_input
    puts 'введите номер станции'
    print '> '
  end

  def first_station_number_input
    puts 'введите номер начальной станции'
    print '> '
  end

  def last_station_number_input
    puts 'введите номер конечной станции'
    print '> '
  end

  def route_number_input
    puts 'введите номер маршрута'
    print '> '
  end

  def train_id_input
    puts 'укажите идентификатор поезда'
    print '> '
  end

  def train_number_input
    puts 'введите порядковый номер поезда'
    print '> '
  end

  def remove_wagon_input
    puts 'укажите вагон к удалению'
    print '> '
  end

  def error_message
    puts 'объект не обнаружен, повторите операцию'
  end

  def no_wagons_error
    puts 'у выбранного поезда нет вагонов'
  end

  def successful_creation
    puts "объект типа #{self.class} успешно создан"
  end

  def invalid_number
    puts "номер указан некорректно (формат номера 'ХХХ-ХХ')"
  end

  def invalid_type
    puts "тип поезда / вагона указан некорректно (допустимые типы: 'Cargo', 'Passenger')"
  end

  def invalid_name
    puts "название указано некорректно или не указано"
  end
end
