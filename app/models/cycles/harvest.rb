module Cycles
  class Harvest < Number
    validates :number, uniqueness: true
  end
end
