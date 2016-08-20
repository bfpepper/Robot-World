require "bundler"
Bundler.require

APP_ROOT = File.expand_path("..", __dir__)

#load all controllers
Dir.glob(File.join(APP_ROOT, "app", "controllers", "*.rb")) { |file| require file}

#load all models
Dir.glob(File.join(APP_ROOT, "app", "models", "*.rb")) { |file| require file}

class RobotWorldApp < Sinatra::Base

  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")

end
