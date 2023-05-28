class Chart < ApplicationRecord
  validates :first_name, presence: true, format: { with: /^[A-Za-z -]*$/, message: "only allows letters" , :multiline => true}
  validates :middle_name, format: { with: /^[A-Za-z -]*$/, message: "only allows letters", :multiline => true}
  validates :last_name, presence: true, format: { with: /^[A-Za-z -]*$/, message: "only allows letters", :multiline => true }
  validates :birthdate, presence: true
  before_validation :trim_whitespaces
  has_and_belongs_to_many :numbers

  WORD_MAP = { 'a': 1, 'j': 1, 's': 1,
  'b': 2, 'k': 2, 't': 2,
  'c': 3, 'l': 3, 'u': 3,
  'd': 4, 'm': 4, 'v': 4,
  'e': 5, 'n': 5, 'w': 5,
  'f': 6, 'o': 6, 'x': 6,
  'g': 7, 'p': 7, 'y': 7,
  'h': 8, 'q': 8, 'z': 8,
  'i': 9, 'r': 9 }.freeze
  def soul_urge
    number = reduce_array_of_letters(vowels_array)
    Numbers::SoulUrge.find_or_create_by(number: number)
  end

  def personality
    number = reduce_array_of_letters(consonants_array)
    Numbers::Personality.find_or_create_by(number: number)
  end

  def expression
    number = reduce_array_of_letters(full_name_array)
    Numbers::Expression.find_or_create_by(number: number)
  end

  def life_path
    number = reduce_array_of_numbers(owner.birthdate_array)
    Numbers::LifePath.find_or_create_by(number: number)
  end
  def first_minor_challenge
    number = reduced_month - reduced_day
    number = number < 0 ? (-1 * number) : number
    Challenges::FirstMinorChallenge.find_or_create_by(number: number)
  end
  def second_minor_challenge
    reduced_year
    number = reduced_day - reduced_year
    number = number < 0 ? (-1 * number) : number
    Challenges::SecondMinorChallenge.find_or_create_by(number: number)
  end

  def major_challenge
    number = second_minor_challenge.number - first_minor_challenge.number
    number = number < 0 ? (-1 * number) : number
    Challenges::MajorChallenge.find_or_create_by(number: number)
  end

  def formative_cycle
    Cycles::FormativeCycle.find_or_create_by(number: reduced_month)
  end

  def productive_cycle
    Cycles::ProductiveCycle.find_or_create_by(number: reduced_day)
  end

  def harvest_cycle
    Cycles::HarvestCycle.find_or_create_by(number: reduced_year)
  end

  def pinnacle_of_attainment
    number = reduce_digits(reduced_day + reduced_month)
    Pinnacles::PinnacleOfAttainment.find_or_create_by(number: number)
  end

  def pinnacle_of_obligation
    number = reduce_digits(reduced_day + reduced_year)
    Pinnacles::PinnacleOfObligation.find_or_create_by(number: number)
  end

  def pinnacle_of_foundation
    number = reduce_digits(pinnacle_of_attainment.number + pinnacle_of_obligation.number)
    Pinnacles::PinnacleOfFoundation.find_or_create_by(number: number)
  end

  def pinnacle_of_retrospection
    number = reduce_digits(reduced_month + reduced_year)
    Pinnacles::PinnacleOfRetrospection.find_or_create_by(number: number)
  end




  private

  def reduced_year
    reduce_digits(owner.birthdate.year)
  end

  def reduced_day
    reduce_digits(owner.birthdate.day)
  end

  def reduced_month
    reduce_digits(owner.birthdate.month)
  end

  def full_name_array
    full_name = first_name + middle_name + last_name
    full_name.split("")
  end

  def consonants_array
    full_name_array.select { |letter| !vowel?(letter) }
  end

  def vowels_array
    full_name_array.select { |letter| vowel?(letter) }
  end

  def vowel?(l)
    'aeiouy'.include?(l)
  end

  def reduce_array_of_letters(array)
    sum = 0
    array.each { |letter| sum = sum + WORD_MAP[letter.to_sym] }
    return reduce_digits(sum)
  end

  def reduce_array_of_numbers(array)
    sum = 0
    array.map{|number| reduce_digits(number) }.each do |number|
      sum = sum + number
    end
    return reduce_digits(sum)
  end



  def reduce_digits(digits)
    return digits if master_number?(digits)
    sum = 0
    digits.to_s.split("").each { |num| sum = sum + num.to_i }
    if sum.to_s.split("").length > 1
        reduce_digits(sum)
      else
        sum
    end
  end

  def master_number?(num)
    return if num == 11 || num == 22 || num == 33 || 44
  end

  def last_name
    owner.last_name.downcase
  end

  def middle_name
    owner.middle_name.downcase
  end

  def first_name
    owner.first_name.downcase
  end

end
