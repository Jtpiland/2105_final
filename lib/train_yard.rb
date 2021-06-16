require './lib/car'
require './lib/train'

class TrainYard
  attr_reader :location,
              :trains

  def initialize(train_yard_info)
    @location = train_yard_info[:location]
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def types_of_trains
    types = []
    @trains.each do |train|
      types << train.type
    end
    sorted = types.sort
    sorted.uniq
  end

  def trains_containing(car)
    trains_containing_car = []
    @trains.each do |train|
      if train.cargo.include?(car)
        trains_containing_car << train
      end
    end
    trains_containing_car
  end
end
