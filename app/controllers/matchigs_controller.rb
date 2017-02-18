class MatchigsController < ApplicationController
  before_action :set_matchig, only: [:show, :edit, :update, :destroy]

  # GET /matchigs
  # GET /matchigs.json
  def index
    @matchigs = Matchig.all
  end

  # GET /matchigs/1
  # GET /matchigs/1.json
  def show
  end

  # GET /matchigs/new
  def new
    @matchig = Matchig.new
  end

  # GET /matchigs/1/edit
  def edit
  end

  # POST /matchigs
  # POST /matchigs.json
  def create
    @matchig = Matchig.new(matchig_params)

    respond_to do |format|
      if @matchig.save
        format.html { redirect_to @matchig, notice: 'Matchig was successfully created.' }
        format.json { render :show, status: :created, location: @matchig }
      else
        format.html { render :new }
        format.json { render json: @matchig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matchigs/1
  # PATCH/PUT /matchigs/1.json
  def update
    respond_to do |format|
      if @matchig.update(matchig_params)
        format.html { redirect_to @matchig, notice: 'Matchig was successfully updated.' }
        format.json { render :show, status: :ok, location: @matchig }
      else
        format.html { render :edit }
        format.json { render json: @matchig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matchigs/1
  # DELETE /matchigs/1.json
  def destroy
    @matchig.destroy
    respond_to do |format|
      format.html { redirect_to matchigs_url, notice: 'Matchig was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matchig
      @matchig = Matchig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matchig_params
      params.fetch(:matchig, {})
    end
end
