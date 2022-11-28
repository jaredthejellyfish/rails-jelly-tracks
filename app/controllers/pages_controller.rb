class PagesController < ApplicationController
  def home
    @mmr = Valorant::MMRStats.mmr_data(params[:name], params[:tag])
    @account = Valorant::AccountStats.account_data(params[:name], params[:tag])
    @matches = Valorant::MatchStats.matches_history(params[:name], params[:tag])
    @head_shots, @body_shots, @leg_shots = @matches.accuracy(params[:name], params[:tag])
    @total_shots = @head_shots + @body_shots + @leg_shots
  end
end
