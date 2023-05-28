module Challenges
  class FirstMinorChallenge < Number
    validates :number, uniqueness: true
  end
end
