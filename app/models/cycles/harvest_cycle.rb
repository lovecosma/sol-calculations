module Cycles
  class HarvestCycle < Number
    validates :number, uniqueness: true
  end
end
