# frozen_string_literal: true

module Charts
  class CalculateChart

    WORD_MAP = { 'a': 1, 'j': 1, 's': 1,
                 'b': 2, 'k': 2, 't': 2,
                 'c': 3, 'l': 3, 'u': 3,
                 'd': 4, 'm': 4, 'v': 4,
                 'e': 5, 'n': 5, 'w': 5,
                 'f': 6, 'o': 6, 'x': 6,
                 'g': 7, 'p': 7, 'y': 7,
                 'h': 8, 'q': 8, 'z': 8,
                 'i': 9, 'r': 9}.freeze

    def initialize(chart)
      @chart = chart
      calculate_numbers
    end

    def calculate_numbers
      set_soul_urge
      set_personality
      set_expression
      set_life_path
      set_formative
      set_harvest
      set_productive
      set_first_minor
      set_second_minor
      set_major
      set_obligation
      set_attainment
      set_foundation
      set_retrospection
    end
    def set_soul_urge
      number = reduce_array_of_letters(vowels_array)
      @chart.soul_urge = Numbers::SoulUrge.find_or_create_by(number: number)
    end

    def set_personality
      number = reduce_array_of_letters(consonants_array)
      @chart.personality = Numbers::Personality.find_or_create_by(number: number)
    end

    def set_expression
      number = reduce_array_of_letters(full_name_array)
      @chart.expression = Numbers::Expression.find_or_create_by(number: number)
    end

    def set_life_path
      number = reduce_array_of_numbers(birthdate_array)
      @chart.life_path = Numbers::LifePath.find_or_create_by(number: number)
    end
    def set_first_minor
      number = reduced_month - reduced_day
      number = number < 0 ? (-1 * number) : number
      @chart.first_minor = Challenges::FirstMinor.find_or_create_by(number: number)
    end
    def set_second_minor
      reduced_year
      number = reduced_day - reduced_year
      number = number < 0 ? (-1 * number) : number
      @chart.second_minor = Challenges::SecondMinor.find_or_create_by(number: number)
    end

    def set_major
      number = @chart.second_minor.number - @chart.first_minor.number
      number = number < 0 ? (-1 * number) : number
      @chart.major = Challenges::Major.find_or_create_by(number: number)
    end

    def set_formative
      @chart.formative = Cycles::Formative.find_or_create_by(number: reduced_month)
    end

    def set_productive
      @chart.productive = Cycles::Productive.find_or_create_by(number: reduced_day)
    end

    def set_harvest
      @chart.harvest = Cycles::Harvest.find_or_create_by(number: reduced_year)
    end

    def set_attainment
      number = reduce_digits(reduced_day + reduced_month)
      @chart.attainment = Pinnacles::Attainment.find_or_create_by(number: number)
    end

    def set_obligation
      number = reduce_digits(reduced_day + reduced_year)
      @chart.obligation = Pinnacles::Obligation.find_or_create_by(number: number)
    end

    def set_foundation
      number = reduce_digits(@chart.attainment.number + @chart.obligation.number)
      @chart.foundation = Pinnacles::Foundation.find_or_create_by(number: number)
    end

    def set_retrospection
      number = reduce_digits(reduced_month + reduced_year)
      @chart.retrospection = Pinnacles::Retrospection.find_or_create_by(number: number)
    end




    private

    def reduced_year
      reduce_digits(birthdate.year)
    end

    def reduced_day
      reduce_digits(birthdate.day)
    end

    def reduced_month
      reduce_digits(birthdate.month)
    end

    def full_name_array
      full_name = first + middle + last
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
      array.each do |letter|
        sum = sum + (WORD_MAP[letter.to_sym] || 0)
      end
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

    def birthdate
      @chart.birthdate
    end

    def last
      @chart.last_name.downcase
    end

    def middle
      @chart.middle_name.downcase
    end

    def first
      @chart.first_name.downcase
    end
    def birthdate_array
      [birthdate.month, birthdate.day, birthdate.year]
    end
  end
end
