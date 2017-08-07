require 'test_helper'

class PatientProceduresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_procedure = patient_procedures(:one)
  end

  test "should get index" do
    get patient_procedures_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_procedure_url
    assert_response :success
  end

  test "should create patient_procedure" do
    assert_difference('PatientProcedure.count') do
      post patient_procedures_url, params: { patient_procedure: { patient_id: @patient_procedure.patient_id, procedure_id: @patient_procedure.procedure_id } }
    end

    assert_redirected_to patient_procedure_url(PatientProcedure.last)
  end

  test "should show patient_procedure" do
    get patient_procedure_url(@patient_procedure)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_procedure_url(@patient_procedure)
    assert_response :success
  end

  test "should update patient_procedure" do
    patch patient_procedure_url(@patient_procedure), params: { patient_procedure: { patient_id: @patient_procedure.patient_id, procedure_id: @patient_procedure.procedure_id } }
    assert_redirected_to patient_procedure_url(@patient_procedure)
  end

  test "should destroy patient_procedure" do
    assert_difference('PatientProcedure.count', -1) do
      delete patient_procedure_url(@patient_procedure)
    end

    assert_redirected_to patient_procedures_url
  end
end
