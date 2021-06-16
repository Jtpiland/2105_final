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

  def sorted_cargo_list
    cargo_list = []
    @trains.each do |train|
      train.cargo.each do |car, number_of_cars|
        cargo_list << car.type
      end
    end
    sorted_cargo = cargo_list.sort
    sorted_cargo.uniq
  end

  def total_inventory
    @inventory_hash = Hash.new { |hash, key| hash[key] = 0 }
    @trains.each do |train|
      train.cargo.each do |car, number_of_cars|
      @inventory_hash[car] += number_of_cars
      end
    end
    @inventory_hash
  end

  def overflow_cars
    overflow = []
    total_inventory.each do |car, number_of_cars|
      if @inventory_hash[car] > 10 && trains_containing(car).length > 1
        overflow << car
      end
    end
    overflow
  end
end
