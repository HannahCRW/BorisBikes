class Bike
	def initialize
		fix
	end
	def broken?
		@broken
	end
	def break
		@broken = true
	end
	def fix
		@broken = false
	end
end

class DockingStation
	DEFAULT_CAPACITY = 10
	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end
	def bike_count
		@bikes.count
	end
	def dock(bike)
		# if the capacity is reached, raise an exception
		raise "Station is full" if full?
		@bikes << bike
	end
	def release(bike)
		@bikes.delete(bike)
	end
	def full?
		bike_count == @capacity
	end
end