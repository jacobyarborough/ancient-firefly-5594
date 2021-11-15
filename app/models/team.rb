class Team < ApplicationRecord
  has_many :players
  has_many :competition_teams 
  has_many :competitions, through: :competition_teams

  def self.get_id(nickname)
    where(nickname: nickname)[0].id
  end 

  def self.order_by_age
    joins(:players).select('teams.*, avg(players.age) as avg_age').group(:id).order('avg_age desc')
  end 
end
