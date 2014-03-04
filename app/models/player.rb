class Player < ActiveRecord::Base
  belongs_to :team
  
  validates_presence_of :name, :position, :team_id
end
