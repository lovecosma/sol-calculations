class Chart < ApplicationRecord
  has_and_belongs_to_many :numbers
  validates :first_name, presence: true, format: { with: /^[A-Za-z -]*$/, message: "only allows letters" , :multiline => true}
  validates :middle_name, format: { with: /^[A-Za-z -]*$/, message: "only allows letters", :multiline => true}
  validates :last_name, presence: true, format: { with: /^[A-Za-z -]*$/, message: "only allows letters", :multiline => true }
  validates :birthdate, presence: true
  belongs_to :user
  belongs_to :soul_urge, class_name: 'Numbers::SoulUrge'
  belongs_to :personality, class_name: 'Numbers::Personality'
  belongs_to :expression, class_name: 'Numbers::Expression'
  belongs_to :life_path, class_name: 'Numbers::LifePath'
  belongs_to :attainment, class_name: 'Pinnacles::Attainment'
  belongs_to :foundation, class_name: 'Pinnacles::Foundation'
  belongs_to :obligation, class_name: 'Pinnacles::Obligation'
  belongs_to :retrospection, class_name: 'Pinnacles::Retrospection'
  belongs_to :formative, class_name: 'Cycles::Formative'
  belongs_to :harvest, class_name: 'Cycles::Harvest'
  belongs_to :productive, class_name: 'Cycles::Productive'
  belongs_to :first_minor, class_name: 'Challenges::FirstMinor'
  belongs_to :second_minor, class_name: 'Challenges::SecondMinor'
  belongs_to :major, class_name: 'Challenges::Major'
  before_validation :trim_whitespaces, :calculate_chart

  def calculate_chart
    Charts::CalculateChart.new(self)
  end

  def trim_whitespaces
    self.first_name = self.first_name.strip
    self.middle_name = self.middle_name.strip
    self.last_name = self.last_name.strip
  end

  def first_possessive
    self.first_name + "'s "
  end

  def first_and_last_possessive
    self.first_name + self.last_name + "'s "
  end


end
