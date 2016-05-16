class Survey < ActiveRecord::Base
  has_one :selfevaluation
  has_many :participantions
  has_many :evaluations, through: :participations
  has_many :questions, through: :assessments

  accepts_nested_attributes_for :evaluations
  accepts_nested_attributes_for :participantions

  belongs_to :user
  belongs_to :assessment
end
