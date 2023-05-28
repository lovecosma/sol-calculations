module Numbers
  class Expression < Number
    validates :number, uniqueness: true
  end
end