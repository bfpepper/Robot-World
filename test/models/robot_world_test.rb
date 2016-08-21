require_relative "../test_helper"

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def current_robot_id
    robot_world.all.last.id
  end

  def create_robot
    robot_world.create({:name => "Troy", :city => "Bailey", :state => "CO", :birthdate => "03-14-1987", :date_hired => "3-15-2013", :department => "account managment"})
  end

  def test_robot_is_created
    create_robot
    # robot = robot_world.create({:name => "Troy", :city => "Bailey", :state => "CO", :birthdate => "03-14-1987", :date_hired => "3-15-2013", :department => "account managment"})

    robot = robot_world.find(current_robot_id)

    assert_equal "Troy", robot.name
    assert_equal "Bailey", robot.city
  end

  def test_it_returns_all_robots
    3.times do create_robot
    end

    assert_equal 3, robot_world.all.count
    assert_instance_of Robot, robot_world.all.first
  end

  def test_it_finds_a_robot
    3.times do create_robot
    end

      robot = robot_world.find(current_robot_id)

      assert_instance_of Robot, robot
  end

  def test_it_deletes_a_robt
    # create_robot
    robot_world.create({:name => "Troy", :city => "Bailey", :state => "CO", :birthdate => "03-14-1987", :date_hired => "3-15-2013", :department => "account managment"})

    assert_equal 1, robot_world.all.count

    robot_world.destroy(current_robot_id)
    assert_equal 0, robot_world.all.count
  end

  def test_it_updates_a_robot
    create_robot

    params = { robot: { :name => "Denton", :city => "Chicago", :state => "CO", :birthdate => "03-14-1987", :date_hired => "3-15-2013", :department => "account managment"}}

    robot_world.update(current_robot_id, params[:robot])

    robot = robot_world.find(current_robot_id)

    assert_equal "Denton", robot.name
    assert_equal "Chicago", robot.city
  end

end
