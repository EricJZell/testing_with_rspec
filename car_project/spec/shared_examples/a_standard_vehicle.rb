shared_examples_for('a standard vehicle') do

  describe 'attributes' do

    # subject { Car.new } #implicitly defined due to descrive Car
    # let(:car) { Car.new }
    # before(:example) do
    #   car = Car.new
    # end

    it "allows reading and writing for :make" do
      subject.make = 'Test'
      expect(subject.make).to eq('Test')
    end

    it "allows reading and writing for :year" do
      subject.year = 1999
      expect(subject.year).to eq(1999)
    end

    it "allows reading and writing for :color" do
      subject.color = 'foo'
      expect(subject.color).to eq('foo')
    end

    it "allows reading for wheels" do
      expect(subject.wheels).to eq(4)
    end

    it 'allows writing for doors' do
      skip('debugging a problem')
    end

  end

end
