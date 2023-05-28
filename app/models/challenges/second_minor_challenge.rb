module Challenges
  class SecondMinorChallenge < Number
    validates :number, uniqueness: true
  end
end
