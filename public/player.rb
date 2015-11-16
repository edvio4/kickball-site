class Player
  require 'json'

  attr_reader :name , :position, :team_name


  def initialize(name, position , team_name)
    @name = name
    @position = position
    @team_name = team_name
  end

  def self.all
    file = File.read('roster.json')
    my_hash = JSON.parse(file)
    players = []

    my_hash.each do |team, positions|
      positions.each do |position, name|
        players << self.new(name, position, team)
      end
    end

    players
  end
end
