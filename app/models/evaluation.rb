class Evaluation < ActiveRecord::Base
  belongs_to :participation
  belongs_to :question

  validates :question_id, presence: true
end
