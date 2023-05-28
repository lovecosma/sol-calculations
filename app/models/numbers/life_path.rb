module Numbers
  class LifePath < Number
    validates :number, uniqueness: true

  end
end