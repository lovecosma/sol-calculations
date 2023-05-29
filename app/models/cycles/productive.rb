module Cycles
  class Productive < Number
    validates :number, uniqueness: true
  end
end
