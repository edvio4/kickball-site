require_relative "player"
require "pry"
class Team
  attr_reader :name

  file = File.read('roster.json')
  @@my_hash = JSON.parse(file)

  def initialize(name)
    @name = name
  end

  def self.all

    teams = []

    @@my_hash.each do |team, positions|
        teams << self.new(team)
    end

    teams
  end

  def players
      players = []

      @@my_hash.each do |team, positions|
        positions.each do |position, name|
          if team == @name
            players << Player.new(name, position, team)
          end
        end
      end

    players

  end
end
