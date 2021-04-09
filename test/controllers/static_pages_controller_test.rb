require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get term" do
    get static_pages_term_url
    assert_response :success
  end

end
