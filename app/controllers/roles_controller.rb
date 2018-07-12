class RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy]

  # GET /roles
  def index
    @roles = Role.all

    render jsonapi: @roles
  end

  # GET /roles/1
  def show
    render jsonapi: @role
  end

  # POST /roles
  def create
    @role = Role.new(role_params)

    if @role.save
      render jsonapi: @role, status: :created, location: @role
    else
      render jsonapi: @role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /roles/1
  def update
    if @role.update(role_params)
      render jsonapi: @role
    else
      render jsonapi: @role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /roles/1
  def destroy
    @role.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def role_params
      params.dig('_jsonapi', 'data', 'attributes').permit('name')
    end
end
