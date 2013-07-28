class GolfersController < ApplicationController
  respond_to :json

  # GET /golfers
  # GET /golfers.json
  def index
    respond_with Golfer.all
  end

  # GET /golfers/1
  # GET /golfers/1.json
  def show
    @golfer = Golfer.find(params[:id])
    respond_with @golfer
  end
end
