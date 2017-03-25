class Job
  attr_reader :base_price, :worker_count, :materials
  
  def initialize(base_price, worker_count, materials)
    @base_price = base_price
    @worker_count = worker_count
    @materials = materials
  end
end