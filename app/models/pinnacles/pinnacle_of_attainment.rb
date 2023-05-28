module Pinnacles
  class PinnacleOfAttainment < Number
    validates :number, uniqueness: true
  end
end
