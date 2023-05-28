class Owner < ApplicationRecord
  has_one :chart



  def trim_whitespaces
    self.first_name = self.first_name.strip
    self.middle_name = self.middle_name.strip
    self.last_name = self.last_name.strip
  end

  def first_possessive
    first_name + "'s "
  end

  def first_and_last_possessive
    first_name + last_name+ "'s "
  end


  def birthdate_array
    [birthdate.month, birthdate.day, birthdate.year]
  end
end
