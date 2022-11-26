class PagesController < ApplicationController
  def home
    @mmr = Valorant::MMRStats.mmr_data("jaredthejelly", "yours")
  end
end
