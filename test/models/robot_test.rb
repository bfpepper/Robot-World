require_relative "../test_helper"

class RobotTest < Minitest::Test

  def test_assigns_attributes_correctly
    robot = Robot.new({"name" => "Tiffany", "city" => "San Fran", "state" => "California", "birthdate" => "2-14-16", "date_hired" => "2-15-16", "department" => "sales"})

    assert_equal "Tiffany", robot.name
    assert_equal "San Fran", robot.city
  end

end
