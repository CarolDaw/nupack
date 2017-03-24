require './modules/nupack_validator'

class MarkupCalculator
  include NupackValidator
  attr_reader :base_price, :worker_count, :materials
  attr_reader :flat_price, :flat_markup, :worker_markup, :materials_markup, :materials_list
  
  def initialize(base_price, worker_count, materials)
    @base_price = base_price
    @worker_count = worker_count
    @materials = materials
    @materials_list = { :drugs => 7.5, :food => 13, :electronics => 2 }
    
    @flat_markup = 0
    @worker_markup = 0
    @materials_markup = 0
    
    validate!
  end
  
  def validate!
    raise ArgumentError.new("Base price must be numeric") unless @base_price.is_a?(Float)
    raise ArgumentError.new("Worker count must be an integer") unless @worker_count.is_a?(Integer)
    raise ArgumentError.new("Materials must be alphabetical") unless is_alphabetical?(@materials)
  end
  
  def calculate_markup
    calculate_flat_markup(@base_price)
  end
  
  def calculate_flat_markup(price)
    @flat_markup = price * 0.05
  end
  
  def calculate_worker_markup(price)
    @worker_markup = (price * 0.012 * @worker_count).round(3)
  end
  
  def calculate_materials_markup(price)
    if materials_list.has_key? @materials.to_sym
      @materials_markup = price * materials_list[@materials.to_sym].to_f/100
    end
  end 
  
end