require './modules/nupack_validator'

RSpec.shared_examples "NupackValidator" do

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