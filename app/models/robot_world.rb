require 'yaml/store'
require_relative "robot"

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << {"id" => database['total'], "name" =>  robot[:name],
                             "city" => robot[:city], "state" => robot[:state],
                             "birthdate" => robot[:birthdate], "date_hired" => robot[:date_hired],
                             "department" => robot[:department]}
    end
  end

  def raw_robots
    database.transaction do
      database["robots"] || []
    end
  end

 def all
   raw_robots.map { |data| Robot.new(data) }
 end

 def update(id, robot_data)
 database.transaction do
   robot = database["robots"].find { |data| data["id"] == id}
   robot["title"] = robot_data[:name]
   robot["description"] = robot_data[:description]
 end
end

end
