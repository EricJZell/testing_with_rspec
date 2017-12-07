# encoding: UTF-8

describe 'NumberHelper' do

  include NumberHelper

  describe '#number_to_currency' do

    context 'using default values' do

      it "correctly formats an integer" do
        expect(number_to_currency(20)).to eq("$20.00")
      end

      it "correctly formats a float" do
        expect(number_to_currency(29.99)).to eq("$29.99")
      end

      it "correctly formats a string" do
        expect(number_to_currency("25.99")).to eq("$25.99")
      end

      it "uses delimiters for very large numbers" do
        expect(number_to_currency(25000)).to eq("$25,000.00")
      end

      it "does not have delimiters for small numbers" do
        expect(number_to_currency(50)).to eq("$50.00")
      end

    end

    context 'using custom options' do

      it 'allows changing the :unit' do
        currency = number_to_currency(25.99, unit: '£')
        expect(currency).to eq("£25.99")
      end

      it 'allows changing the :precision' do
        currency = number_to_currency(25.99, precision: 4)
        expect(currency).to eq("$25.9900")
      end

      it 'omits the separator if :precision is 0' do
        currency = number_to_currency(25.99, precision: 0)
        expect(currency).to eq("$25")
      end

      it 'allows changing the :delimiter' do
        currency = number_to_currency(25000.50, delimiter: ':')
        expect(currency).to eq("$25:000.50")
      end

      it 'allows changing the :separator' do
        currency = number_to_currency(25000.50, separator: ':')
        expect(currency).to eq("$25,000:50")
      end

      it 'correctly formats using multiple options' do
        currency = number_to_currency(25000.50, separator: ':', unit: '£', precision: 4)
        expect(currency).to start_with('£').and end_with(':5000')
      end

    end

  end

end
