module Challenges
  class SecondMinor < Number
    validates :number, uniqueness: true
  end
end
