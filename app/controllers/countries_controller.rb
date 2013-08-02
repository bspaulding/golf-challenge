class CountriesController < ApplicationController
  respond_to :json

  # GET /countries.json
  def index
    respond_with Country.all_cached
  end

  # GET /countries/1.json
  def show
    @country = Country.find(params[:id])
    respond_with @country
  end
end
