require 'test_helper'

class ProtocolDrugsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @protocol_drug = protocol_drugs(:one)
  end

  test "should get index" do
    get protocol_drugs_url
    assert_response :success
  end

  test "should get new" do
    get new_protocol_drug_url
    assert_response :success
  end

  test "should create protocol_drug" do
    assert_difference('ProtocolDrug.count') do
      post protocol_drugs_url, params: { protocol_drug: { additional_analgesic: @protocol_drug.additional_analgesic, dose: @protocol_drug.dose, drug_id: @protocol_drug.drug_id, protocol_id: @protocol_drug.protocol_id } }
    end

    assert_redirected_to protocol_drug_url(ProtocolDrug.last)
  end

  test "should show protocol_drug" do
    get protocol_drug_url(@protocol_drug)
    assert_response :success
  end

  test "should get edit" do
    get edit_protocol_drug_url(@protocol_drug)
    assert_response :success
  end

  test "should update protocol_drug" do
    patch protocol_drug_url(@protocol_drug), params: { protocol_drug: { additional_analgesic: @protocol_drug.additional_analgesic, dose: @protocol_drug.dose, drug_id: @protocol_drug.drug_id, protocol_id: @protocol_drug.protocol_id } }
    assert_redirected_to protocol_drug_url(@protocol_drug)
  end

  test "should destroy protocol_drug" do
    assert_difference('ProtocolDrug.count', -1) do
      delete protocol_drug_url(@protocol_drug)
    end

    assert_redirected_to protocol_drugs_url
  end
end
