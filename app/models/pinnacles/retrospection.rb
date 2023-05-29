module Pinnacles
  class Retrospection < Number
    validates :number, uniqueness: true
  end
end
