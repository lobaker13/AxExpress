class PatientProceduresController < ApplicationController
  before_action :set_patient_procedure, only: [:show, :edit, :update, :destroy]

  # GET /patient_procedures
  # GET /patient_procedures.json
  def index
    @patient_procedures = PatientProcedure.all
  end

  # GET /patient_procedures/1
  # GET /patient_procedures/1.json
  def show
  end

  # GET /patient_procedures/new
  def new
    @patient_procedure = PatientProcedure.new
  end

  # GET /patient_procedures/1/edit
  def edit
  end

  # POST /patient_procedures
  # POST /patient_procedures.json
  def create
    @patient_procedure = PatientProcedure.new(patient_procedure_params)

    respond_to do |format|
      if @patient_procedure.save
        format.html { redirect_to @patient_procedure, notice: 'Patient procedure was successfully created.' }
        format.json { render :show, status: :created, location: @patient_procedure }
      else
        format.html { render :new }
        format.json { render json: @patient_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_procedures/1
  # PATCH/PUT /patient_procedures/1.json
  def update
    respond_to do |format|
      if @patient_procedure.update(patient_procedure_params)
        format.html { redirect_to @patient_procedure, notice: 'Patient procedure was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient_procedure }
      else
        format.html { render :edit }
        format.json { render json: @patient_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_procedures/1
  # DELETE /patient_procedures/1.json
  def destroy
    @patient_procedure.destroy
    respond_to do |format|
      format.html { redirect_to patient_procedures_url, notice: 'Patient procedure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_procedure
      @patient_procedure = PatientProcedure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_procedure_params
      params.require(:patient_procedure).permit(:procedure_id, :patient_id)
    end
end
