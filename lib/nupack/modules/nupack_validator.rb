module Nupack
  module NupackValidator
    def is_alphabetical?(text)
      text =~ /^[a-zA-Z]+$/
    end
  end
end

