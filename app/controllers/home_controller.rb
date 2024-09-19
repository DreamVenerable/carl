class HomeController < ApplicationController
  def index
    @vehicle_makes = VehicleMake.all
    @models = params[:make_id] ? VehicleModel.where(vehicle_make_id: params[:make_id]) : []
    @years = params[:model_id] ? VehicleYear.where(vehicle_model_id: params[:model_id]) : []
    @engines = params[:year_id] ? Engine.where(vehicle_model_id: params[:model_id], vehicle_year_id: params[:year_id]) : []
    @fitments = params[:engine_id] ? Fitment.joins(product: :part)
                                        .where(vehicle_year_id: params[:year_id], vehicle_model_id: params[:model_id], engine_id: params[:engine_id]) : []
  end
end
