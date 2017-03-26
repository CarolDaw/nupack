require './markup_calculator'
require 'spec_helper'

RSpec.describe MarkupCalculator do
  subject(:calculator) { MarkupCalculator.new(base_price, worker_count, materials) }
  let(:base_price) {1299.99}
  let(:worker_count) {1}
  let(:materials) {'food'}
  
  it_behaves_like "NupackMath"
  
  it { is_expected.to respond_to(:flat_price) }
  it { is_expected.to respond_to(:flat_markup) }
  it { is_expected.to respond_to(:worker_markup) }
  it { is_expected.to respond_to(:materials_markup) }
  
  describe "#initialize" do    
    it "initializes with job" do
      expect(calculator.job).not_to be_nil
    end 
    
    it "initializes with flat markup" do
      expect(calculator.flat_markup).to be_zero
    end 
    
    it "initializes with flat price" do
      expect(calculator.flat_price).to be_zero
    end 
        
    it "initializes with worker markup" do
      expect(calculator.worker_markup).to be_zero
    end 
    
    it "initializes with materials markup" do
      expect(calculator.materials_markup).to be_zero
    end
    
  end  
  
  describe "#calculate_markup" do
    it { is_expected.to respond_to(:calculate_markup)}
    
    it "returns a float" do
      expect(calculator.calculate_markup).to be_a(Float)
    end
    
    context "calculate_flat_markup" do
      before do
        @expected_value = 5
      end      

      it "initializes flat markup" do
	allow(calculator).to receive(:calculate_flat_markup) { @expected_value }
        expect { calculator.calculate_markup }.to change{calculator.flat_markup}.from(0).to(@expected_value)
      end
    end
  end
  
  describe "#calculate_flat_price" do
    it { is_expected.to respond_to(:calculate_flat_price)}
    
    context "running a valid calculate_flat_markup" do
      before do
	calculator.instance_variable_set("@flat_markup", 1.01)
        @initial_value = 1.00
        @expected_value = 2.01	
      end
      
      it "returns increase input by flat price" do         
        calculator.calculate_flat_price(@initial_value)
        expect(calculator.flat_price).to eq(@expected_value)
      end
      
      it "initializes flat price" do
	  expect { calculator.calculate_flat_price(@initial_value) }.to change{calculator.flat_price}.from(0).to(@expected_value)
      end
    end
  end
  
  describe "#calculate_flat_markup" do
    it { is_expected.to respond_to(:calculate_flat_markup)}

    context "running a valid calculate_flat_markup" do
      before do
        @initial_value = 1
        @expected_value = 0.05
      end
      it "returns 5% increase on input" do 
        expect(calculator.calculate_flat_markup(@initial_value)).to eq(@expected_value)
      end
    end
  end
  
  describe "#calculate_worker_markup" do
    it { is_expected.to respond_to(:calculate_worker_markup)}
    
    context "running a valid calculate_worker_markup" do
      subject(:calculator) { MarkupCalculator.new(base_price, worker_count, materials) }
      let(:worker_count) {3}
      before do
        @initial_value = 1
        @expected_value = 0.036
      end

      it "returns 1.2% increase on input" do 
        calculator.calculate_worker_markup(@initial_value)
        expect(calculator.worker_markup).to eq(@expected_value)
      end

      it "initializes worker markup" do
        expect { calculator.calculate_worker_markup(@initial_value) }.to change{calculator.worker_markup}.from(0).to(@expected_value)
      end
    end
  end
  
  describe "#calculate_materials_markup" do
    it { is_expected.to respond_to(:calculate_materials_markup)}
    
    context "with pharmaceutical materials" do
      let(:materials) {"drugs"}
      before do
        @initial_value = 1
        @expected_value = 0.075
      end
      
      it "returns 7.5% increase on input" do 
        calculator.calculate_materials_markup(@initial_value)
        expect(calculator.materials_markup).to eq(@expected_value)
      end
    end
    
    context "with food materials" do
      let(:materials) {"food"}
      before do
        @initial_value = 1
        @expected_value = 0.13
      end
      
      it "returns 13% increase on input" do 
        calculator.calculate_materials_markup(@initial_value)
        expect(calculator.materials_markup).to eq(@expected_value)
      end
    end
    
    context "with electronic materials" do
      let(:materials) {"electronics"}
      before do
        @initial_value = 1
        @expected_value = 0.02
      end
      
      it "returns 2% increase on input" do 
        calculator.calculate_materials_markup(@initial_value)
        expect(calculator.materials_markup).to eq(@expected_value)
      end
    end
    
    context "with other materials" do
      let(:materials) {"books"}
      before do
        @initial_value = 1
        @expected_value = 0
      end
      
      it "returns 0% increase on input" do 
        calculator.calculate_materials_markup(@initial_value)
        expect(calculator.materials_markup).to eq(@expected_value)
      end
    end
  end  
  
  describe "#get_total_markup" do
    it { is_expected.to respond_to(:get_total_markup)}
    
    it "returns a float" do
      expect(calculator.get_total_markup).to be_a(Float)
    end 
        
    context "get valid total markup" do
      before do
	job = instance_double("Job", :base_price => 1.00)
	calculator.instance_variable_set("@job", job)
	calculator.instance_variable_set("@flat_markup", 2.01)
	calculator.instance_variable_set("@worker_markup", 3.02)
	calculator.instance_variable_set("@materials_markup", 4.03)
      end
      
      it "returns valid output" do
	expect(calculator.get_total_markup).to eq(10.06)
      end
      
      it "returns a number to 2 decimal places" do
	expect(calculator.get_total_markup).to be_within(0.001).of(10.06)
      end
    end
  end
  
end