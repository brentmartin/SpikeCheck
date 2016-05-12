class User < ActiveRecord::Base
  has_many :surveys
  has_many :participations

  has_secure_password
end
