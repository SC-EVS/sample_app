class BacklogItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :sprint_backlog_items
  has_many :sprint_teams
end
