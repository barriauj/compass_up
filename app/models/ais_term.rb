class AisTerm < ActiveRecord::Base
  attr_accessible :effective_on, :fall, :spring, :summer
  
  validates :effective_on, uniqueness: true
  validates :effective_on, timeliness: { type: :date }  
  validates :effective_on, :fall, :spring, :summer, presence: true
  validates :fall, :spring, :summer, length: { is: 6 }
  validates :fall, :spring, :summer, numericality: { only_integer: true }
  validate :spring_summer_and_fall_must_be_same_year
  
  default_scope order('effective_on DESC')
  
  def self.current
    where('effective_on <= ?', Date.today).first
  end
  
  def is_current?
    self.eql?(AisTerm.current)
  end
  
  def spring_summer_and_fall_must_be_same_year
    year = spring[0..3]
    unless summer.start_with?(year) && fall.start_with?(year)
      errors.add(:spring, "Summer and Fall must be same year")
    end
  end
  
end
