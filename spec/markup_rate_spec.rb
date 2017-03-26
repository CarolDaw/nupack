require 'nupack/markup_rate'

RSpec.describe Nupack::MarkupRate do
  
  describe "it has the required rates" do
    
    it "has a FLAT_RATE " do
	expect(Nupack::MarkupRate::FLAT_RATE).not_to be_nil
    end 
    
    it "has a WORKER_RATE " do
	expect(Nupack::MarkupRate::WORKER_RATE).not_to be_nil
    end 
    
    it "has a MATERIAL_RATE " do
	expect(Nupack::MarkupRate::MATERIAL_RATE).not_to be_nil
    end 
    
    it "has a Pharmaceutical MATERIAL_RATE " do
	expect(Nupack::MarkupRate::MATERIAL_RATE[:drugs]).not_to be_nil
    end 
    
    it "has an electronics MATERIAL_RATE " do
	expect(Nupack::MarkupRate::MATERIAL_RATE[:electronics]).not_to be_nil
    end 
    
    it "has a food MATERIAL_RATE " do
	expect(Nupack::MarkupRate::MATERIAL_RATE[:food]).not_to be_nil
    end 
    
  end
  
end