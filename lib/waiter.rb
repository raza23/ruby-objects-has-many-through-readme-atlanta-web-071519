require 'pry'

class Waiter
    attr_reader :name,:years
    @@all = []

    def initialize(name,years)
        @name = name
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end


    def new_meal(customer,total,tip)
        Meal.new(self,customer,total,tip)
    end

    def meals
        Meal.all.select{|w| w.waiter == self}
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
          binding.pry
        end
       
        best_tipped_meal.customer
      end

end