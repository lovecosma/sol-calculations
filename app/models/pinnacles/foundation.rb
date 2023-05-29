module Pinnacles
  class Foundation < Number
    validates :number, uniqueness: true
  end
end

