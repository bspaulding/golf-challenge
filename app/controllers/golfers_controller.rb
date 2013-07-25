class GolfersController < ApplicationController
  before_action :set_golfer, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /golfers
  # GET /golfers.json
  def index
    respond_with Golfer.all
  end

  # GET /golfers/1
  # GET /golfers/1.json
  def show
    respond_with @golfer
  end

  # POST /golfers
  # POST /golfers.json
  def create
    @golfer = Golfer.new(golfer_params)

    respond_to do |format|
      if @golfer.save
        format.html { redirect_to @golfer, notice: 'Golfer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @golfer }
      else
        format.html { render action: 'new' }
        format.json { render json: @golfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /golfers/1
  # PATCH/PUT /golfers/1.json
  def update
    respond_to do |format|
      if @golfer.update(golfer_params)
        format.html { redirect_to @golfer, notice: 'Golfer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @golfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /golfers/1
  # DELETE /golfers/1.json
  def destroy
    @golfer.destroy
    respond_to do |format|
      format.html { redirect_to golfers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_golfer
      @golfer = Golfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def golfer_params
      params.require(:golfer).permit(:name, :rank)
    end
end
