module Challenges
  class Major < Number
    validates :number, uniqueness: true
  end
end
