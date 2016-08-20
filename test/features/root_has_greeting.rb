require_relative "../test_helper"

class GreetingPageTest < FeatureTest

  def test_greeting_displayed_properly
    visit '/'
    within('header') do
      assert page.has_content?("Go look at all these amazing robots!!!!!!")
    end
  end

end
