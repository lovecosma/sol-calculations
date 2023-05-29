module Challenges
  class FirstMinor < Number
    validates :number, uniqueness: true
  end
end
