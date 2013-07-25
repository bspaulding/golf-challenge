class GolferAchievementsController < ApplicationController
  before_action :set_golfer_achievement, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /golfer_achievements
  # GET /golfer_achievements.json
  def index
    respond_with GolferAchievement.all
  end

  # GET /golfer_achievements/1
  # GET /golfer_achievements/1.json
  def show
    respond_with @golfer_achievement
  end

  # POST /golfer_achievements
  # POST /golfer_achievements.json
  def create
    @golfer_achievement = GolferAchievement.new(golfer_achievement_params)

    respond_to do |format|
      if @golfer_achievement.save
        format.json { respond_with @golfer_achievement }
      else
        format.json { render json: @golfer_achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /golfer_achievements/1
  # PATCH/PUT /golfer_achievements/1.json
  def update
    respond_to do |format|
      if @golfer_achievement.update(golfer_achievement_params)
        format.html { redirect_to @golfer_achievement, notice: 'Golfer achievement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @golfer_achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /golfer_achievements/1
  # DELETE /golfer_achievements/1.json
  def destroy
    @golfer_achievement.destroy
    respond_to do |format|
      format.html { redirect_to golfer_achievements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_golfer_achievement
      @golfer_achievement = GolferAchievement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def golfer_achievement_params
      params.require(:golfer_achievement).permit(:golfer_id, :achievement_id)
    end
end
