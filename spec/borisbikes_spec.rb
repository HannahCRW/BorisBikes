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

	let (:station) { DockingStation.new }
	let (:bike) { Bike.new }

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
end

