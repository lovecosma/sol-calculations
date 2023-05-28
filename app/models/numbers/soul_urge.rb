module Numbers
  class SoulUrge < Number
    validates :number, uniqueness: true
  end
end
