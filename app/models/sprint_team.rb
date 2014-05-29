class SprintTeam < ActiveRecord::Base
  belongs_to :backlog_item
  belongs_to :sprint
end
