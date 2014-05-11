class Project < ActiveRecord::Base
  belongs_to :user
  has_many :teams
  has_many :backlog_items
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :user_email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :project_url, uniqueness: { case_sensitive: false }
end
