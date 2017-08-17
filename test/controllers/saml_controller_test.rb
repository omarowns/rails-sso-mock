require 'test_helper'

class SamlControllerTest < ActionDispatch::IntegrationTest
  test "should get init" do
    get saml_init_url
    assert_response :success
  end

  test "should get consume" do
    get saml_consume_url
    assert_response :success
  end

end
