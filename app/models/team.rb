class Team < ActiveRecord::Base

  has_many :players

  validates_presence_of :name
  validates_uniqueness_of :name

  def distinct_positions
    Player.where(:team_id => id).distinct.count(:position)
  end

end
