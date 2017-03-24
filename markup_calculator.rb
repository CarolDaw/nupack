require './modules/nupack_validator'

class MarkupCalculator
  include NupackValidator
  attr_reader :base_price, :worker_count, :materials
  
  def initialize(base_price, worker_count, materials)
    @base_price = base_price
    @worker_count = worker_count
    @materials = materials
    
    validate!
  end
  
  def validate!
    raise ArgumentError.new("Base price must be numeric") unless @base_price.is_a?(Float)
    raise ArgumentError.new("Worker count must be an integer") unless @worker_count.is_a?(Integer)
    raise ArgumentError.new("Materials must be alphabetical") unless is_alphabetical?(@materials)
  end
  
end