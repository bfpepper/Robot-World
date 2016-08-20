require_relative "../test_helper"

class UserCanCreeateANewRobot < FeatureTest

  def test_a_user_can_create_a_new_robot
    visit '/'
    click_link('Want to add more robots?')
    assert_equal "/robots/new", current_path
    fill_in('robot[name]', :with => 'Alex')
    fill_in('robot[city]', :with => 'Seattle')
    fill_in('robot[state]', :with => 'Washington')
    fill_in('robot[birthdate]', :with => '12-29-1980')
    fill_in('robot[date_hired]', :with => '1-16-2017')
    fill_in('robot[department]', :with => 'Dev')
    click_on('Submit')
    assert_equal "/robots", current_path
    assert page.has_content?("Alex")
    save_and_open_page
  end

end
