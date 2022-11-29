class PagesController < ApplicationController
  def home
    @mmr = Valorant::MMRStats.mmr_data(params[:name], params[:tag])
    @account = Valorant::AccountStats.account_data(params[:name], params[:tag])
    @matches = Valorant::MatchStats.matches_history(params[:name], params[:tag], filter: 'competitive')
    @head_shots, @body_shots, @leg_shots = @matches.accuracy(params[:name], params[:tag])
    @total_shots = @head_shots + @body_shots + @leg_shots
    @most_played = @matches.most_played(params[:name], params[:tag])
    @agent_images = Valorant::Misc.content.agent_images(@most_played)
  end

  def stats
  end

end
