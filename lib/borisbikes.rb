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

require_relative 'bike_container'

class DockingStation
	include BikeContainer
	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end
	def dock(bike)
		raise "There is no more room for bikes" if full?
		bikes << bike
	end
	def release(bike)
		raise "This bike is broken" if bike.broken?
	end
	def empty
		self.capacity == 0
		raise "There are no available bikes" if @capacity == 0
	end
end


class Van
	include BikeContainer
	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end
end


class Garage
	include BikeContainer
	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end
	def accept(bike)
		bike.fix
		dock(bike)
	end
	def dock(bike)
		raise "This bike is not broken" if !bike.broken?
		bikes << bike
	end
end