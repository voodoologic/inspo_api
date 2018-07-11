class PeopleController < ApplicationController
  before_action :set_derp, only: [:show, :update, :destroy]

  # GET /people
  def index
    @peopel = Person.all

    render jsonapi: @people
  end

  # GET /person/1
  def show
    render jsonapi: @person
  end

  # POST /person
  def create
    @person = Person.new(derp_params)

    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /person/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /person/1
  def destroy
    @person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.fetch(:person, {})
    end
end
