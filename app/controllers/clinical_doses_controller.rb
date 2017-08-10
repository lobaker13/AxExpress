class ClinicalDosesController < ApplicationController
  before_action :set_clinical_dose, only: [:show, :edit, :update, :destroy]

  # GET /clinical_doses
  # GET /clinical_doses.json
  def index
    @clinical_doses = ClinicalDose.all
  end

  # GET /clinical_doses/1
  # GET /clinical_doses/1.json
  def show
  end

  # GET /clinical_doses/new
  def new
    @clinical_dose = ClinicalDose.new
  end

  # GET /clinical_doses/1/edit
  def edit
  end

  # POST /clinical_doses
  # POST /clinical_doses.json
  def create
    @clinical_dose = ClinicalDose.new(clinical_dose_params)

    respond_to do |format|
      if @clinical_dose.save
        format.html { redirect_to @clinical_dose, notice: 'Clinical dose was successfully created.' }
        format.json { render :show, status: :created, location: @clinical_dose }
      else
        format.html { render :new }
        format.json { render json: @clinical_dose.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinical_doses/1
  # PATCH/PUT /clinical_doses/1.json
  def update
    respond_to do |format|
      if @clinical_dose.update(clinical_dose_params)
        format.html { redirect_to @clinical_dose, notice: 'Clinical dose was successfully updated.' }
        format.json { render :show, status: :ok, location: @clinical_dose }
      else
        format.html { render :edit }
        format.json { render json: @clinical_dose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinical_doses/1
  # DELETE /clinical_doses/1.json
  def destroy
    @clinical_dose.destroy
    respond_to do |format|
      format.html { redirect_to clinical_doses_url, notice: 'Clinical dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinical_dose
      @clinical_dose = ClinicalDose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinical_dose_params
      params.require(:clinical_dose).permit(:min, :max, :drug_id)
    end
end
