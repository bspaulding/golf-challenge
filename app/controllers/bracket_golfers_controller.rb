class BracketGolfersController < ApplicationController
  before_action :set_bracket_golfer, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /bracket_golfers
  # GET /bracket_golfers.json
  def index
    respond_with BracketGolfer.all
  end

  # GET /bracket_golfers/1
  # GET /bracket_golfers/1.json
  def show
    respond_with @bracket_golfer
  end

  # POST /bracket_golfers
  # POST /bracket_golfers.json
  def create
    @bracket_golfer = BracketGolfer.new(bracket_golfer_params)

    respond_to do |format|
      if @bracket_golfer.save
        format.json { respond_with @bracket_golfer }
      else
        format.json { render json: @bracket_golfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bracket_golfers/1
  # PATCH/PUT /bracket_golfers/1.json
  def update
    respond_to do |format|
      if @bracket_golfer.update(bracket_golfer_params)
        format.html { redirect_to @bracket_golfer, notice: 'Bracket golfer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bracket_golfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bracket_golfers/1
  # DELETE /bracket_golfers/1.json
  def destroy
    @bracket_golfer.destroy
    respond_to do |format|
      format.html { redirect_to bracket_golfers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bracket_golfer
      @bracket_golfer = BracketGolfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bracket_golfer_params
      params.require(:bracket_golfer).permit(:bracket_id, :golfer_id, :integer)
    end
end
