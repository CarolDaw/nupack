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
        expect(calculator.calculate_markup!).to eq(@expected_value)
    end
  end
  
  context "example2" do
    let(:worker_count) {1}
    let(:base_price) {5432.00}
    let(:materials) {'drugs'}
    before do
      @expected_value = 6199.81
    end
    
    it "returns $6,199.81" do         
        expect(calculator.calculate_markup!).to eq(@expected_value)
    end
  end
  
  context "example3" do
    let(:worker_count) {4}
    let(:base_price) {12456.95}
    let(:materials) {'books'}
    before do
      @expected_value = 13707.63
    end
    
    it "returns $13,707.63" do         
        expect(calculator.calculate_markup!).to eq(@expected_value)
    end
  end
end