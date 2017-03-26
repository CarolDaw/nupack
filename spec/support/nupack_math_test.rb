require 'nupack/modules/nupack_math'

RSpec.shared_examples "NupackMath" do

  describe "#percentage" do
    it { is_expected.to respond_to(:percentage)}

    it "returns a float" do
      expect(subject.percentage(1,1)).to be_a(Float)
    end

    it "returns 10% increase on input" do      
      initial_value = 10
      expected_value = 1
      percent = 10
      expect(subject.percentage(initial_value, percent)).to eq(expected_value)
    end
  end
  
end