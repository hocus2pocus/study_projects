class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_trains
    @trains.each.with_index(1) do |train, index|
      puts "#{index} - тип: #{train.type} - #{train.wagons.count} вагон / вагонов"
    end
  end
end
