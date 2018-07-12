class StatesController < ApplicationController
  before_action :set_state, only: [:show, :update, :destroy]

  # GET /states
  def index
    @states = State.all

    render jsonapi: @states, include: [:districts]
  end

  # GET /states/1
  def show
    render jsonapi: @state
  end

  # POST /states
  def create
    @state = State.new(state_params)

    if @state.save
      render jsonapi: @state, status: :created, location: @state
    else
      render jsonapi: @state.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /states/1
  def update
    if @state.update(state_params)
      render jsonapi: @state
    else
      render jsonapi: @state.errors, status: :unprocessable_entity
    end
  end

  # DELETE /states/1
  def destroy
    @state.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def state_params
      params.dig('_jsonapi', 'data', 'attributes').permit('name')
    end
end
