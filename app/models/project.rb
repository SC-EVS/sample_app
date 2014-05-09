class Project < ActiveRecord::Base
  belongs_to :user
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :user_email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
