module Numbers
  class Personality < Number
    validates :number, uniqueness: true
  end
end