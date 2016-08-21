require_relative "../test_helper"

class UserSeesAllTasksTest < FeatureTest

  def test_user_sees_all_robots
    robot_world.create({name: "Jazzy", city: "Tacoma", state: "Washington", birthdata: "12-13-12", date_hired: "11-11-11", department: "sales"})
    robot_world.create({name: "Parker", city: "Sandwhich", state: "New Hampshire", birthdata: "1-13-10", date_hired: "12-12-12", department: "accounting"})

    visit '/robots'

    save_and_open_page

    assert page.has_content?("Jazzy")
    assert page.has_content?("Parker")
  end

end
