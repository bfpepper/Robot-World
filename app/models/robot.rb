require "pry"


class Robot
  attr_reader :name, :city, :state, :birthdate, :date_hired, :department, :id,
              :avatar

  def initialize(data)
    @id = data["id"]
    @name = data["name"]
    @city = data["city"]
    @state = data["state"]
    @birthdate = data["birthdate"]
    @date_hired = data["date_hired"]
    @department = data["department"]
    @avatar = "<img src=\"https://robohash.org/#{name}.png\">"
  end

end
