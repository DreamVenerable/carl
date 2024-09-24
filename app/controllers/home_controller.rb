class HomeController < ApplicationController
  def index
    @vehicle_makes = VehicleMake.all
    @vehicle_models = [] # Initialize as empty array
    @vehicle_years = []  # Initialize as empty array
    @engines = []        # Initialize as empty array
    @origins = []        # Initialize as empty array

    # Check for parameters to load models based on selected make
    if params[:vehicle_make_id].present?
      @vehicle_models = VehicleModel.where(vehicle_make_id: params[:vehicle_make_id])
    end

    # Check for parameters to load years based on selected model
    if params[:vehicle_model_id].present?
      @vehicle_years = VehicleYear.where(vehicle_model_id: params[:vehicle_model_id])
    end

    # Check for parameters to load engines based on selected model and year
    if params[:vehicle_model_id].present? && params[:vehicle_year_id].present?
      @engines = Engine.where(vehicle_model_id: params[:vehicle_model_id], vehicle_year_id: params[:vehicle_year_id])
    end

    # Load origins based on selected model and year
    if params[:vehicle_model_id].present? && params[:vehicle_year_id].present?
      @origins = Origin.joins(:fitments)
                       .where(fitments: { vehicle_model_id: params[:vehicle_model_id], vehicle_year_id: params[:vehicle_year_id] })
                       .distinct
    end

    # Search for products that match the selected engine, vehicle fitments, and origin
    if params[:engine_id].present? && params[:origin_id].present?
      @products = Product.joins(:fitments)
                         .where(fitments: { engine_id: params[:engine_id], vehicle_model_id: params[:vehicle_model_id], vehicle_year_id: params[:vehicle_year_id], origin_id: params[:origin_id] })
                         .distinct
    else
      @products = []
    end
  end

  def models
    @vehicle_models = VehicleModel.where(vehicle_make_id: params[:vehicle_make_id])
    @vehicle_years = []
    @engines = []
    @origins = [] # Reset origins
    render :index
  end

  def years
    @vehicle_models = VehicleModel.where(vehicle_make_id: params[:vehicle_make_id])
    @vehicle_years = VehicleYear.where(vehicle_model_id: params[:vehicle_model_id])
    @engines = []
    @origins = [] # Reset origins
    render :index
  end

  def engines
    @vehicle_models = VehicleModel.where(vehicle_make_id: params[:vehicle_make_id])
    @vehicle_years = VehicleYear.where(vehicle_model_id: params[:vehicle_model_id])
    @engines = Engine.where(vehicle_model_id: params[:vehicle_model_id], vehicle_year_id: params[:vehicle_year_id])
    @origins = [] # Reset origins
    render :index
  end

  def search
    @vehicle_makes = VehicleMake.all
    @vehicle_models = VehicleModel.where(vehicle_make_id: params[:vehicle_make_id])
    @vehicle_years = VehicleYear.where(vehicle_model_id: params[:vehicle_model_id])
    @engines = Engine.where(vehicle_model_id: params[:vehicle_model_id], vehicle_year_id: params[:vehicle_year_id])

    # Load origins based on the selected model and year
    if params[:vehicle_model_id].present? && params[:vehicle_year_id].present?
      @origins = Origin.joins(:fitments)
                       .where(fitments: { vehicle_model_id: params[:vehicle_model_id], vehicle_year_id: params[:vehicle_year_id] })
                       .distinct
    end

    # Search for products that match the selected engine, vehicle fitments, and origin
    if params[:engine_id].present? && params[:origin_id].present?
      @products = Product.joins(:fitments)
                         .where(fitments: { engine_id: params[:engine_id], vehicle_model_id: params[:vehicle_model_id], vehicle_year_id: params[:vehicle_year_id], origin_id: params[:origin_id] })
                         .distinct
    else
      @products = []
    end

    render :index
  end
end
