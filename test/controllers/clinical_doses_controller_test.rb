require 'test_helper'

class ClinicalDosesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clinical_dose = clinical_doses(:one)
  end

  test "should get index" do
    get clinical_doses_url
    assert_response :success
  end

  test "should get new" do
    get new_clinical_dose_url
    assert_response :success
  end

  test "should create clinical_dose" do
    assert_difference('ClinicalDose.count') do
      post clinical_doses_url, params: { clinical_dose: { drug_id: @clinical_dose.drug_id, max: @clinical_dose.max, min: @clinical_dose.min } }
    end

    assert_redirected_to clinical_dose_url(ClinicalDose.last)
  end

  test "should show clinical_dose" do
    get clinical_dose_url(@clinical_dose)
    assert_response :success
  end

  test "should get edit" do
    get edit_clinical_dose_url(@clinical_dose)
    assert_response :success
  end

  test "should update clinical_dose" do
    patch clinical_dose_url(@clinical_dose), params: { clinical_dose: { drug_id: @clinical_dose.drug_id, max: @clinical_dose.max, min: @clinical_dose.min } }
    assert_redirected_to clinical_dose_url(@clinical_dose)
  end

  test "should destroy clinical_dose" do
    assert_difference('ClinicalDose.count', -1) do
      delete clinical_dose_url(@clinical_dose)
    end

    assert_redirected_to clinical_doses_url
  end
end
