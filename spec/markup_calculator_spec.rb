require 'nupack/markup_calculator'

RSpec.describe Nupack::MarkupCalculator do
  subject(:calculator) { Nupack::MarkupCalculator.new(base_price, worker_count, materials) }
  let(:base_price) {1299.99}
  let(:worker_count) {1}
  let(:materials) {'food'}
  
  it_behaves_like "NupackMath"
  
  it { is_expected.to respond_to(:flat_price) }
  it { is_expected.to respond_to(:flat_markup) }
  it { is_expected.to respond_to(:worker_markup) }
  it { is_expected.to respond_to(:materials_markup) }
  it { is_expected.to respond_to(:total_markup) }
  
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
    
    it "initializes with total markup" do
      expect(calculator.total_markup).to be_zero
    end
    
  end  
  
  describe "#calculate_markup!" do
    it { is_expected.to respond_to(:calculate_markup!)}
    
    it "returns a float" do
      expect(calculator.calculate_markup!).to be_a(Float)
    end
    
    context "calculate methods called from calculate_markup!" do
      before do
	 @expected_value = 5
      end 
      describe "calculate_flat_markup" do
	it "initializes flat markup" do
	  allow(calculator).to receive(:calculate_flat_markup) { @expected_value }
	  expect { calculator.calculate_markup! }.to change{calculator.flat_markup}.from(0).to(@expected_value)
	end
      end
      
      describe "calculate_flat_price" do
	it "initializes flat markup" do
	  allow(calculator).to receive(:calculate_flat_price) { @expected_value }
	  expect { calculator.calculate_markup! }.to change{calculator.flat_price}.from(0).to(@expected_value)
	end
      end
      
      describe "calculate_worker_markup" do
	it "initializes worker markup" do
	  allow(calculator).to receive(:calculate_worker_markup) { @expected_value }
	  expect { calculator.calculate_markup! }.to change{calculator.worker_markup}.from(0).to(@expected_value)
	end
      end
      
      describe "calculate_materials_markup" do
	it "initializes materials markup" do
	  allow(calculator).to receive(:calculate_materials_markup) { @expected_value }
	  expect { calculator.calculate_markup! }.to change{calculator.materials_markup}.from(0).to(@expected_value)
	end
      end
      
      describe "calculate_total_markup" do
	before do
	  allow(calculator).to receive(:calculate_total_markup) { @expected_value }
	end

	it "initializes total markup" do
	  expect { calculator.calculate_markup! }.to change{calculator.total_markup}.from(0).to(@expected_value)
	end
	
	it "returns total markup" do	
	  expect(calculator.calculate_markup!).to eq(calculator.total_markup)
	end
      end
    end
  end
  
  describe "#calculate_flat_price" do
    it { is_expected.to respond_to(:calculate_flat_price)}
    
    context "running a valid calculate_flat_price" do
      before do
        @initial_value = 1.00
	@markup = 1.01
        @expected_value = 2.01	
      end
      
      it "increases value by flat markup" do         
        expect(calculator.calculate_flat_price(@initial_value, @markup)).to eq(@expected_value)
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
      before do
        @initial_value = 1
	@worker_count = 3
        @expected_value = 0.036
      end

      it "returns 1.2% increase on input" do         
        expect(calculator.calculate_worker_markup(@initial_value, @worker_count)).to eq(@expected_value)
      end
    end
  end
  
  describe "#calculate_materials_markup" do
    it { is_expected.to respond_to(:calculate_materials_markup)}
    
    context "with pharmaceutical materials" do
      before do
        @initial_value = 1
	@material = "drugs"
        @expected_value = 0.075
      end
      
      it "returns 7.5% increase on input" do         
        expect(calculator.calculate_materials_markup(@initial_value, @material)).to eq(@expected_value)
      end
    end
    
    context "with food materials" do
      before do
        @initial_value = 1
	@material = "food"
        @expected_value = 0.13
      end
      
      it "returns 13% increase on input" do 
        expect(calculator.calculate_materials_markup(@initial_value, @material)).to eq(@expected_value)
      end
    end
    
    context "with electronic materials" do
      before do
        @initial_value = 1
	@material = "electronics"
        @expected_value = 0.02
      end
      
      it "returns 2% increase on input" do 
        expect(calculator.calculate_materials_markup(@initial_value, @material)).to eq(@expected_value)
      end
    end
    
    context "with other materials" do
      before do
        @initial_value = 1
	@material = "books"
        @expected_value = 0
      end
      
      it "returns 0% increase on input" do 
        expect(calculator.calculate_materials_markup(@initial_value, @material)).to eq(@expected_value)
      end
    end
  end  
  
  describe "#calculate_total_markup" do
    it { is_expected.to respond_to(:calculate_total_markup)} 
        
    context "get valid total markup" do
      before do
	@base_price = 1.00
	@flat_markup = 2.01
	@worker_markup = 3.02
        @materials_markup = 4.03
	@expected_value = 10.06
      end
      
      it "returns a float" do
	expect(calculator.calculate_total_markup(@base_price, @flat_markup, @worker_markup, @materials_markup)).to be_a(Float)
      end 
      
      it "returns valid output" do
	expect(calculator.calculate_total_markup(@base_price, @flat_markup, @worker_markup, @materials_markup)).to eq(@expected_value)
      end
      
      it "returns a number to 2 decimal places" do
	expect(calculator.calculate_total_markup(@base_price, @flat_markup, @worker_markup, @materials_markup)).to be_within(0.001).of(@expected_value)
      end
    end
  end
  
end