require './markup_calculator'

RSpec.describe MarkupCalculator do
  subject(:calculator) { MarkupCalculator.new(base_price, worker_count, materials) }
  let(:base_price) {1299.99}
  let(:worker_count) {1}
  let(:materials) {'food'}
  
  it { is_expected.to respond_to(:base_price) }
  it { is_expected.to respond_to(:worker_count) }
  it { is_expected.to respond_to(:materials) }
  
  describe "#initialize" do    
    it "initializes with a base_price" do
      expect(calculator.base_price).to eq(base_price)
    end
    
    it "initializes with worker_count" do
      expect(calculator.worker_count).to eq(worker_count)
    end
    
    it "initializes with materials" do
      expect(calculator.materials).to eq(materials)
    end
    
    it "raises an error if base_price is not a number" do
      base_price = 'Not a number'
      expect { MarkupCalculator.new(base_price, worker_count, materials) }.to raise_error(ArgumentError)
    end
    
    it "raises an error if worker_count is not an integer" do
      worker_count = 'One'
      expect { MarkupCalculator.new(base_price, worker_count, materials) }.to raise_error(ArgumentError)
    end
    
    it "raises an error if materials is not all alphabetical" do
      materials = 'One2'
      expect { MarkupCalculator.new(base_price, worker_count, materials) }.to raise_error(ArgumentError)
    end
  end  
  
  describe "#is_alphabetical?" do
    it { is_expected.to respond_to(:is_alphabetical?) }
    
    it "returns true for a alphabetical string" do
      expect(subject.is_alphabetical?('abcdefg')).to be_truthy
    end

    it "returns false for a non alphabetical string" do
      expect(subject.is_alphabetical?("1000.00")).to be_falsey
    end
  end
  
end