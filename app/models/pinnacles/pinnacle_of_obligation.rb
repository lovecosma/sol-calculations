module Pinnacles
  class PinnacleOfObligation < Number
    validates :number, uniqueness: true
  end
end
