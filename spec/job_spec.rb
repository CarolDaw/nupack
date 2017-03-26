require 'nupack/markup_calculator'
require 'nupack/job'

RSpec.describe Nupack::Job do
  subject(:job) { Nupack::Job.new(base_price, worker_count, materials) }
  let(:base_price) {1299.99}
  let(:worker_count) {1}
  let(:materials) {'food'}
  
  it_behaves_like "NupackValidator"
  
  it { is_expected.to respond_to(:base_price) }
  it { is_expected.to respond_to(:worker_count) }
  it { is_expected.to respond_to(:materials) }
  
  describe "#initialize" do    

    it "initializes with a base_price" do
      expect(job.base_price).to eq(base_price)
    end
    
    it "initializes with worker_count" do
      expect(job.worker_count).to eq(worker_count)
    end
    
    it "initializes with materials" do
      expect(job.materials).to eq(materials)
    end 
  end
  
  describe "#validate!" do
    it "raises an error if base_price is not a number" do
      base_price = 'Not a number'
      expect { Nupack::MarkupCalculator.new(base_price, worker_count, materials) }.to raise_error(ArgumentError)
    end
    
    it "raises an error if worker_count is not an integer" do
      worker_count = 'One'
      expect { Nupack::MarkupCalculator.new(base_price, worker_count, materials) }.to raise_error(ArgumentError)
    end
    
    it "raises an error if materials is not all alphabetical" do
      materials = 'One2'
      expect { Nupack::MarkupCalculator.new(base_price, worker_count, materials) }.to raise_error(ArgumentError)
    end
  end
end