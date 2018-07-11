module ClassesNotifications
  def successful_creation
    puts "объект типа #{self.class} успешно создан"
  end

  def invalid_number
    puts "номер указан некорректно (формат номера 'ХХХ-ХХ')"
  end

  def invalid_type
    puts %(тип поезда / вагона указан некорректно
    (допустимые типы: 'Cargo', 'Passenger'))
  end

  def invalid_name
    puts 'название указано некорректно или не указано'
  end

  def invalid_station
    puts 'указанный объект не является объектом типа Станция'
  end

  def same_station
    puts 'указана одна и та же станция в качестве начальной / конечной'
  end

  def no_places(place)
    puts "недостаточно #{place}"
  end

  def places_error
    puts 'значение не может быть меньше ноля'
  end
end
