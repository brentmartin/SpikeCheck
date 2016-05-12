class Participation < ActiveRecord::Base
  has_many :evaluations
  has_many :questions, through: :evalutions

  belongs_to :user
  belongs_to :survey
end
