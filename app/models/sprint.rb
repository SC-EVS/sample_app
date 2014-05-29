class Sprint < ActiveRecord::Base
  belongs_to :project
  has_many :sprint_teams
  validates :title, presence: true, length: { maximum: 50 }
end
