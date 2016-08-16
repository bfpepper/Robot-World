require 'models/robot_world'
require "pry"

class RobotWorldApp < Sinatra::Base

  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get "/robots" do
    @robots = robot_world.all
    erb :index
  end

  def robot_world
    database = YAML::Store.new('db/robot_world')
    @robot_world ||= RobotWorld.new(database)
  end

end
