module Pinnacles
  class Attainment < Number
    validates :number, uniqueness: true
  end
end
