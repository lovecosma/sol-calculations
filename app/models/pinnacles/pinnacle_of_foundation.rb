module Pinnacles
  class PinnacleOfFoundation < Number
    validates :number, uniqueness: true
  end
end

