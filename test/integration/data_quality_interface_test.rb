$LOAD_PATH << File.join(File.dirname(__FILE__), '/..')
require 'test_helper'


class DataQualityInterfaceTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "sites can be requested" do
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

    assert_raises(ActionController::RoutingError) do
      assert_recognizes({}, "/person/1/data_quality_view")
    end
  end

  test "the response content" do
    get "/admin/company/1/data_quality_view"

    assert_select "li.data_quality_view_member_link" # test icon shows up in actions bar

    assert_select ".railsadmin_quality" do  # main div is there
      assert_select "tbody tr", 6 do |trs| #test that there is a row for each test
        trs.each do |t|
          assert_select t,"td", 6 do |tds| # every row should have 6 columns
             assert_select tds[5],"input[type=submit][value=?]", "Not Applicable"  if(tds[2].select "span:content(Fail)").any? # test that there is an not applicable button if the test failed
             assert_select tds[5],"input[type=submit][value=?]", "Applicable"  if(tds[2].select "span:content(Not applicable)").any? # test that there is an applicable button if the test was et to not applicable
          end
        end
      end
    end


  end
end