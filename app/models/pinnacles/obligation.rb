module Pinnacles
  class Obligation < Number
    validates :number, uniqueness: true
  end
end
