class Survey < ActiveRecord::Base
  has_one :selfevaluation
  has_many :evaluations, through: :participations
  has_many :questions, through: :assessments

  belongs_to :user
  belongs_to :assessment
end
