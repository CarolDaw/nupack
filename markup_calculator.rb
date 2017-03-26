require './modules/nupack_math'

class MarkupCalculator
  include NupackMath
  
  attr_reader :job
  attr_reader :flat_price, :flat_markup, :worker_markup, :materials_markup
  
  def initialize(base_price, worker_count, materials)
    @job = Job.new(base_price, worker_count, materials)
    
    @flat_price = 0
    @flat_markup = 0
    @worker_markup = 0
    @materials_markup = 0    
  end
  
  def calculate_markup
    calculate_flat_markup(@job.base_price)
    calculate_flat_price(@job.base_price)
    calculate_worker_markup(@flat_price)
    calculate_materials_markup(@flat_price)
    get_total_markup
  end
  
  def calculate_flat_markup(price)
    @flat_markup = percentage(price, MarkupRate::FLAT_RATE)
  end
  
  def calculate_flat_price(price)
    @flat_price = price + @flat_markup
  end
  
  def calculate_worker_markup(price)
    @worker_markup = (percentage(price, MarkupRate::WORKER_RATE) * @job.worker_count).round(3)
  end
  
  def calculate_materials_markup(price)
    if MarkupRate::MATERIAL_RATE.has_key? @job.materials.to_sym
      @materials_markup = percentage(price, MarkupRate::MATERIAL_RATE[@job.materials.to_sym])
    end
  end 
  
  def get_total_markup
    (@job.base_price + @flat_markup + @worker_markup + @materials_markup).round(2)
  end
  
end