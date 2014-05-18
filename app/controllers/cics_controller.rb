class CicsController < ApplicationController
  before_action :set_cic, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_entry

  
  def index
    @cics = Cic.all
    @title = "Home"
  end

  def bio
    #@bio = true
    @cic = Cic.find(params[:id])
  end

  # GET /cics/1
  # GET /cics/1.json
  def show
    @cics = Cic.order(:presidency)
    #cic = Cic.find(:presidency)
  end

  # GET /cics/new
  def new
    @cic = Cic.new
  end

  # GET /cics/1/edit
  def edit
  end

  # POST /cics
  # POST /cics.json
  def create
    @cic = Cic.new(cic_params)

    respond_to do |format|
      if @cic.save
        format.html { redirect_to @cic, notice: 'Cic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cic }
      else
        format.html { render action: 'new' }
        format.json { render json: @cic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cics/1
  # PATCH/PUT /cics/1.json
  def update
    respond_to do |format|
      if @cic.update(cic_params)
        format.html { redirect_to @cic, notice: 'Cic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cics/1
  # DELETE /cics/1.json
  def destroy
    @cic.destroy
    respond_to do |format|
      format.html { redirect_to cics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cic
      @cic = Cic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cic_params
      params.require(:cic).permit(:presidency, :president, :took_office, :left_office, :party, :image, :state, :term, :biography)
    end

    def invalid_entry
      logger.error "Attempt to access invalid record #{params[:id]}"
      redirect_to cics_url, notice: 'Invalid record'
    end
end
