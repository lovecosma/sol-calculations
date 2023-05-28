module Challenges
  class MajorChallenge < Number
    validates :number, uniqueness: true
  end
end
