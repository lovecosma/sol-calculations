module Cycles
  class Formative < Number
    validates :number, uniqueness: true
  end
end
