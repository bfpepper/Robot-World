require 'yaml/store'
require_relative "robot"

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def raw_robots
    database.transaction do
      database["robots"] || []
    end
  end

 def all
   raw_robots.map { |data| Robot.new(data) }
 end


end
