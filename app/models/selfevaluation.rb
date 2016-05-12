class Selfevaluation < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question

  validates :question_id, presence: true
end
