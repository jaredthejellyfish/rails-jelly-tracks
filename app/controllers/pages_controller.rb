class PagesController < ApplicationController
  def home
    @mmr = Valorant::MMRStats.mmr_data(params[:name], params[:tag])
    @account = Valorant::AccountStats.account_data(params[:name], params[:tag])
    @matches = Valorant::MatchStats.matches_history(params[:name], params[:tag])
    @leg_shots, @head_shots, @body_shots = stats_from_matches(@matches)
  end

  private

  def stats_from_matches(_matches)
    leg_shots = 0
    head_shots = 0
    body_shots = 0
    @matches.matches.each do |match|
      match.all_players.each do |player|
        next unless player.name == params[:name] && player.tag == params[:tag]

        leg_shots += player.legshots
        head_shots += player.headshots
        body_shots += player.bodyshots
      end
    end
    return leg_shots, head_shots, body_shots
  end
end
