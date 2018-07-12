class DistrictsController < ApplicationController
  before_action :set_district, only: [:show, :update, :destroy]

  # GET /districts
  def index
    @districts = District.all

    render jsonapi: @districts, include: [:state, :people]
  end

  # GET /districts/1
  def show
    render jsonapi: @district, include: [:state, :people],
      fields: { people: [:first_name, :last_name, :roles] }
  end

  # POST /districts
  def create
    @district = District.new(district_params)

    if @district.save
      render jsonapi: @district, status: :created, location: @district
    else
      render jsonapi: @district.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /districts/1
  def update
    if @district.update(district_params)
      render jsonapi: @district
    else
      render jsonapi: @district.errors, status: :unprocessable_entity
    end
  end

  # DELETE /districts/1
  def destroy
    @district.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district
      @district = District.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def district_params
      params.dig('_jsonapi', 'data', 'attributes').permit('name')
    end
end
