class CompetitionTeamsController < ApplicationController 
  def create 
    competition_team = CompetitionTeam.new(competition_id: params[:competition_id], team_id: Team.get_id(params[:nickname]))
    competition_team.save
    redirect_to competition_path(params[:competition_id])
  end 
end 