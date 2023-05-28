module Cycles
  class FormativeCycle < Number
    validates :number, uniqueness: true
  end
end
