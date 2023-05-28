module Cycles
  class ProductiveCycle < Number
    validates :number, uniqueness: true
  end
end
