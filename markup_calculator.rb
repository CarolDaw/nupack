class MarkupCalculator
  attr_reader :base_price, :worker_count, :materials
  
  def initialize(base_price, worker_count, materials)
    @base_price = base_price
    @worker_count = worker_count
    @materials = materials
    
    raise ArgumentError.new("Base price must be numeric") unless @base_price.is_a?(Float)
    raise ArgumentError.new("Worker count must be an integer") unless @worker_count.is_a?(Integer)
    raise ArgumentError.new("Materials must be alphabetical") unless is_alphabetical?(@materials)
  end
  
  def is_alphabetical?(text)
    text =~ /^[a-zA-Z]+$/
  end
end