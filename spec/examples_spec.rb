require './markup_calculator'
require 'spec_helper'

RSpec.describe MarkupCalculator do
  subject(:calculator) { MarkupCalculator.new(base_price, worker_count, materials) }
  let(:base_price) {1299.99}
  let(:worker_count) {1}
  let(:materials) {'food'}

  context "example1" do
    let(:worker_count) {3}
    let(:base_price) {1299.99}
    let(:materials) {'food'}
    before do
      @expected_value = 1591.58
    end
    
    it "returns $1,591.58" do         
        expect(calculator.calculate_markup).to eq(@expected_value)
    end
  end
end