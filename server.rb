require 'sinatra'
require_relative 'public/player'
require_relative 'public/team'

get "/teams" do
  @teams = Team.all
  erb :teams
end

get "/teams/:team_name" do
  @team = params[:team_name]
  @team_name = Team.all.find{|t| t.name == @team}
  erb :team_players
end

get "/positions" do
  @positions = Team.new("Simpson Slammers").players
  erb :positions
end

get "/positions/:position_name" do
  @position_name = params[:position_name]
  @position_players = []
  Player.all.each do |player|
    if player.position == @position_name
      @position_players << player.name
    end
  end
  erb :position_players
end
