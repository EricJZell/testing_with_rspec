require 'truck'
require 'shared_examples/a_standard_vehicle'

describe Truck do

  it_behaves_like('a standard vehicle')

  describe '.colors' do
    let(:colors) { ['blue', 'black', 'red', 'green', 'white'] }
    it "returns an array of color names" do
      expect(Truck.colors).to match_array(colors)
    end
  end

  describe '#full_name' do
    let(:chevy) { Truck.new(make: 'Chevy', year: 2012, color: 'blue') }
    let(:new_truck) { Truck.new }
    it "returns a string in the expected format" do
      expect(chevy.full_name).to eq('2012 Chevy Truck (blue)')
    end

    context 'when initialized with no arguments' do
      it 'returns a string using default values' do
        expect(new_truck.full_name).to eq('2007 Ford Truck (unknown)')
      end
    end
  end

end
