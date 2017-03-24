require './markup_calculator'

RSpec.describe MarkupCalculator do
  subject(:calculator) { MarkupCalculator.new(base_price, worker_count, materials) }
  let(:base_price) {1299.99}
  let(:worker_count) {1}
  let(:materials) {'food'}
  
  it { is_expected.to respond_to(:base_price) }
  it { is_expected.to respond_to(:worker_count) }
  it { is_expected.to respond_to(:materials) }
  
  describe "initialize" do    
    it "initializes with a base_price" do
      expect(calculator.base_price).to eq(base_price)
    end
    
    it "initializes with worker_count" do
      expect(calculator.worker_count).to eq(worker_count)
    end
    
    it "initializes with materials" do
      expect(calculator.materials).to eq(materials)
    end
  end
end