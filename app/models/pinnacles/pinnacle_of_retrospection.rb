module Pinnacles
  class PinnacleOfRetrospection < Number
    validates :number, uniqueness: true
  end
end
