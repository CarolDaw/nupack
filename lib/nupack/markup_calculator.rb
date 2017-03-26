require 'nupack/nupack_math'

module Nupack
  class MarkupCalculator
    include NupackMath
    
    attr_reader :job
    attr_reader :flat_price, :flat_markup, :worker_markup, :materials_markup, :total_markup
    
    def initialize(base_price, worker_count, materials)
      @job = Job.new(base_price, worker_count, materials)
      
      @flat_price = 0
      @flat_markup = 0
      @worker_markup = 0
      @materials_markup = 0    
      @total_markup = 0
    end
    
    def calculate_markup!
      @flat_markup = calculate_flat_markup(@job.base_price)
      @flat_price = calculate_flat_price(@job.base_price, @flat_markup)
      @worker_markup = calculate_worker_markup(@flat_price, @job.worker_count)
      @materials_markup = calculate_materials_markup(@flat_price, @job.materials)
      @total_markup = calculate_total_markup(@job.base_price, @flat_markup, @worker_markup, @materials_markup)
      @total_markup
    end
    
    def calculate_flat_markup(price)
      percentage(price, MarkupRate::FLAT_RATE)
    end
    
    def calculate_flat_price(price, flat_markup)
      price + flat_markup
    end
    
    def calculate_worker_markup(price, worker_count)
      (percentage(price, MarkupRate::WORKER_RATE) * worker_count).round(3)
    end
    
    def calculate_materials_markup(price, material)
      MarkupRate::MATERIAL_RATE.has_key?(material.to_sym) ? percentage(price, MarkupRate::MATERIAL_RATE[material.to_sym]) : 0
    end 
    
    def calculate_total_markup(base_price, flat_markup, worker_markup, materials_markup)
      (base_price + flat_markup + worker_markup + materials_markup).round(2)
    end
    
  end
end