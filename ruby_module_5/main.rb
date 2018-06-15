require_relative 'engine.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_wagon.rb'
require_relative 'passenger_wagon.rb'

def first_question_pack
  puts '1 - работа со станциями'
  puts '2 - работа с маршрутами'
  puts '3 - работа с поездами'
  puts '0 - выход'
  puts '9 - seed'
  print '> '

  answer = gets.to_i

  case answer
    when 1
      station_question_pack

    when 2
      route_question_pack

    when 3
      train_question_pack

    when 9
      Engine.seed
      first_question_pack

    when 0
      exit
  end
end

def station_question_pack
  puts '1 - создать станцию'
  puts '2 - список поездов на станции'
  puts '0 - назад'
  print '> '

  answer = gets.to_i

  case answer
    when 1
      Engine.create_station
      station_question_pack

    when 2
      Engine.trains_on_station
      station_question_pack

    when 0
      first_question_pack
  end
end

def route_question_pack
  puts '1 - создать маршрут'
  puts '2 - добавить станцию в маршрут'
  puts '3 - удалить станцию из маршрута'
  puts '4 - список станций маршрута'
  puts '0 - назад'
  print '> '

  answer = gets.to_i

  case answer
    when 1
      Engine.create_route
      route_question_pack

    when 2
      Engine.add_station
      route_question_pack

    when 3
      Engine.delete_station
      route_question_pack

    when 4
      Engine.route_stations
      route_question_pack

    when 0
      first_question_pack
  end
end

def train_question_pack
  puts '1 - создать поезд'
  puts '2 - назначить маршрут поезду'
  puts '3 - добавить вагон'
  puts '4 - отцепить вагон'
  puts '5 - движение на одну станцию вперед'
  puts '6 - движение на одну станцию назад'
  puts '0 - назад'
  print '> '

  answer = gets.to_i

  case answer
    when 1
      Engine.create_train
      train_question_pack

    when 2
      Engine.set_route
      train_question_pack

    when 3
      Engine.add_wagon
      train_question_pack

    when 4
      Engine.remove_wagon
      train_question_pack

    when 5
      Engine.train_forward
      train_question_pack

    when 6
      Engine.train_backward
      train_question_pack

    when 0
      first_question_pack
  end
end

first_question_pack
