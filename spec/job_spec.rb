require './job'
require 'spec_helper'

RSpec.describe Job do
  subject(:job) { Job.new(base_price, worker_count, materials) }
  let(:base_price) {1299.99}
  let(:worker_count) {1}
  let(:materials) {'food'}
  
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
end