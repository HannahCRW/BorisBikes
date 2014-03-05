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
end