$LOAD_PATH << File.join(File.dirname(__FILE__), '/..')
require 'test_helper'


class DataQualityInterfaceTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "use" do
    get "/admin"
    assert_response :success

    get "/admin/company"
    assert_response :success

    get "/admin/company/1"
    assert_response :success

    get "/admin/company/1/data_quality_view"
    assert_response :success

    get "/admin/company/2/data_quality_view", {:identifier => "01", :not_applicable => :true}
    assert_response :success
    quality_test_state=Company.find_by_id(2).quality_test_states.find_by_identifier("01")
    assert quality_test_state.not_applicable

    get "/admin/company/2/data_quality_view", {:identifier => "01", :not_applicable => :false}
    assert_response :success

    quality_test_state=Company.find_by_id(2).quality_test_states.find_by_identifier("01")
    assert_equal false, quality_test_state.not_applicable
  end
end