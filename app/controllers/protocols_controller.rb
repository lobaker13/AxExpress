class ProtocolsController < ApplicationController
  before_action :set_protocol, only: [:show, :edit, :update, :destroy]

  # GET /protocols
  # GET /protocols.json
  def index
    # @protocols = Protocol.all
    @patients = Patient.all
  end

  # GET /protocols/1
  # GET /protocols/1.json
  def show
  end

  # GET /protocols/new
  def new
    @protocol = Protocol.new
  end

  # GET /protocols/1/edit
  def edit
  end

  # POST /protocols
  # POST /protocols.json
  def create
    @protocol = Protocol.new(protocol_params)
    @procedure = Procedure.find(params[:procedure_id])

    @protocol.weight = @protocol.patient.weight unless @protocol.weight
    @protocol.age = (Date.today - @protocol.patient.dob) / 365 unless @protocol.age
    @protocol.bcs = @protocol.patient.risks.first.bcs unless @protocol.bcs
    @protocol.asa = @protocol.patient.risks.first.asa unless @protocol.asa

    ## Add drugs as necessary (business rules)



    Protocol.transaction do
      @protocol.save
      @protocol_drug = ProtocolDrug.new(protocol_id: @protocol.id)
      case @procedure.name
      when "Tibial plateau leveling osteotomy"
        @protocol.add_drug(1)
        @protocol.add_drug(7)
      # another procedure
    # when ""
      end


  end #transaction
    # nullable_params.each do |param|
    #   unless protocol_params[:protocol][param]
    #     case param
    #     when :weight then @protocol.patient.weight
    #     when :age then Date.today - @protocol.patient.dob
    #     when :bcs then @protocol.patient.risks.first.bcs
    #     when :asa then @protocol.patient.risks.first.asa
    #     end
    #   end
    # end

    respond_to do |format|
      if @protocol.id
        format.html { redirect_to @protocol, notice: 'Protocol was successfully created.' }
        format.json { render :show, status: :created, location: @protocol }
      else
        format.html { render :new }
        format.json { render json: @protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /protocols/1
  # PATCH/PUT /protocols/1.json
  def update
    respond_to do |format|
      if @protocol.update(protocol_params)
        format.html { redirect_to @protocol, notice: 'Protocol was successfully updated.' }
        format.json { render :show, status: :ok, location: @protocol }
      else
        format.html { render :edit }
        format.json { render json: @protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /protocols/1
  # DELETE /protocols/1.json
  def destroy
    @protocol.destroy
    respond_to do |format|
      format.html { redirect_to protocols_url, notice: 'Protocol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def nullable_params
      [:weight, :age, :asa, :bsc]
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_protocol
      @protocol = Protocol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def protocol_params
      params.require(:protocol).permit(:weight, :age, :asa, :bsc, :alert, :patient_id)
    end
end
