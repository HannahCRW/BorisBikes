require_relative "../lib/borisbikes"

describe Bike do

	let(:bike) { Bike.new }

	it "should not be broken after we create it" do
		expect(bike.broken?).to be_false
	end

	it "should be able to break" do 
		bike.break
		expect(bike.broken?).to be_true
	end

	it "should be able to get fixed" do
		bike.break
		bike.fix
		expect(bike.broken?).to be_false
	end
end

describe DockingStation do

	let (:station) { DockingStation.new(:capacity => 123) }
	let (:bike) { Bike.new }

	def fill_station(station) 
		123.times { station.dock(Bike.new) }
	end

	it "should allow setting default capacity on initialising" do
		expect(station.capacity).to eq(123)
	end

	it "should accept a bike" do
		expect(station.bike_count).to eq(0)
		station.dock(bike)
		expect(station.bike_count).to eq(1)
	end

	it "should release a bike" do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(station).not_to be_full
		fill_station station
		expect(station).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_station station
		expect(lambda {station.dock(bike) }).to raise_error(RuntimeError)
	end

	it "should provide a list of all available bikes" do 
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq([working_bike])
	end
end

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end
end
