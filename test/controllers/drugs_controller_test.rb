require 'test_helper'

class DrugsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drug = drugs(:one)
  end

  test "should get index" do
    get drugs_url
    assert_response :success
  end

  test "should get new" do
    get new_drug_url
    assert_response :success
  end

  test "should create drug" do
    assert_difference('Drug.count') do
      post drugs_url, params: { drug: { adverse: @drug.adverse, category: @drug.category, class: @drug.class, commercial_name: @drug.commercial_name, concentration: @drug.concentration, name: @drug.name, pronunciation: @drug.pronunciation, route_of_admin: @drug.route_of_admin } }
    end

    assert_redirected_to drug_url(Drug.last)
  end

  test "should show drug" do
    get drug_url(@drug)
    assert_response :success
  end

  test "should get edit" do
    get edit_drug_url(@drug)
    assert_response :success
  end

  test "should update drug" do
    patch drug_url(@drug), params: { drug: { adverse: @drug.adverse, category: @drug.category, class: @drug.class, commercial_name: @drug.commercial_name, concentration: @drug.concentration, name: @drug.name, pronunciation: @drug.pronunciation, route_of_admin: @drug.route_of_admin } }
    assert_redirected_to drug_url(@drug)
  end

  test "should destroy drug" do
    assert_difference('Drug.count', -1) do
      delete drug_url(@drug)
    end

    assert_redirected_to drugs_url
  end
end
