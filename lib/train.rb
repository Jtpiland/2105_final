require './lib/car'

class Train
  attr_reader :name,
              :type,
              :cargo

  def initialize(train_info)
    @name = train_info[:name]
    @type = train_info[:type]
    @cargo = Hash.new { |hash, key| hash[key] = 0 }
    @car_count = 0
  end

  def count_cars(car)
    @car_count
  end

  def add_cars(car, number_of_cars)
    @car_count += number_of_cars
    @cargo[car] += number_of_cars
  end

  def weight
    weight = 0
    @cargo.each do |car, number_of_cars|
      weight += (car.weight * @cargo[car])
    end
    weight
  end
end
